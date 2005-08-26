From: "Thomas Raef" <traef06@ebasedsecurity.com>
Subject: RE: iptables v1.3.3
Date: Fri, 26 Aug 2005 10:33:53 -0500
Message-ID: <D2EA20593E6AAD4DA6D07DE0EC12D16162EC@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Damon Gray <dgray@internap.com>
Cc: netfilter@lists.netfilter.org

That's what I was missing.

Thank you.

-----Original Message-----
From: Damon Gray [mailto:dgray@internap.com]=20
Sent: Friday, August 26, 2005 10:21 AM
To: Thomas Raef
Cc: netfilter@lists.netfilter.org
Subject: Re: iptables v1.3.3


Make sure when you compiled 1.3.3 your KERNEL_DIR was set correctly=20
because libipt_recent.so will only compile if the .recent-test script in

the extensions directory finds the file:

$KERNEL_DIR/include/linux/netfilter_ipv4/ipt_recent.h

-Damon-

On Fri, 26 Aug 2005, Thomas Raef wrote:

> I have been running 2.6.11.7 kernel with iptables v1.3.1 and I
recently
> downloaded the full v1.3.3 tarball.
>
>
>
> I'm able to make && make install the new iptables v 1.3.3 but when my
> rules load it can't find libipt_recent.so.
>
>
>
> I removed the old iptables first because I was having issues with it
> complaining that I was using iptables v1.3.3 (I'm iptables v1.3.1).
>
>
>
> How do I get libipt_recent.so?
>
>
>
> I do have libipt_recent.c but it's not creating the .so
>
>
>
> I did recompile the kernel with the same options selected as I had
> before. The only thing I'm trying to update is the version of
iptables.
>
>
>
> Should I have just patched the v1.3.1?
>
>
>
>
>

