From: "bino_oetomo" <bino@indoakses-online.com>
Subject: Re: iptables for backup connection
Date: Mon, 14 Jun 2004 16:05:27 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006d01c451ee$c47736f0$0300a8c0@indoaksesbno>
References: <1171.172.16.128.100.1087207004.squirrel@mail.suarapembaruan.co.id> <200406140905.53992.Antony@Soft-Solutions.co.uk>
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


----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Monday, June 14, 2004 3:05 PM
Subject: Re: iptables for backup connection


> On Monday 14 June 2004 10:56 am, david@suarapembaruan.co.id wrote:
>
> > Dear all,
> > In my office i using 2 connection (Wireless connection direct to ISP "A"
> > and backup connection to ISP "B" with ADSL Modem), how to configure
Linux
> > iptables (gateway) so when connection to ISP "A" down client can still
> > work with ISP "B" without reconfiguration at client computer.
>
> This is not a firewalling question; this is a routing question.
>
> The tool you need to set this up is iproute2.   See http://lartc.org for
> details.
>

Yup ...
iproute2 , for routing path definition
iptables , for NAT change
and BASH for connection testing and "puting it all together"

Sincerely
-bino-


