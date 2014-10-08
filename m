From: Meike Stone <meike.stone@googlemail.com>
Subject: Re: dyn. SNAT based on different source addresses?
Date: Wed, 8 Oct 2014 09:01:53 +0200
Message-ID: <CAFNHiA9-omeMK+2P+oadxRMmp1mYXVWSuZAH-XqZnA5Qrdf+NA@mail.gmail.com>
References: <CAFNHiA83zPCE9KW7U5q7WdPdoJkvkeh0zwF+q6OWD96yWrE8pA@mail.gmail.com>
	<5434458A.2030701@ngtech.co.il>
	<CAFNHiA_qb-Y8YyvMXKotRfybGSCBA1-v5-B0Jw5sHF9T9XVcGQ@mail.gmail.com>
	<201410071827.44706.neal.p.murphy@alum.wpi.edu>
	<5434771F.6010301@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=q63XZjV0xhKLgp3CkOiXu4QJ0V1ZqqCadrtfjplrB34=;
        b=XPkJjQEQLCN46tn8E4rav0xRTCWamVzPP0xT7s+1qGJzwkJqoQ9pUzGhtGc41Kp5hF
         BpWKI0e77t4oxrOiAKW7dXwXAQbix77P9RigG6HgN6R9ncvwmtkQtGW+Z4CGlxSGNjha
         JoaNgvPO51sO5pl9EDAStlky7w140l21GJIA2STcswVlheQBS2mp98dqABi9mjOvqL7Q
         5BF83rNwViCSui066PYJzopDcNpV0dHsGBnLIE9nAJA/1UKvwsBTUVCPBrCHJFGgmck0
         A1yT/b+e8e/6EbUWQOYt7tM3jt2KS1DqGl1c127XmIDGOdbTX1MvzzQQtYL5Htvpd7Ld
         5QPg==
In-Reply-To: <5434771F.6010301@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Except a gre tunnel is not that easy on a Windows TS or at all on a
> windows machine.
> The main issue is that he has 200+ machines in one subnet that needs
> access to the other one...

Not exactly, the terminal servers are located in different subnets in
one company, so NETMAP here is suboptimal  ....

>
> The options I now that works in windows are pptp(with internal GRE),
> l2tp, openvpn and maybe couple others.

Thanks for the ideas.
But tunnels are not an option. Admins on TS are running the strategy
"never change a running system", because the TS are fragile ...

Routing betwenn the two companies is not possible (overlapping ip
networks, different security policies, ..)
Thats is the reason for the DNAT rules ... The TSs access to the
fileserver over a IP in the own network.

Thought, I can solve the porblem with iptables ... iptables is so mighty ...

Thanks Meike
