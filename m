From: "Postmaster" <iptables-pmd0052@promind.de>
Subject: Re: question about -t nat
Date: Sun, 20 Jun 2004 01:25:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c45654$b22cf970$6900a8c0@W2K>
References: <000701c45626$e27411a0$6900a8c0@W2K> <1087670301.2051.0.camel@localhost>  <000b01c45637$42d805a0$6900a8c0@W2K> <1087683517.2052.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Hmmm . . . I'll have to defer to others who know more about modules.  I
> always compile mine as part of the kernel just in case.  I see the
> iptable_nat so I'm not sure what's missing.  Is there any chance the
> userland tools are mismatched to the kernel?
> -- 

unfortunately not. otherwise i could change something. both machines are
clean and selfmade from scratch.
the differential of the second mashine is the kernelversion 2.4.22 with
CONFIG_KMOD --> y. but on the real firewall i wont do anything automaticly.
on a third mashine kernel 2.4.26, iptables 1.2.9 and all of modules are
build in kernel, a rule with DNAT in a userchain also wont work. i believe
nearly in an error on the second mashine :(

Jan


