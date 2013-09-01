From: Justin Israel <justinisrael@gmail.com>
Subject: Re: Classifying ingress traffic via cgroup filters
Date: Sun, 1 Sep 2013 05:54:10 +0000 (UTC)
Message-ID: <loom.20130901T075202-884@post.gmane.org>
References: <5188CC03.3050402@ennes.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Pieter Ennes <pieter <at> ennes.nl> writes:

> 
> Hello,
> 
> I'm researching (=breaking my head to find) ways to classify ingress 
> traffic to a cgroup. Is this possible?
> 
> Details:
> 
> With something like the following I can easily filter egress:
> 
>    $ echo 0x00010010 >net_cls.classid		
>    $ tc filter add dev $iface protocol ip parent 1:0 prio 1 handle 1 cgroup
> 
> But I'm very much in the dark about my options to correctly 
> filter/classify ingress with a clever combination of connmarks, fwmarks, 
> cgroups and/or ifb interfaces (imq is not an option in this case).
> 
> Though it seems that some of this field is still very much in flux, I'm 
> trying to come up with a solution that will work on Debian Wheezy's 3.2 
> kernel.
> 
> Any help or pointers in the right direction are much appreciated.
> 
> Best,

I want to bump this question, because I too am looking for the answer to this.
I've been trying to apply information from this post:
http://serverfault.com/questions/350023/tc-ingress-policing-and-ifb-mirroring

So far I see the traffic being registered in the ifb0 interface, but it seems to 
be for the system, regardless of the cgroup.

