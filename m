From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: recompile kernel with CONNMARK and NTH TARGETS?
Date: Fri, 20 Aug 2004 12:41:47 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E35C@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: dravya <dravya@magma.ca>, Netfilter mailing list <netfilter@lists.netfilter.org>


> iptables v1.2.7a: Couldn't load target
> `CONNMARK':/lib/iptables/libipt_CONNMARK.so: cannot open shared
> object file: No such file or directory=20

/lib/iptables/libipt_CONNMARK.so will not exist unless you rebuild your
userspace (iptables) tools. I believe that best one for you would have
been the 1.2.9 set of tools. So, download the tarball, uncompress,
change the Makefile to make sure to change the prefixes (see below)to
that of your distribution. Run it with:
# KERNEL_DIR=3D<my_sources> make
# KERNEL_DIR=3D<my_sources> make install

PREFIXES
By the kernel version, I assume you're running RH9. I think redhat uses
the following directory prefixes:
LIBDIR=3D/lib
BINDIR=3D/sbin
MANDIR=3D/usr/man
INCDIR=3D/usr/include

