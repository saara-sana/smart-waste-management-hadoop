package com.waste;
	import java.io.IOException;
	import org.apache.hadoop.io.*;
	import org.apache.hadoop.mapreduce.Mapper;

	public class OverflowMapper extends Mapper<Object, Text, Text, IntWritable> {
	    private final static IntWritable one = new IntWritable(1);
	    private Text zone = new Text();

	    public void map(Object key, Text value, Context context)
	            throws IOException, InterruptedException {

	        String line = value.toString();
	        if (line.contains("Bin_ID")) return;

	        String[] parts = line.split(",");
	        int fill = Integer.parseInt(parts[4]);

	        if (fill > 90) {
	            zone.set(parts[1]);
	            context.write(zone, one);
	        }
	    }
	}
