From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: -j ECN --ecn-tcp-remove seems to be mangling the TCP checksum...
Date: Mon, 30 Sep 2002 11:55:56 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209301153320.10012-100000@dns.toxicfilms.tv>
References: <20020927062753.13067.qmail@science.horizon.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020927062753.13067.qmail@science.horizon.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@horizon.com
Cc: netfilter@lists.netfilter.org

> Is this a bug?  The ipt_ECN.c file is
> ipt_ECN.c,v 1.4 2002/08/05 19:36:51 laforge Exp
No it is not. Do the same with a remote host.
Send a ECNstripped packets to some other host, and tcpdump there.
The checksum will be ok.
It is the problem with tcpdump getting a cloned copy of the packet,
read the RR's FIXME notes in netfilter sources about it.

I noticed that too, once, and thought it's a checksum calculation bug.

> Thanks!
Regards,
Maciej Soltysiak


