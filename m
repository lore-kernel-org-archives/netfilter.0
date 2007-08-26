From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: netfilter optimization.
Date: Sun, 26 Aug 2007 13:27:58 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024F4BE@pxtbenexd01.pxt.primeexalia.com>
References: <20070825232124.GA26316@internet24.de><57F9959B46E0FA4D8BA88AEDFBE5829024F4BC@pxtbenexd01.pxt.primeexalia.com>
	<20070826105855.GB15249@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <20070826105855.GB15249@internet24.de>
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
To: Thomas Jacob <jacob@internet24.de>, netfilter@lists.netfilter.org

> Oh yes sorry,  you can't set it in sysctl.conf then, since the module
> must probably already be loaded if you can use that. Try the module
> load parameters instead (options ip_conntrack hashsize=3DXXXX in
> /etc/modprobe.d/somefile worked in older kernels).
>=20
> I am actually just patching the numbers in to the kernel version
> myself, since I don't want to have a module-based kernel on my
firewall
> box.

I've also found the same setting in a couple of list groups.  Here's
what I have, but it doesn't seem to work:

[root@localhost etc]# cat /etc/modprobe.conf
options ip_conntrack hashsize=3D1048576

alias eth0 eepro100
...

I'm going to play around with it for a while.  If I can't get it to work
through modprobe I'll just tweak /etc/init.d/iptables to populate
/sys/...  since that seemed to work.  I was just looking for a more
elegant solution.

Thanks for all of the help.  This solve my problem of hitting the limits
in any event.

Gary


