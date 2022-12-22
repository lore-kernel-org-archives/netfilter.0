From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= 
        <socketpair@gmail.com>
Subject: ipset bug (kernel hang)
Date: Fri, 23 Dec 2022 02:22:52 +0300
Message-ID: <CAEmTpZFTQVDYw4w2LgTmABZ8ygJtwtLj+Kj9CsZmNARpuB2oHQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s+xWxUTgn6w8vQ0J6vyX2GHOWyGLyVKHrPrQZJaoicc=;
        b=eV5qB+px6/W3VKj+9+e8NKpP8cF1/d+EEyYA9+rOJCAG8Id968JjnBBL9ogBW0U5pF
         UGHpblel2zDcvnesOkFd5yIx4saoWFm1d/L1xIDPeCCMxo0bohl1FSt4UsQGY28SPIJl
         uPuTF+zMfolSJcHprsTF97AMrTeVyu7jMldwiE3krMK2IN8LKNMzsP66BQ3U7cgpM3/h
         CEtvxaNtSwCb1XuZsUqyBIv4Rs3lmuTnlRbwkDFC/ZXpG8fqSP721WziXnqMYGecFdb0
         rW5QgZDgZ9hS6tV3GLhgrcLy+UDs8bpV+dqxiDR0wfgmPg893J0PemRmrfuRDq1i7CA0
         LNAA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, kadlecsik.jozsef@wigner.hu, kadlec@sunserv.kfki.hu

ipset create acl_cdc_cert hash:net,port,net
ipset add acl_cdc_cert 0.0.0.0/0,tcp:1-2,192.168.230.128/25

and kernel 6.0.12 hangs (!)

Seems the problem happens only if both 0.0.0.0/0 and port range
specified at the same time.

Please tell me where to report.

-- 
Segmentation fault
