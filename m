From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: How to install patch-o-matic
Date: Sat, 28 Aug 2004 10:42:27 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9064210@asimail2.alphanumeric.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> On August 27, 2004 04:50 am, Bassam A. Al-Khaffaf wrote:
> > Thanks for the great information,
> >     I have successfully upgraded and recompiled the kernel according =
to
> > the URL you gave to me.
> >
> > You have mentioned to compile the user space, so what do u mean by =
user
> > space and how to compile it, do you mean I have to go inside the
> > /usr/src/iptables-1.2.11 and write the following instructions again:
> >
> > make KERNEL_DIR=3D/usr/src/linux-2.4.27
> > make install KERNEL_DIR=3D/usr/src/linux-2.4.27
> >
> > Do I need to compile this user space before I start the actual
> > configuration and compilation for the kernel as described in the URL
> > http://www.digitalhermit.com/linux/Kernel-Build-HOWTO.html?
>
> >
> > Regards
> > Bassam
> >
>
>       Short answer is yes.
>
>       iptables userspace refers to the iptables code itself that is =
NOT part of the
> kernel (kernelspace)
>       Thus the iptables package itself.

and regarding the order:  patch & recompile kernel, then recompile =
userspace.  the userspace tools are compiled against the kernel sources, =
and detect the patches you have applied.

-j
