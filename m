From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Iptables error
Date: Wed, 25 Aug 2004 08:56:49 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512D0@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> This morning I rebooted one of our firewalls, I have created a new =
kernel for
> it (2.4.20, patched kernel with latest p-o-m ng).
> When I run my firewall script, all I get is errors, seems to be a =
problem with
> iptables 'tables' as none of the rules are create but the default =
policies
> are in place, in dmesg I have the following error:
>
> ip_tables: table screwed up!
>
> This firewall is a production server and I can only really take it =
down
> tonight to check it, anyone had something like this before?
>
> Paulo

sounds to me like you applied p-o-m, rebuilt your kernel, but did not =
rebuild your userspace.  anytime you apply a patch from pom that changes =
structures, or requires additional libraries, you need to recompile your =
userspace iptables utilities.  since it's unclear to me when the =
userspace rebuild is required--i do it everytime.  sounds like it was in =
this case for you...

-j



