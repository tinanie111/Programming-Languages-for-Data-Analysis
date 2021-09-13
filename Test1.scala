package com.atguigu.chapter01

import utils.jiajava


import scala.collection.JavaConverters._
object Test1 {


  def main(args: Array[String]): Unit = {
    val java = new jiajava()
    val muRange = java.getFloatinterpolation(51d, 55d, 0.02d).asScala
    val N = 10000
    val n = 20
    val sigma = 1.2

    for (muActual <- muRange) {
      val list = List(jiajava.NormalDistribution(muActual, sigma))
      val xBar = jiajava.Mean(list)
  }

  }


}