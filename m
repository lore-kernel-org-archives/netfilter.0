From: Vimal <j.vimal@gmail.com>
Subject: Re: iptables not prevent access
Date: Mon, 15 Sep 2008 16:12:17 +0530
Message-ID: <ff71fbf20809150342u52afb246vbb672cbdf36a43ad@mail.gmail.com>
References: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A3FD3@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
	 <9518B26607784D55A361431633134C9B@dcyb.net>
	 <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=vIJsVzDPUlGY+E5Zsbc3Fcge6cVueh8hQBbwWY+y+Wc=;
        b=nzvAAhAPznC75IzVhhBjMGOQT5eFKGlz68i82IjzfKw54vwGS21uIj7S6R9rEQg2Zg
         g9u7Pao+SyYv26gvVTzVO5zTSFyl0lJyxTMr4BVdNEi7lHG2UOTLOO+zt2KfVQwSJKcQ
         OjQnhrn8ho2eSPVb5A0ZJKN2qdmOcVQZAaujw=
In-Reply-To: <D8C9BC7FFCF8154FB7141EB8DB609C1721725A40CE@SGPAPHQ-EXSCC01.dc01.fujixerox.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Xu, Qiang (FXSGSC)" <Qiang.Xu@fujixerox.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> What's strange is that, when I run the same command to other machines, say 13.121.8.120, the http access is successfully rejected. Does that mean something wrong with the network configuration of the machine 13.121.8.119? What is the possible cause of that behavior?
>

This could have been possible only if the rule doesn't match it.
Let's look at the rule:

* -i eth0 ... If this doesn't match, it means that there is some other
routing going on that uses another interface to route the packet to
this particular IP address. Try pasting the routing table here, so
that we can see.
* -p tcp ... This has to be matched :)
* --dport=80 ... Unless you're running the webserver on some other
port, this is likely to match as well.

So, it looks like the packet isn't arriving via interface eth0.

> Another thing is quite strange, when capturing network trace from and to 13.121.8.119, I can't find any packet associated with the server which runs "iptables" command. However, when I was capturing network trace from and to 13.121.8.120 (which was successfully blocked), I can see some network packets associated with the server.

You might have done the network trace on one interface. How many
interfaces are there:
* On the server
* On the client (13.121.8.119)

What is the server IP address?

From what you say, it looks like 13.121.8.119 and the server have
established contact via an interface that is other than eth0.

-- 
Vimal
