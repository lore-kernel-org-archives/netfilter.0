From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: lost UDP packets with matching NAT rules
Date: Tue, 14 Feb 2006 22:21:38 +0100
Message-ID: <200602142221.39824@krak>
References: <freemail.20060114103405.20767@fm05.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <freemail.20060114103405.20767@fm05.freemail.hu>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: =?iso-8859-2?q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>


  Hi,

On Tuesday 14 February 2006 10:34, Keser=FB Korn=E9l wrote:
> I'm using iptables (v1.3.4 on a 2.6.15.3 kernel) in order to NAT
> incoming UDP packets arriving on a single IP:port (1-1 rules in PRE-
> and POSTROUTING chains in the nat table). I found out that packets are

  Why do you need two rules here? Redirecting incoming UDP packets to a=20
single IP:port has nothing to do with POSTROUTING, it's a single rule on=20
PREROUTING.

> How could I find out, why are the packets lost? Is there a log entry
> somewhere that says if an UDP packet was dropped because of... ?

  Try monitoring /proc/net/stat/ip_conntrack. I guess the number you find=20
in the insert_failed column will match the number of dropped packets.

=2D-=20
 KOVACS Krisztian

