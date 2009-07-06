From: Eray Aslan <eray.aslan@caf.com.tr>
Subject: Re: Ipsec/L2tp with NETKEY
Date: Mon, 06 Jul 2009 10:04:23 +0300
Message-ID: <4A51A1F7.2050206@caf.com.tr>
References: <1246666906.5753.31.camel@localhost> <4A4ED740.9050104@caf.com.tr> <114b7d1a0907052027y1204f945s4d9b5ea7032d6b13@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=caf.com.tr; h=
	content-transfer-encoding:content-type:in-reply-to:references
	:subject:mime-version:user-agent:from:date:message-id:received
	:received:x-virus-scanned; s=originating; t=1246863863; bh=JSeSS
	+Klxls72cU4lIifw6iy1VZImCBxUqEyCV3H0Yw=; b=OvKlcYjpwVmtbsEQ1k6bj
	8igK6Ps33rX2TlnMso0MnReRsSrOm26atwjr7Tpwz6Gh5o0ptQErilsmwWBgTeJf
	Q3nhPXmq4eQ2CKKN07cKwx3dCPj+I9awAOJNC2QXNzaf1ke1RHPCo41hxh6+nysk
	q/NG7Q41iamyhcROFlUxZM=
In-Reply-To: <114b7d1a0907052027y1204f945s4d9b5ea7032d6b13@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin <martin.listz@gmail.com>, netfilter@vger.kernel.org

On 06.07.2009 06:27, Martin wrote:
> 2009/7/4 Eray Aslan <eray.aslan@caf.com.tr <mailto:eray.aslan@caf.com.tr>>
> 
>     On 04.07.2009 03:21, Martin wrote:
>     [...]
>     > Any suggestions how to let connections on udp 1701 only to connections
>     > before authenticated by ipsec?
> 
>     On the openswan machine, mark the ESP packets and accept only marked
>     packets to l2tpd daemon:
> 
>     # iptables -t mangle -A PREROUTING -i $EXT_INT -p 50 -j MARK
>     --set-mark 1
>     # iptables -A INPUT -i $EX_INT -m mark --mark 1 -j ACCEPT
>     # iptables -A INPUT -i $EX_INT -p udp --dport 1701 -j DROP
>
> Thanks for the reply Eray.
> 
> Sadly, that doesn't seems to work, or at least I don't see any packet
> been mark using "iptables -L -n -v -t mangle"
> 
> Can be there something else or anything that I'm missing?

Better to reply on-list.  Others might help / correct the given advice.

If counters do not increase, you need to figure out why esp packets do
not match the marking line.  Perhaps try logging all packets in
mangle/PREROUTING for a short while and compare.

-- 
Eray
