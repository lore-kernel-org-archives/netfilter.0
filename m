From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTables Query
Date: Wed, 23 Oct 2002 10:57:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210230957.g9N9vnL02345@vulcan.rissington.net>
References: <OF61962908.A658CCF9-ON65256C5B.0023060F-65256C5B.00245CCC@lntinfotech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF61962908.A658CCF9-ON65256C5B.0023060F-65256C5B.00245CCC@lntinfotech.com>
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

On Wednesday 23 October 2002 7:37 am, harish.k@lntinfotech.com wrote:

> Hello List,
>
> I have a Red Hat Linux 7.3 box running iptables-1.2.5-3.
> I am using iptables primarily for Source NAT.
> The machine has two IP Addresses
>
> eth0      : 172.25.8.130
> eth0:0    : 172.25.8.125
>
> I am terribly confused with the OUTPUT chain. I have read from
> the documentation that the OUTPUT chain is used for locally
> generated packets.

That is correct.   iptables is very different from ipchains (if you have used 
that before ?) in terms of which chains are traversed by packets into, out 
of, or through the machine.

> The machine always uses the IP Add of eth0
> for any locally generated packets. How do I configure the OUTPUT
> chain such that the machine uses the IP Add 172.25.8.125 when it
> requests for specific ports or protocols.

Remember that all packets leaving your machine, whether they originated from 
the local machine (ie they came through the OUTPUT chain) or came from 
another machine and got routed through the netfilter box (ie they came 
through the FORWARD) chain, will pass through the POSTROUTING chain just 
before they exit the interface.

Therefore you can put a SNAT rule into your POSTROUTING chain to change the 
source address of packets for specific protocols.

Antony.

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

