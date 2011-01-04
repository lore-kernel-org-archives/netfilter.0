From: Andrew Beverley <andy@andybev.com>
Subject: Re: internet sharing issue
Date: Tue, 04 Jan 2011 18:41:29 +0000
Message-ID: <1294166489.1620.17.camel@andybev>
References: <AANLkTik6WP-fKZK+a4x7E4r8vW10TLH+6=HSWp2MQvry@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1294166500; bh=iFj+fuLrYRB+77NfTBHIfa7evQ37sjUtX3Lg1
	GowlRo=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=PzWJsceG
	y5BH958FmTLYvts55UjcIV3cOuS9E0P0Kh3jixq7srk9SeS9i9UlLfyKQo6lGywAW/t
	DcbGhT5JsIqD5vP1xIFBwjm81ZOxQmAKp/7i++xmkS64ebkvOiYRvZasv0PGibS8/tt
	a7TabXFmhj1PXuMmOKVPs7AabSZxE=
In-Reply-To: <AANLkTik6WP-fKZK+a4x7E4r8vW10TLH+6=HSWp2MQvry@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: benjamin fernandis <benjo11111@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2011-01-04 at 08:45 +0530, benjamin fernandis wrote:
> Hi Friends,
> 
> I have rhel 5.5 on that i compiled kernel 2.6.36.2 and iptables 1.4.9 .
> 
> After that i configured basic internet sharing setings in iptables.
> 
> Iptables rule :
> [root@localhost ~]# iptables -L -nvx -t nat
> Chain PREROUTING (policy ACCEPT 9 packets, 1068 bytes)
>     pkts      bytes target     prot opt in     out     source
>      destination
> 
> Chain INPUT (policy ACCEPT 1 packets, 28 bytes)
>     pkts      bytes target     prot opt in     out     source
>      destination
> 
> Chain OUTPUT (policy ACCEPT 58 packets, 6477 bytes)
>     pkts      bytes target     prot opt in     out     source
>      destination
> 
> Chain POSTROUTING (policy ACCEPT 55 packets, 6225 bytes)
>     pkts      bytes target     prot opt in     out     source
>      destination
>        3      252 MASQUERADE  all  --  *      *       10.10.10.0/24
>     0.0.0.0/0
> [root@localhost ~]#
> 
> and also i enabled ip_forward.
> 
> net.ipv4.ip_forward = 1
> net.ipv4.conf.default.rp_filter = 0
> net.ipv4.conf.default.accept_source_route = 0
> kernel.sysrq = 0
> kernel.core_uses_pid = 1
> kernel.msgmnb = 65536
> kernel.msgmax = 65536
> kernel.shmmax = 4294967295
> kernel.shmall = 268435456
> 
> at my gateway internet is working fine.But from my client net is not working.
> 

You've only listed the nat table. What rules are in your mangle and
filter tables (in particular the FORWARD chain)?

Andy


