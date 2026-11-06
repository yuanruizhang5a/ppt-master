<!-- ppt-master-schema: design-spec/v1 -->
# 基于 Aeneas 与 Rocq 的 Rust 机密计算内核形式化验证方案 - Design Spec

## I. Project Information

| Item | Value |
| --- | --- |
| Project Name | 基于 Aeneas 与 Rocq 的 Rust 机密计算内核形式化验证方案 |
| Canvas Format | PPT 16:9，1280 × 720 |
| Page Count | 5 |
| Primary Language | zh-CN |
| Target Audience | 项目评审与结题验收人员、课题负责人，以及了解 Rust 或形式化验证基础的技术决策者 |
| Communication Intent | 用不超过 5 页概括研究边界、技术路线、核心证明目标和验收指标，使方案可快速评审并便于后续实施对齐 |
| Desired Audience Outcome | 听众能准确理解该方案证明什么、不证明什么，并据此判断其技术可行性、实施范围与验收闭环 |
| Core Message / Ask / Action | 把顺序 safe Rust 安全策略从底层机制中剥离，经 Charon 与 Aeneas 转换为 Rocq 模型，可在明确可信边界下完成页面访问、回收和重分配的可机器检查证明 |
| Delivery Context | 以有主讲的短时方案汇报为主，同时支持会后独立阅读与项目验收归档 |
| Artifact Afterlife | 作为研究方案评审、实施对齐、结题验收和后续扩展的摘要材料 |
| Reading Mode | balanced |
| Content Strategy | balanced default；忠实压缩和重组原始材料，不引入外部事实，将完整方案收束为五页评审叙事 |
| Design Style | 工程验证蓝图：纯白默认页面、瑞士极简栅格、工程制图式细线与标注 |
| Image Usage | none；不使用截图、位图、外部图片或 AI 图片，总体技术方案以可编辑原生图形重绘 |
| AI Image Acquisition Path | not applicable |
| Generation Mode | continuous |
| Spec Refinement | disabled |
| Speaker Notes | enabled — final Stage-2 proactive policy |
| Custom Animations | disabled — final Stage-2 proactive policy |
| Narration Audio | disabled — final Stage-2 proactive policy |
| Created Date | 2026-08-26 |

## II. Canvas Specification

| Property | Value |
| --- | --- |
| Format | ppt169 |
| Dimensions | 1280 × 720 |
| viewBox | `0 0 1280 720` |
| Margins | 左右 64 px，上下 48 px；页面背景始终保持纯白 |
| Content Area | x=64..1216，y=48..672 |

## III. Visual Theme

### Theme Style

- **Mode**: custom
- **Mode References**: pyramid, instructional
- **Mode Behavior**: 先给出“范围可控、可证明、可验收”的结论，再按验证边界 → 转换与建模 → 安全证明 → 实施验收的依赖顺序展开；标题优先使用判断句，每页既回答一个评审问题，也为下一页提供必要前提。
- **Visual style**: custom
- **Visual Style References**: swiss-minimal, blueprint
- **Visual Style Behavior**: 所有页面使用 PowerPoint 默认纯白背景，不添加背景图片、背景纹理、整页网格、渐变或阴影；以瑞士极简的精确栅格、大留白和少量大尺度几何建立秩序，仅在技术结构图中使用工程制图式细线、端点、连接与注释语言。强调色只标记证明路径、关键边界和验收结论，装饰性元素必须承担信息作用。
- **Theme**: 可审计的 Rust 形式化验证路径
- **Tone**: 严谨、克制、工程化、边界清晰

### Color Scheme

| Role | HEX | Purpose |
| --- | --- | --- |
| Background | #FFFFFF | 所有页面的唯一整页背景 |
| Secondary background | #F3F6FA | 局部信息面板与低权重状态区，不得铺满页面 |
| Primary | #123B5D | 标题、主路径、关键模块边界 |
| Accent | #F59E0B | 风险、可信边界与必须注意的限制 |
| Secondary accent | #167D9A | 已验证路径、规约与证明结果 |
| Body text | #1B2430 | 正文、标签与说明文字 |
| Surface | #F3F6FA | 局部浅色承载面 |
| Grid | #D7E0E8 | 分隔线、连接线和次要轮廓 |

