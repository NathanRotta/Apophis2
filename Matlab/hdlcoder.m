hdlcfg = coder.config("hdl");
hdlcfg.SynthesisTool ='Altera Quartus II';
hdlcfg.TargetLanguage = 'verilog';
hdlcfg.DistributedPipeliningPriority='NumericalIntegrity';%or 'Performance'

codegen hdlcfg

function sum = add(a,b)
sum=a+b;
end
