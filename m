From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: pptp patch
Date: Thu, 19 Jun 2003 09:32:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c33680$5fc95650$1001a8c0@s3ac>
References: <OKEKIACJCGNKMLKPKIIKAEJCCOAA.gcote@transat-tech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <OKEKIACJCGNKMLKPKIIKAEJCCOAA.gcote@transat-tech.com>
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
To: 'Gary Cote' <gcote@transat-tech.com>, netfilter@lists.netfilter.org


> . Your post said you built 2.4.21 netfilter with pptp support.
>   I guess this refers back to my first question. Are you
>   referring to the pptp-conntrack-nat.patch?
> 

http://netfilter.org/documentation/pomlist/pom-extra.html#pptp-conntrack
-nat

pptp-conntrack-nat [pptp-conntrack-nat.patch]
[pptp-conntrack-nat.patch.config.in]
[pptp-conntrack-nat.patch.configure.help]
[pptp-conntrack-nat.patch.help] [pptp-conntrack-nat.patch.makefile] 
Author: Harald Welte <laforge@gnumonks.org>
Status: Beta

This adds CONFIG_IP_NF_PPTP:
Connection tracking and NAT support for PPTP.

Note that this code currently has limitations
- can only NAT connections from PNS to PAC
- doesnt' support multiple calls within one session



