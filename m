From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Iptables problem
Date: Wed, 25 Aug 2004 16:04:17 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512E4@asimail2.alphanumeric.com>
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

> I use slackware 9.0. I have made the upgrade to the lastest iptables, =
and nowi want to compile the 2.4.27 kernel and enable nat of pptp. I =
applied the path-o-matic and actvated the option for it. After compile =
the kernel, almost everything is funcional, but the targets MASQUERADE =
and SNAT had a problem.. Show an error: Invalid argument. They are =
Modules and are loaded at the kernel. A frind had the same problem doing =
the same thing I wanted to do!
>
> Anyone knows what can i do ?
>
>
> Marcelo

i can tell you "what" you need to do, but i learned this morning that i =
can't necessarily tell you "how" to do it.

what:  you need to rebuild your userspace "iptables" utility.  the error =
you're seeing is what happens when you apply patches to the kernel that =
change the internal structures of netfilter.  in order to interact with =
the new kernel, you need to compile a new iptables command against that =
patched kernel source.

this is normally as simple as:

cd /usr/local/src/iptables-x.x.x
make KERNEL_DIR=3D<<where-you-built-your-kernel>>
make install KERNEL_DIR=3D<<where-you-built-your-kernel>>

i can only assume that your friend is Paulo Andre, and this is =
apparently more complicated than i realize.

-j