## IV. Typography System

### Font Plan

| Role | Character (Reference) | Primary | English if non-English | Fallback tail |
| --- | --- | --- | --- | --- |
| Title | 现代黑体、结论清晰、字重对比明确 | Microsoft YaHei | Arial | sans-serif |
| Body | 中性黑体、适合屏幕阅读 | Microsoft YaHei | Arial | sans-serif |
| Code | 等宽、适合工具名、函数名和公式标签 | Consolas | Consolas | Microsoft YaHei, monospace |

- **Title stack**: Microsoft YaHei, Arial, sans-serif
- **Body stack**: Microsoft YaHei, Arial, sans-serif
- **Code stack**: Consolas, Microsoft YaHei, Arial, monospace
- **Role rationale**: Code 角色在工具链名称、Rust 函数与 Rocq 定理标签中反复出现，使用等宽字体帮助区分程序对象与解释性文本。

### Font Size Hierarchy

| Purpose | Anchor Size (px) |
| --- | ---: |
| Body | 24 |
| Title | 44 |
| Subtitle | 32 |
| Annotation | 18 |
| Code | 20 |

## V. Layout Principles

### Deck-wide Direction

- **Hierarchy direction**: 先读判断式标题，再读一个主视觉结构，最后读取边界、证据或验收说明；每页只保留一个主结论。
- **Composition tendency**: 以不对称留白、细线分区和单一主结构为主；总体技术方案页使用完整的双主线汇合图，其他页面用少量并列关系或阶段关系支持结论。
- **Cross-page continuity**: 复用“深蓝实现路径、青色规约与证明、橙色可信边界”的语义角色；页码和短横线作为轻量导航，不形成背景装饰。
- **Spacing posture**: 封面和结尾页偏开放，边界页与证明页中等密度，总体技术方案页密度较高但保持清晰路径和充足节点间隔。

## VI. Icon Usage Specification

- **Primary bundled library**: tabler-outline
- **Brand-logo library**: simple-icons
- **Stroke Width**: 2

| Icon Path | Suitable Scenarios |
| --- | --- |
| tabler-outline/shield-check | 验证结论、安全属性与通过状态 |
| tabler-outline/lock | 访问隔离、机密性和保护边界 |
| tabler-outline/file-code | Rust 模块、LLBC 文件与 Rocq 产物 |
| tabler-outline/route | 技术路线、状态转换和阶段流程 |
| tabler-outline/checklist | 验收指标、交付物和完成标志 |
| tabler-outline/alert-triangle | 可信假设、风险与不应夸大的结论 |
| simple-icons/rust | Rust 技术身份标识 |

## VIII. Image Resource List

| Filename | Dimensions | Ratio | Purpose | Type | Layout pattern | Crop Policy | Acquire Via | Status | Reference | text_policy | page_role |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

## IX. Content Outline

### Part 1: 方案定位与验证边界

#### Slide 01 - 方案定位

