From: Maarten Vanraes <maarten@ba.be>
Subject: Re: Help with invalid packets.
Date: Mon, 19 Mar 2012 18:01:39 +0100
Message-ID: <201203191801.39190.maarten@ba.be>
References: <BLU144-W3712D3E518F5611A6BD840D0420@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU144-W3712D3E518F5611A6BD840D0420@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Micheal Wolfskill <tdgh2323@hotmail.com>

these days, i often have this problem with L3 switches

the problem is asynchronous routing, because the L3 switch decides to route my 
packet directly to the endbox, bypassing the firewall. this happens with 
clients who don't use VLANs on the firewall, but use ip aliasing directly.

Regards,

Op maandag 19 maart 2012 16:39:37 schreef Micheal Wolfskill:
> I have this rule:
> 
>  $IPT  -A INPUT -i ${PUB_IF} -m state --state INVALID -j DROP
> 
>  The problem is its matching legitimate packets of visitors (including me)
> that navigate my site... As i can see in the logs.
> 
> 
>  Its not affecting the normal viewing of my site.. but I wish to know
> why it is matching these packets as Iam sure it should not.
> 
>  Here is the log entry in syslogd
> 
> 
>  Mar 16 15:29:36  kernel: Invalid  IN =eth0 OUT=
>  MAC=00:16:3e:44:bf:02:00:11:92:8b:ff:c4:08:00 SRC=xxx.xxxx.xxxx.xxxxx
> DST=xxxx.xxxx.xxxx.xxxx LEN=40 TOS=0x00 PREC=0x00 TTL=47 ID=0 DF PROTO=TCP
> SPT=6367 DPT=80 WINDOW=0 RES=0x00 RST URGP=0
> 
> Thanks
> 
> Mike 		 	   		  --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
