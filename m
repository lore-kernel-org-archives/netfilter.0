From: Alex Flex <aflexzor@gmail.com>
Subject: syn flood load test
Date: Sun, 05 May 2013 12:03:18 -0600
Message-ID: <51869EE6.5090506@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=+rG48vsHQdm3U8m0mlk/FPljUbEIv3u024S1tNxWEGM=;
        b=a8fBFCDNq/Tdd1eM6N7BDNu6ol50JgYL7rqQnsyqvPGd4oMtVrN/4E+xmxrIY3DUCE
         92GVJ4VrW5oEAJ4VZIj2G0Um2yYiIY2KYA8Xy3tQqO5MjVVx+WYhLK3n++pbZuOx5Q4B
         GmEzosmvm/SzbYXj27KewuI+xxlzLWPEHyQJPN6A8gutTmGbtQraE7OS1k2wfiPu4KZq
         Tn1tFHl0m8gprjSMFiS7hgD69e2qP8ZrX5C6oiL6R/BF2n8qKctUeduAjof7yTzRUKAM
         WK/u20mJ+ZhQIztUZKLiwPgfhopMVa5GfUsYEPQjXlC4/sEhm0/XbGwACuFMUldPmVx6
         MUsg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello all!

Not exactly an iptables question, but iam looking to stress load such 
config.

I tried using:

hping3 -p 80 --flood --rand-source -S my-ip-here

However  i wasnt able to get more then 10k pps, i even tried running two 
instances of hping so i ca use two cores of CPU and it doesnt make a 
difference.

Anybody have a suggestion? Iam looking forward to generate 300k pps flood

Alex
