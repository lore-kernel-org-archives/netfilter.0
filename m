From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: failure when using --string
Date: Thu, 26 Aug 2004 18:54:21 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC906420B@asimail2.alphanumeric.com>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

> Hi,
>
> Any ideas why this would be failing?  It's the example straight out of
> the documentation:
>
> host# iptables -A INPUT -m string --string 'cmd.exe' -j QUEUE
> iptables: No chain/target/match by that name
>
> This is on a Debian Stable box.  Is it possible that "-m string" is
> permitted by the userspace tool but the functionality hasn't been
> included in the kernel?

yup--most distros do not compile the string match (i *think* suse does). =
 try:

ls /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ipt_string.o

and make sure you have the actual module.  if not, grab p-o-m and follow =
the instructions:

  =
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.h=
tml

-j
