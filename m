From: Rob Greenwood <bilco105@gmail.com>
Subject: Increasing the number of ipsets
Date: Fri, 26 Apr 2013 11:17:53 +0100
Message-ID: <CAEoHOkBB7kWTOxtQT3k_kKyatGuRT2H1D5HmUhukAE0tGNbvjg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=NGPz78s66qk82gI9ozOOtpxMr4EhcOhUvJYfIW8ktCM=;
        b=w9Kl1kj0EuhAsxodnblAcbGdx0lqg+Qi0t1YH5HUbDi1Lq9HunPPzwFVBUS3CSEjio
         zRKiu5I7187b3g8bIMjHhCEcp5rah9SStZwT0YqBcnrUEOSbIsQrK6ArgM/loz74997M
         NvXP6ogrdfUVQ9F45U1si1xXFAVWPTxaSStgIN525CvK8x6pdeHaytR2KydnO5XyBcYG
         VybnlPRsThU7xjs/YwG5ZCxz2NJdoTU2txj8ht6O+JXQT96IB6TDMgwC3WME3XzEB+pP
         2y9QGrNcQ96NDkOP0TCvqBnQIL7VS9OgkNO/RzCLHXvA5qyw1sv+KraO+MWxpl3WPVl0
         5MtA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Running CentOS 6.4.

I'm trying to increase the number of ipsets which are available. I'm
therefore compiling ipsets from source and specifying
--with-maxsets=1024 and installing.

However, this doesn't seem to have any affect. Do I need to recompile
the kernel with a certain parameter as well? - struggling to find any
documentation anywhere.

Thanks,
Rob
