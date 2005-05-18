From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: Re: SSH Brute force attacks
Date: Wed, 18 May 2005 19:51:23 +0200
Message-ID: <428B809B.2060904@wp.pl>
References: <NDBBKABJBJCIJNAELLKEIEACJFAA.jimm@simutronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NDBBKABJBJCIJNAELLKEIEACJFAA.jimm@simutronics.com>
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
To: netfilter@lists.netfilter.org

Jim Miller wrote:
> Is this true that Tarpit does not work with 2.6 kernels?  I was going to
> give it a try on one of my no-production firewalls.

so it seems, I tried compiling the kernel with the current ipt_TARPIT.c
version available in svn, but while loading the rulset, the -j TARPIT
returned 'invalid arg()'
here's some more info:
http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/patch-o-matic-ng/TARPIT/=
info?rev=3D3733&view=3Dmarkup

Title: iptables TARPIT target
Author: "Aaron Hopkins" <lists@die.net>
Status: Works for me
Repository: extra
Requires: linux < 2.6.0

Hope that this last line will change soon :]

--
With regards
=A3ukasz Hejnak

