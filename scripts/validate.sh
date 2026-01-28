#!/bin/bash
#
# Vibe Coding Team 文档验证脚本
# 用于检查文档一致性和链接有效性
#

set -e

echo "🔍 Vibe Coding Team 文档验证"
echo "=============================="

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0
WARNINGS=0

# 检查文件是否存在
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✓${NC} 文件存在: $1"
        return 0
    else
        echo -e "${RED}✗${NC} 文件缺失: $1"
        ((ERRORS++))
        return 1
    fi
}

# 检查必需文件
echo ""
echo "📁 检查必需文件..."
check_file "SKILL.md"
check_file "README.md"
check_file "QUICK_REFERENCE.md"
check_file "CHANGELOG.md"
check_file "CONTRIBUTING.md"
check_file "LICENSE"

# 检查 examples 目录结构
echo ""
echo "📁 检查示例目录..."
if [ -d "examples/quick-start" ]; then
    echo -e "${GREEN}✓${NC} examples/quick-start/ 存在"
else
    echo -e "${YELLOW}⚠${NC} examples/quick-start/ 不存在"
    ((WARNINGS++))
fi

if [ -d "examples/best-practices" ]; then
    echo -e "${GREEN}✓${NC} examples/best-practices/ 存在"
else
    echo -e "${YELLOW}⚠${NC} examples/best-practices/ 不存在"
    ((WARNINGS++))
fi

if [ -d "examples/project-examples" ]; then
    echo -e "${GREEN}✓${NC} examples/project-examples/ 存在"
else
    echo -e "${YELLOW}⚠${NC} examples/project-examples/ 不存在"
    ((WARNINGS++))
fi

# 检查 Markdown 语法（简单检查）
echo ""
echo "📝 检查 Markdown 文件..."

# 检查 SKILL.md 的 YAML 头
if head -5 SKILL.md | grep -q "^---"; then
    echo -e "${GREEN}✓${NC} SKILL.md 有 YAML 头部"
else
    echo -e "${YELLOW}⚠${NC} SKILL.md 缺少 YAML 头部"
    ((WARNINGS++))
fi

# 检查触发词一致性
echo ""
echo "🔗 检查文档一致性..."

# 从 SKILL.md 提取 Agent 名称
AGENTS=$(grep "^###.*Vibe" SKILL.md | sed 's/### //g' | tr '\n' '|' | sed 's/|$//')
if [ -n "$AGENTS" ]; then
    echo -e "${GREEN}✓${NC} 在 SKILL.md 找到 Agents: $AGENTS"
else
    echo -e "${YELLOW}⚠${NC} 未在 SKILL.md 找到 Agent 定义"
    ((WARNINGS++))
fi

# 检查 README 中的项目结构图是否匹配实际目录
echo ""
echo "📊 检查项目结构..."
if grep -q "vibe-coding-team/" README.md; then
    echo -e "${GREEN}✓${NC} README.md 包含项目结构"
else
    echo -e "${YELLOW}⚠${NC} README.md 缺少项目结构"
    ((WARNINGS++))
fi

# 总结
echo ""
echo "=============================="
echo "📋 验证结果"
echo "=============================="

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ 所有检查通过！${NC}"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠ 有 $WARNINGS 个警告${NC}"
    exit 0
else
    echo -e "${RED}✗ 有 $ERRORS 个错误，$WARNINGS 个警告${NC}"
    exit 1
fi
