From: Casey Scott <casey@phantombsd.org>
Subject: Re: verifying set-mark
Date: Sun, 24 Feb 2008 09:34:33 -0800 (PST)
Message-ID: <9433290.261203874473944.JavaMail.root@tomcat.phantombsd.org>
References: <47C1A9AF.8030406@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47C1A9AF.8030406@rtij.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martijn Lievaart <m@rtij.nl>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@vger.kernel.org

> > Thanks for that link. I realized that I was marking on 
> > POSTROUTING rather than FORWARD. The correction solved the problem
> > of throttling, however, I'd still like to know how to use tcpdump to
> 
> > verify the mark is being set.
> >   
> 
> 
> You cannot. The mark is a kernel internal thingy. Tcpdump sees the 
> packets "on the wire", the mask is long gone by that time.
> 
> HTH,
> M4

That explains a lot! Thanks.

Casey
