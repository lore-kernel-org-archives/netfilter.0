From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables1.2.7 + pptp + rh9
Date: Tue, 21 Oct 2003 15:06:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E375B@alderaan.smgtec.com>
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
To: Fernando Barrocal <fbarrocal@uol.com.br>, netfilter@lists.netfilter.org

Um, yeah. You need to compile the userspace tools against the kernel
that you are installing.

-----Original Message-----
From: Fernando Barrocal [mailto:fbarrocal@uol.com.br]=20
Sent: Tuesday, October 21, 2003 3:00 PM
To: Daniel Chemko; netfilter@lists.netfilter.org
Subject: RE: iptables1.2.7 + pptp + rh9


Still after installing 1.2.8 it does not work. Do I need to compile ipt
?=20
and the kernel ?

At 19:15 21/10/2003, Daniel Chemko wrote:
>Download ipt 1.2.8 or 1.2.9 if it is out.
>Or, use the CVS userspace
>
># KERNEL_DIR=3D<yourkerneldir> make
># make install
>
>You might want to change the destination directories in the Makefile to
>conform to the Redhat deployment layout
>LIBDIR=3D/lib/
>MANDIR=3D/usr/man
>etc..
>
>-----Original Message-----
>From: Fernando Barrocal [mailto:fbarrocal@uol.com.br]
>Sent: Tuesday, October 21, 2003 2:04 PM
>To: netfilter@lists.netfilter.org
>Subject: iptables1.2.7 + pptp + rh9
>
>
>Hi,
>
>I am applying the pptp patch with patch-o-matic in my redhat 9.0.
>Somebody
>have somer step by step to patch the kernel, compile the iptable
>userspace
>and compile the kernel to accept DNAT ?
>
>Thanks in advance
>
>Fernando Barrocal



