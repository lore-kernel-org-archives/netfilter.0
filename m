From: "Feighery, Patrick D." <feighery@mitre.org>
Subject: Problems with the ROUTE extension on a 2.6.18 or 2.6.19 Kernel
Date: Wed, 17 Jan 2007 11:09:55 -0500
Message-ID: <87ABB5B9BD11A240B9CBB3F0485AEC8901509E2F@IMCSRV4.MITRE.ORG>
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
To: netfilter@lists.netfilter.org

I have an application that makes use of the ROUTE extension which has
been running on a 2.6.17 kernel for some time now.  I am trying move
this app to either a 2.6.18 or a 2.6.19 based kernel.  This requires
getting the ROUTE extension to work with that kernel.=20

I started with a 2.6.18.2 kernel and iptables version 1.3.6 after I
applied patch-o-matic and rebuilt the kernel, I tried something simple
like

	iptables -t ROUTE -F

Iptables returns :Can't initialize iptables table 'ROUTE': Table does
not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

lsmod | grep ROUTE      indicates the modules is there and dmesg does
not show anything

I then tried the same with a 2.6.19.2 kernel and iptables versions
1.3.7.  Again applied patch-o-matic and rebuilt the kernel.
Unfortunately the same error occurred.

I realize that the ROUTE extension may be unsupported.  But it allows
you to perform some really cool features that I can't find any other
techniques to provide a similar function.

Any thoughts...


	Pat

feighery@mitre.org



