From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset kernel module functions
Date: Wed, 24 Feb 2016 10:13:01 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1602241004150.19037@blackhole.kfki.hu>
References: <CAKJ7aR5_xNAeDdnU53K4sVvOVzDTzBjYZ1yxJ7jX8cL=jCRBJQ@mail.gmail.com> <alpine.DEB.2.10.1602230936460.11314@blackhole.kfki.hu> <CAKJ7aR77U2XBBQqBg4ey5-np=6i=2Kj+R0o37vovM90=0S0Fkg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=mime-version:user-agent:message-id
	:in-reply-to:from:from:date:date:received:received:received; s=
	20151130; t=1456305140; x=1458119541; bh=iuqT4do7ipXl7SQP7rpG2dJ
	UCqlX1MDp1cmaIrWC/nc=; b=TTwpgUXD1RtsMY3o6+2VYJjTUp5LVViNDV6qzcT
	8XjIofjix/F7Jet0VZrIt0j+imAu/UTzzT3NkLNULLB3VlDq+AclUb/3Dxmw2gvR
	WylDJ/9xRg/bMPAsiZ+E0jOv53ohMF8JQupuqpTVQwxyYdUK/iEuBn19a2WPf9wy
	A/mU=
In-Reply-To: <CAKJ7aR77U2XBBQqBg4ey5-np=6i=2Kj+R0o37vovM90=0S0Fkg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gadre Nayan <gadrenayan@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 24 Feb 2016, Gadre Nayan wrote:

> I had few questions regarding the Netlink messages sent from User space.
> 
> 1. The command gets transformed into Netlink Message in
> ipset_cmd(session, enum cmd, lineno) ---> lib/session.c
> 
> I see the attributes getting created. So which BUS id (Subsystem ID)
> in Netlink is this message send to ?

ipset uses NETLINK_NETFILTER netlink socket bus id and inside nfnetlink it 
has its own NFNL_SUBSYS_IPSET subsystem id.
 
> 2. If I have to trace this command Netlink message in Kernel source, 
> where can I start loooking. (I would typically start at the subsystem 
> registration) so where can this IPSET subsystem be registered and 
> parsed.

The registration happens in ip_set_core.c (nfnetlink_subsys_register()) 
and the message parser functions are actually callbacks, hooked into 
nfnetlink (ip_set_netlink_subsys_cb[]). If you want to follow the whole 
processing path, then start at netlink, then nfnetlink and after that 
comes ipset.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
