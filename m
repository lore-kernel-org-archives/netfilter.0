From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: cant ping fw
Date: Wed, 06 Jul 2005 14:43:22 +0200
Message-ID: <42CBD1EA.2020500@eccotours.dyndns.org>
References: <42CBBE57.5060802@eccotours.dyndns.org>	<42CBC275.2090003@mnemon.de>	<42CBC8B9.8090605@eccotours.dyndns.org>
	<42CBCE98.2050004@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42CBCE98.2050004@mnemon.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rg=5FHarmuth?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

J=F6rg_Harmuth wrote:
> Hi Brent,

> 4.) /proc/sys/net/ipv4/icmp_echo_ignore_all is set to 1

AAHH you the man

[root@ns root]# cat /proc/sys/net/ipv4/icmp_echo_ignore_all
1
[root@ns root]#

oops
thanks for this

Brent



