From: "bino-psn" <bino@indoakses-online.com>
Subject: Re: kind of off topic but ... P166 w/ 64 MB RAM
Date: Sun, 28 Dec 2003 10:30:05 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004001c3ccf2$e31482b0$0300a8c0@indoaksesbno>
References: <20031227192312.145741df.michael@bluesuperman.com> <200312280239.45998.Antony@Soft-Solutions.co.uk> <20031227195709.12e3a150.michael@bluesuperman.com> <200312280305.32649.Antony@Soft-Solutions.co.uk>
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
Sent: Sunday, December 28, 2003 10:05 AM
Subject: Re: kind of off topic but ... P166 w/ 64 MB RAM


> Give it a go and see how it performs, but be prepared to increase the RAM
> (it's not that expensive, after all...)   :-)
>

Netfilter, vpn and all "router grade" functions will not eat too much CPU
and RAM resources.
I'm sure when Antony told you to prepare to add more RAM is because of SQUID
Cache.

I'm not a Linux Expert nor netfilter expert.
I used to deploy bering (Sub distro of LEAF) as Internet-Cafe gateway, with
No Squid-Cache.
Classic Pentium 166 class, 16 mb Flash-IDE, 32 mb RAM is happy.

For boosting Squid to it's top-performance,
First, Take care about it's Cache space. Use a large and High-Speed Storage
... if money is not a subject ... you can prefer High-Capacity Flash
IDE/SCSI storage.
Second ... when the number of user or traffic grow .... move to higher CPU
speed.

The Key is ... build a good monitoring system, hack snmpd, and run MRTG to
monitor all your network/mechine Load/performance/resources.
This way you can build your network starting from dialup-speed,  up to
multiple OC3 network :)

Sincerely
-bino-


