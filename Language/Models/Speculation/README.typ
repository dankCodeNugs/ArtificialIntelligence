#import "@local/ib:0.1.0": *
#title[Speculative Decoding]
#a[A Hitchhiker's Guide to Speculative Decoding -- PyTorch][https://pytorch.org/blog/hitchhikers-guide-speculative-decoding/]

#a[Looking back at speculative decoding][https://research.google/blog/looking-back-at-speculative-decoding/]

#a[Speculation - Hugging Face][https://huggingface.co/docs/text-generation-inference/conceptual/speculation]

= Multi Token Prediction (MTP)
- Speedup: Dense > MoE models

  #q[In terms of average speedup, we see a 1.4x for dense models at draft tokens = 2 and for the MoE around 1.15 to 1.2x.]

- Uses noticeably more VRAM.
  #footnote[#a[Tested MTP with llama.cpp and Qwen3.6-27B on RTX 3090 : r/LocalLLM][https://www.reddit.com/r/LocalLLM/comments/1tf002j/tested_mtp_with_llamacpp_and_qwen3627b_on_rtx_3090/]]
  - Qwen3.6-27B: \~3GB
    #footnote[#a[Llama.cpp MTP support now in beta! : r/LocalLLaMA][https://www.reddit.com/r/LocalLLaMA/comments/1t3guzw/llamacpp_mtp_support_now_in_beta/]]

- llama.cpp: ```sh --spec-type draft-mtp --spec-draft-n-max 6```
  - ```sh --spec-draft-n-max```/```sh LLAMA_ARG_SPEC_DRAFT_N_MAX``` defaults to 16.

  #a[llama + spec: MTP Support by am17an - Pull Request \#22673 - ggml-org/llama.cpp][https://github.com/ggml-org/llama.cpp/pull/22673]
  #a-badge[https://www.reddit.com/r/LocalLLaMA/comments/1t3guzw/llamacpp_mtp_support_now_in_beta/]
  #a-badge[https://www.reddit.com/r/LocalLLaMA/comments/1tes1wx/mtp_support_merged_into_llamacpp/]

#a[MTP benchmark results: the nature of the generative task dictates whether you will benefit (coding) or get slower inference (creative) from speculative inference. No other factor comes close. : r/LocalLLaMA][https://www.reddit.com/r/LocalLLaMA/comments/1t9gcar/mtp_benchmark_results_the_nature_of_the/]

#a[Qwen3.6 27b q5_k_M MTP - 256k context - 5090 : r/LocalLLaMA][https://www.reddit.com/r/LocalLLaMA/comments/1taz3eu/qwen36_27b_q5_k_m_mtp_256k_context_5090/]

= Implementations
- llama.cpp
- #a[vLLM][https://docs.vllm.ai/en/latest/features/speculative_decoding/]
