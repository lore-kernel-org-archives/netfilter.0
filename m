From: Zoilo <zoilo@xs4all.nl>
Subject: Re: First iptables script - comments please
Date: Thu, 3 Oct 2002 20:58:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02100320584201.02373@Lms>
References: <20021003172228.GC7407@gentoo.coot.net>
Reply-To: zoilo@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021003172228.GC7407@gentoo.coot.net>
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
To: "Craig H. Anderson" <craigha@attbi.com>, netfilter@lists.netfilter.org

On Thursday 03 October 2002 19:22, Craig H. Anderson wrote:
> I've just tried iptables for the first time
> and would like comments on this simiple
> script.
>
> Gateway box with
>    cable modem on one NIC (eth2)
>    2 NIC's connected to local hubs.
>    local subnets are 10.0.0.0/24 and 10.0..1.0/24
>    only 10.0.0.0 is currently in use
>
> I am successful in getting to the internet
> with this script.
>
> # $Id: localFirewall,v 1.1 2002/10/03 16:31:21 craig Exp $
> iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
> iptables -A FORWARD -s 10.0.0.0/24 -j ACCEPT
> iptables -A FORWARD -d 10.0.0.0/24 -j ACCEPT
> iptables -A FORWARD -j DROP

I would say that it's somewhat minimalistic, but OK.

Better to use "iptables -P FORWARD DROP" to establish default DROP-policy for 
the FORWARD chain, although you effectively achieve the same result by 
putting your DROP-rule at the end of the list.

A little further improvement may be obtained by adding "-i eth0" and "-o 
eth0" to your FORWARD rules.

And don't forget to handle INPUT and OUTPUT chains as well (default DROP 
policy).

-- 
Z.
------------------------------------------------------------
"If all you have is a hammer, everything looks like a nail."

