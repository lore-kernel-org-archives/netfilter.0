From: Martijn Lievaart <m@rtij.nl>
Subject: Re: verifying set-mark
Date: Sun, 24 Feb 2008 18:30:23 +0100
Message-ID: <47C1A9AF.8030406@rtij.nl>
References: <18523854.231203870972481.JavaMail.root@tomcat.phantombsd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <18523854.231203870972481.JavaMail.root@tomcat.phantombsd.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Casey Scott <casey@phantombsd.org>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@vger.kernel.org

Casey Scott wrote:
> Thanks for that link. I realized that I was marking on 
> POSTROUTING rather than FORWARD. The correction solved the problem
> of throttling, however, I'd still like to know how to use tcpdump to 
> verify the mark is being set.
>   


You cannot. The mark is a kernel internal thingy. Tcpdump sees the 
packets "on the wire", the mask is long gone by that time.

HTH,
M4

