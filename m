From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: iptables: unknown protocol "!" specified
Date: Sat, 21 Nov 2015 15:57:53 -0500
Message-ID: <20151121155753.0c7e1850@playground>
References: <alpine.LNX.2.00.1511211917160.3864@maria.rogerprice.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU tALKvuUL030592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1448139476; i=@wpi.edu;
	bh=BvwaT6B5PEp/beQ71rXnvNIhCgX3Z9SXFtVMlDIG5+A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bIN5uVBwu8tV8daNil5TAEyJrl04qXHnk2sgO2deb/U20Dfz9/bXwLvbY9mpmKVMF
	 4JVYo/qM+Ypcx6Q0p3yqzda9mp9A/szCgLDVV5uwJFxG6/WnxC/QW+ikk3QDAjttLN
	 TKfH31V6fKIy06bJGGXcYth6xhcgdEDVEjw/uMII=
In-Reply-To: <alpine.LNX.2.00.1511211917160.3864@maria.rogerprice.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roger Price <roger@rogerprice.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Sat, 21 Nov 2015 21:48:47 +0100 (CET)
Roger Price <roger@rogerprice.org> wrote:

> Hi, I'm reading the iptables tutorial 1.2.2 by Oskar Andreasson at 
> https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html where I 
> read:
> 
>   Match           -p, --protocol
>   Example         iptables -A INPUT -p tcp
>   Explanation ... This match can also be inversed with the !
>   sign, so --protocol ! tcp would mean to match UDP and ICMP.
> 
> So I tried it on openSUSE 13.2 and iptables replied:
> 
>   pinta:~ # iptables -A INPUT --protocol ! icmp
>   iptables v1.4.21: unknown protocol "!" specified
>   Try `iptables -h' or 'iptables --help' for more information.
> 
> Escaping the ! as \! makes no difference.  I am doing something wrong. 
> Any suggestion as to what it is would be very welcome.

This was changed quite some time ago. The 'infix' notation was removed.

Try "! --protocol icmp".

N
