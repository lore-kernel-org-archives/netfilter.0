From: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Subject: Explanation about RATEEST interval and ewmalog
Date: Thu, 22 Nov 2012 02:25:51 -0430
Message-ID: <50ADCC77.7000202@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=vgozfhqmFheR/Nmxg5xsaCyC6Sd0fB5p8uMaaeLHt/8=;
        b=oi6opk51V9j9J0boKW0OlWzbJ+8LJXsYexAnonN8//tRqofegIO/+g8p3Pa0qwvAik
         8mT/xFc5He2Z69blaQrgoLmr5IWZkhETVE9mbx2TzxnD+uV61dDz8Zf3v9JkO2mnM8NL
         MU58JOqS6g+SF0nOJskngwkk2g08sckMr3zvhm96ZZIJADdecH9L2B51S2id0yMHLx/R
         81ljJS+16XTLdez8PpNHwySmJ5jtFiq/N3r5y+Q0xGhk7FcXCJpeshTnnqmnynV/HYxz
         RRrB1pPByHEVskFSBEHhhV5c2wm4jgbd6pTu8bFWvEkrHOuwE/yqZAh36fbzRVBvA8IW
         uUcw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi

What is --rateest-interval and --rateest-ewmalog?

        --rateest-interval amount{s|ms|us}
               Rate measurement interval, in seconds, milliseconds or 
microseconds.

        --rateest-ewmalog value
               Rate measurement averaging time constant.

I'm using interval 1.0s and ewmalog 2.0s but I don't understand how 
these parameters works together.

Any further explanation?
