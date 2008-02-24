From: Casey Scott <casey@phantombsd.org>
Subject: Re: verifying set-mark
Date: Sun, 24 Feb 2008 08:36:12 -0800 (PST)
Message-ID: <18523854.231203870972481.JavaMail.root@tomcat.phantombsd.org>
References: <15675295.211203870881109.JavaMail.root@tomcat.phantombsd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <15675295.211203870881109.JavaMail.root@tomcat.phantombsd.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@vger.kernel.org


> Now, I don't seem to have a man page for tc-filters, I can't find it
> on the internet, nor can I find it in the source (I looked in
> iproute2-2.6.19-061214), so I'm afraid nobody's got it which makes
> this a dead end.
> 
> There surely must be examples around that show how to work with tc and
> iptables' mark. Perhaps this will get you going:
> http://www.szabilinux.hu/bandwidth/index.html

Thanks for that link. I realized that I was marking on 
POSTROUTING rather than FORWARD. The correction solved the problem
of throttling, however, I'd still like to know how to use tcpdump to 
verify the mark is being set.

Thanks,
Casey

> 
> 
> Grts,
> Rob
> 
> 
