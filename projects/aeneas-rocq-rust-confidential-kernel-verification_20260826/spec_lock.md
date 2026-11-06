<!-- ppt-master-schema: spec-lock/v1 -->
# Execution Lock

## canvas
- viewBox: 0 0 1280 720
- format: PPT 16:9

## communication
- primary_language: zh-CN
- audience: 项目评审与结题验收人员、课题负责人，以及了解 Rust 或形式化验证基础的技术决策者
- objective: 在五页内概括验证边界、技术路线、证明闭环与验收指标，使听众能准确判断方案的可行性、实施范围和可验收性。
- core_message: 把顺序 safe Rust 安全策略从底层机制中剥离，经 Charon 与 Aeneas 转换为 Rocq 模型，可在明确可信边界下完成页面访问、回收和重分配的可机器检查证明。
- consumption_mode: balanced

## mode
- mode: custom
- mode_references: pyramid, instructional
- mode_behavior: 先给出“范围可控、可证明、可验收”的结论，再按验证边界、转换与建模、安全证明、实施验收的依赖顺序展开；标题使用判断句，每页回答一个评审问题并为下一页提供必要前提。

## visual_style
- visual_style: custom
- visual_style_references: swiss-minimal, blueprint
- visual_style_behavior: 所有页面保持纯白默认背景，不添加背景图片、纹理、整页网格、渐变或阴影；使用精确栅格、大留白和少量大尺度几何，仅在技术结构图中使用工程制图式细线、端点、连接与注释，强调色只标记证明路径、可信边界和验收结论。

## colors
- background: #FFFFFF
- secondary_bg: #F3F6FA
- primary: #123B5D
- accent: #F59E0B
- secondary_accent: #167D9A
- body_text: #1B2430
- surface: #F3F6FA
- grid: #D7E0E8

## typography
- font_family: Microsoft YaHei, Arial, sans-serif
- title_family: Microsoft YaHei, Arial, sans-serif
- body_family: Microsoft YaHei, Arial, sans-serif
- code_family: Consolas, Microsoft YaHei, Arial, monospace
- body: 24
- title: 44
- subtitle: 32
- annotation: 18
- code: 20

## icons
- library: tabler-outline
- stroke_width: 2
- inventory: tabler-outline/shield-check, tabler-outline/lock, tabler-outline/file-code, tabler-outline/route, tabler-outline/checklist, tabler-outline/alert-triangle, simple-icons/rust

## page_rhythm
- P01: anchor
- P02: breathing
- P03: dense
- P04: dense
- P05: anchor

## pptx_structure
- mode: flat

## forbidden
- `mask`, `<style>`, `class`, external CSS, `<foreignObject>`, `textPath`, `@font-face`, `<animate*>`, `<set>`, `<script>` / event attributes, `<iframe>`
- HTML named entities in text; write typography as raw Unicode and escape XML reserved characters
