package utils;

import java.sql.Ref;
import java.util.*;

public class jiajava {
    public ArrayList<Double> getFloatinterpolation(double min, double max, double interval) {
        ArrayList<Double> result = new ArrayList();
        for (int i = 0; i < Math.ceil((max - min) / interval); i++) {
            result.add(min + i * interval);
        }
        return result;
    }

    public static ArrayList<Double> NormalDistribution(double u, double v) {
        ArrayList<Double> result = new ArrayList();
        java.util.Random random = new java.util.Random();
        for (int i = 0; i < 100; i++) {
            result.add(Math.sqrt(v) * random.nextGaussian() + u);
        }
        return result;
    }
    public static double Sum(double[] data) {
        double sum = 0;
        for (int i = 0; i < data.length; i++)
            sum = sum + data[i];
        return sum;
    }
    public static double Mean(double[] data) {
        double mean = 0;
        mean = Sum(data) / data.length;
        return mean;
    }
    public static double POP_Variance(double[] data) {
        double variance = 0;
        for (int i = 0; i < data.length; i++) {
            variance = variance + (Math.pow((data[i] - Mean(data)), 2));
        }
        variance = variance / data.length;
        return variance;
    }


}