- **Audience move**: 从“Rust 内核是否可以整体证明”的模糊期待，转变为理解一个范围可控、可机器检查、可结题验收的第一阶段目标。
- **Layout**: 纯白封面，以“范围可控 / 可证明 / 可验收”为主视觉钩子；标题与一条 Rust → Rocq 极简路径构成主要阅读轴，底部用三项交付结果收束。
- **Title**: 可验收的第一阶段，不是“验证整个内核”
- **Core message**: 第一阶段应验证可分离的顺序 safe Rust 安全策略，而不是承诺覆盖完整硬件、全部 unsafe、并发和侧信道。
- **Content**: 主标题下用一句话概括方案：从 Rust 机密计算内核中剥离安全策略，经 Charon 与 Aeneas 生成 Rocq 函数模型，并证明页面管理操作满足关键安全属性。视觉钩子为“范围可控、可证明、可验收”。底部列出三个交付方向：真实 Rust 示例模块；自动生成的 Rocq 模型与证明脚本；可复现的验证报告。
- **Visualization**: 一条从 Rust 标识到 Rocq 证明结果的极简方向线，强调“真实实现 → 可证明模型 → 可检查结论”的连续性。
- **Cover impact**: 绑定钩子为“范围可控、可证明、可验收”；建议以大尺度三段式文字和一条细线工具链路径构成，而不是使用普通内容页卡片网格。

#### Slide 02 - 验证边界

- **Audience move**: 从把“safe Rust 策略正确”误解为“整个系统已被验证”，转变为能清楚区分已证明对象、可信接口和暂不覆盖范围。
- **Layout**: 页面围绕一条清晰边界组织：一侧是可验证的顺序 safe Rust 策略，另一侧是明确记录的可信基础；下方单列“不能宣称”的结论，橙色仅用于风险与边界提示。
- **Title**: 可信边界让证明结论可解释
- **Core message**: 证明结论只对已建模的安全策略与接口规约成立，unsafe、硬件、工具链和并发必须作为可信假设或后续验证对象。
- **Content**: “验证范围”包括页面所有权、访问判断、页面回收与重新分配，以及这些操作对安全不变量的保持；“可信边界”包括底层 unsafe 封装、寄存器与页表操作、未验证外部依赖、rustc/Charon/Aeneas 工具链假设；“第一阶段不覆盖”包括完整 CPU/TLB/RMP 模型、多核并发、任意恶意环境干预、全系统非干扰以及时间与缓存侧信道。结尾明确：不能把策略层证明表述为整个内核和硬件实现均正确。
- **Visualization**: 用关系分区表达“证明范围 ⊂ 完整系统”，并以虚线边界连接上层安全决策与底层可信接口；该关系是定性结构，不是数据图表。

### Part 2: 模型转换与安全证明

#### Slide 03 - 总体技术方案

- **Audience move**: 从只知道工具名称，转变为理解实现提取与安全规约两条主线如何在 Rocq 中汇合并形成可检查证明。
- **Layout**: 使用一页完整的可编辑原生技术方案图。上方主线从 Rust crate 依次经过 rustc/MIR、Charon/LLBC、Aeneas Coq 后端，得到 Rocq 函数模型；下方主线从安全需求进入抽象状态、授权关系和安全不变量；两条主线汇合为函数契约、证明义务、Rocq 检查结果与验证报告。可信边界作为底部橙色细轨贯穿相关外部接口，不使用截图或位图。
- **Title**: 两条主线在 Rocq 汇合，把实现模型连接到安全规约
- **Core message**: Charon 与 Aeneas负责把真实 Rust 程序转换为可证明模型，Rocq 负责定义规约并检查实现是否保持安全属性。
- **Content**: 实现主线包含“目标 safe Rust 模块 → rustc MIR → Charon ULLBC/LLBC → Aeneas Coq 后端 → Rocq 函数模型”；规约主线包含“安全需求 → DomainId/PageId → PageState/KernelState → unique_ownership、valid_sharing、reuse_is_clean”；汇合后形成“函数前置条件/后置条件 → 隔离、完整性、防泄露定理 → Rocq 机器检查 → 证明脚本与验证报告”。图旁仅保留两条角色说明：Charon 负责获得结构化语义表示；Aeneas 负责函数式翻译，安全定理仍需在 Rocq 中针对具体模块证明。
- **Visualization**: 定性架构关系图，必须清楚表达两条输入主线、一个 Rocq 汇合点、三个安全属性输出和一条可信边界；节点、连接线、标签与图例全部可编辑。

#### Slide 04 - 证明闭环

