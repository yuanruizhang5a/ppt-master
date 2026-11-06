<!-- ppt-master-schema: spec-lock/v1 -->
# Execution Lock

## canvas
- viewBox: 0 0 1280 720
- format: PPT 16:9

## communication
- primary_language: zh-CN
- audience: 形式化验证与机密计算项目评审人员，以及实施和验收研发团队
- objective: 通过图解说明方案边界、验证链、模型属性和实施指标，使听众能够判断方案如何落地并据此完成验收
- core_message: 从真实 Rust 内核剥离顺序 safe Rust 安全策略，经 Charon 与 Aeneas 转为 Rocq 模型，以页面管理案例证明隔离、完整性和防泄露并形成可复现交付
- consumption_mode: balanced

## mode
- mode: custom
- mode_references: instructional, pyramid
- mode_behavior: 保持原文的研究逻辑顺序，每页先给出可复述判断，再以一张主图逐步解释对象、关系、证明与验收，从问题界定连续推进到工具链、状态模型、最小案例和实施指标。

## visual_style
- visual_style: custom
- visual_style_references: swiss-minimal, blueprint
- visual_style_behavior: 采用纯白默认背景和严格模块网格；工程蓝图语言只用于前景细线框、连接、端点、编号和技术标注，不使用背景网格、底纹、渐变、阴影或装饰性背景；每页由一张主关系图承担视觉重心。

## colors
- background: #FFFFFF
- secondary_bg: #F3F6F8
- primary: #153A5B
- accent: #E28A22
- secondary_accent: #0E7490
- body_text: #18212B
- grid: #CCD8E2

## typography
- font_family: Microsoft YaHei, Arial, sans-serif
- title_family: Microsoft YaHei, Arial, sans-serif
- body_family: Microsoft YaHei, Arial, sans-serif
- code_family: Consolas, Microsoft YaHei, Arial, monospace
- body: 24
- title: 44
- subtitle: 32
- annotation: 18

## icons
- library: tabler-outline
- stroke_width: 2
- inventory: tabler-outline/shield-check, tabler-outline/lock, tabler-outline/file-code, tabler-outline/route, tabler-outline/checklist, tabler-outline/alert-triangle, simple-icons/rust

## page_rhythm
- P01: anchor
- P02: dense
- P03: dense
- P04: dense
- P05: anchor

## pptx_structure
- mode: flat

## forbidden
- `mask`, `<style>`, `class`, external CSS, `<foreignObject>`, `textPath`, `@font-face`, `<animate*>`, `<set>`, `<script>` / event attributes, `<iframe>`
- HTML named entities in text; write typography as raw Unicode and escape XML reserved characters
- Every slide must use a solid `#FFFFFF` page background; no background image, texture, background grid, gradient, scrim, shadow, decorative backdrop, or full-canvas color field
- No bitmap or external image placement; every graph and technical figure must be rebuilt as native editable SVG geometry and text
