python -m bin.train \
  --config_paths="
      ./example_configs/nmt_small.yml,
      ./example_configs/train_seq2seq.yml,
      ./example_configs/custom_text_metrics_summ.yml" \
  --model_params "
      vocab_source: /workspace/TTNewsCorpus_NLPCC2017/toutiao4nlpcc/source_vocab
      vocab_target: /workspace/TTNewsCorpus_NLPCC2017/toutiao4nlpcc/target_vocab" \
  --input_pipeline_train "
    class: ParallelTextInputPipeline
    params:
      source_files:
        - /workspace/TTNewsCorpus_NLPCC2017/toutiao4nlpcc/sources.txt
      target_files:
        - /workspace/TTNewsCorpus_NLPCC2017/toutiao4nlpcc/targets.txt" \
  --input_pipeline_dev "
    class: ParallelTextInputPipeline
    params:
       source_files:
        - /workspace/TTNewsCorpus_NLPCC2017/toutiao4nlpcc_eval/sources.txt
       target_files:
        - /workspace/TTNewsCorpus_NLPCC2017/toutiao4nlpcc_eval/targets.txt" \
  --batch_size 32 \
  --train_steps 1000 \
  --output_dir /tmp/model/seq2seq