- **Audience move**: 从抽象地理解“做形式化验证”，转变为能指出首个案例中的三个函数、对应契约和最终安全属性。
- **Layout**: 三个关键操作按页面生命周期顺序组织：访问 → 回收 → 重新分配；每个操作下方给出一条核心证明责任，底部用统一安全不变量连接隔离性、完整性和防泄露三个结论。
- **Title**: 三个关键操作形成隔离、完整性、防泄露的证明闭环
- **Core message**: `may_access`、`release_page` 与 `reassign_page` 足以构成一个小而完整的页面安全验证案例。
- **Content**: `may_access` 证明只有页面所有者或明确授权主体可以访问；`release_page` 证明未授权主体不能回收页面，错误调用返回 Error 或保持状态不变；`reassign_page` 证明页面交给新所有者前已经清零，且旧数据不会暴露。三个操作共同保持 `valid_state = unique_ownership ∧ valid_sharing ∧ reuse_is_clean`。页面同时强调：更强的“内容为零”结论依赖 `clear_page` 已验证，或其行为被明确写入可信接口规约。
- **Mathematical content**: \begin{aligned}\mathrm{may\_access}(p,d)=\mathrm{true} &\rightarrow \mathrm{authorized}(d,p) \\ \mathrm{reassign\_page}(s,pid,d)=\mathrm{Ok}(s') &\rightarrow \mathrm{page\_contents}(s',pid)=\mathrm{zero\_page}\end{aligned}
- **Visualization**: 三个函数构成按页面生命周期推进的定性链路；底部三项安全属性与全局不变量建立连接。公式作为证明锚点，不把关系误画成数据图表。

### Part 3: 实施与验收

#### Slide 05 - 路线、验收与风险

- **Audience move**: 从认可技术思路，转变为能按阶段推进项目、用明确指标验收，并对工具与可信假设风险保持正确预期。
- **Layout**: 上半部为六阶段实施路线，下半部将验收指标与主要风险并置；“1 个模型、3 项操作、2 类属性”作为唯一大数字结论，风险区使用克制的橙色标记。
- **Title**: 六阶段路线以“1 个模型、3 项操作、2 类属性”完成验收
- **Core message**: 先用最小页面安全案例打通工具链和证明闭环，再以可复现材料验收，而不是以全系统覆盖率衡量第一阶段。
- **Content**: 六阶段依次为：①确定边界，形成目标函数与可信假设清单；②固定版本并打通 Charon/Aeneas/Rocq，生成可加载的 LLBC 和 Rocq 文件；③建立页面状态、权限关系和生命周期规约；④完成访问、回收、重分配三个函数证明；⑤归纳至少两类安全属性，优先访问隔离与页面复用防泄露；⑥整理 Rust 源码、模型、证明脚本、复现说明和验证报告。验收指标为不少于 1 个形式化模型、3 项关键操作、2 类典型安全属性，以及案例、证明代码、分析报告各 1 套。主要风险包括 Coq 后端成熟度、Vec/traits/泛型及复杂控制流支持、外部清零接口假设和对局部非干扰结论的过度外推；对应措施是尽早完成最小可行性测试、必要时简化模型并完整记录可信边界。
- **Visualization**: 六阶段为定性过程线，验收指标为总结性数字而非统计图；风险与措施一一对应，保持可扫描关系。
- **Closing impact**: 绑定结论为“方案价值不在于宣称整个系统被彻底验证，而在于建立一条可复现、可解释、可扩展的 Rust 实现级验证路线”。

## X. Speaker Notes Requirements

- **Generation**: enabled
- **Filename**: match each SVG filename under `notes/`
- **Content**: 仅依据原始 DOCX 补充页面解释、边界提醒和页间过渡；不得引入外部事实，不重复逐字朗读页面正文。
- **Total duration**: 8 minutes
- **Notes style**: 正式、解释性、结论先行
- **Presentation purpose**: 概括方案、解释技术闭环并支持评审验收
