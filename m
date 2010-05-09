From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Mon, 10 May 2010 01:16:28 +0200
Message-ID: <4BE7424C.9020108@netfilter.org>
References: <201005061651.40203.rfeng@wurldtech.com> <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr> <201005070917.27301.rfeng@wurldtech.com> <alpine.LSU.2.01.1005071823100.23210@obet.zrqbmnf.qr> <4BE46649.1040703@netfilter.org> <4BE4669B.4030904@netfilter.org> <alpine.LSU.2.01.1005072144530.31492@obet.zrqbmnf.qr> <4BE4747D.9010705@plouf.fr.eu.org> <alpine.DEB.2.00.1005082227270.30449@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010408050601000404050402"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1005082227270.30449@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, Jan Engelhardt <jengelh@medozas.de>, Richard Feng <rfeng@wurldtech.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010408050601000404050402
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Jozsef Kadlecsik wrote:
> On Fri, 7 May 2010, Pascal Hambourg wrote:
> 
>>> I think what was really meant was tcp_loose, not tcp_be_liberal.
>> In my understanding, tcp_loose only allows conntrack to pick up
>> connections from the middle, but packets are still INVALID until the
>> required number of packets is seen and accepted. Am I wrong ?
> 
> No, the packets are set to the usual states, there's no packet counting.
> 
> With tcp_loose enabled (default) conntrack accepts non-SYN packets as 
> "NEW" ones, i.e. attempts to pick up connections from the middle.
> 
> With tcp_be_liberal enabled (default is disabled) out of window packets 
> are not marked as INVALID.

I have applied the following patch to the documentation based on this
discussion. I have also uploaded a new version of the webpage.

--------------010408050601000404050402
Content-Type: text/x-patch;
 name="f.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="f.patch"

doc: description on how to block traffic with conntrack was incomplete

From: Pablo Neira Ayuso <pablo@netfilter.org>

This patch completes the documentation with the following discussion
that took place in the mailing list.

http://marc.info/?l=netfilter&m=127335152521674&w=2

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---
 doc/manual/conntrack-tools.tmpl |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/doc/manual/conntrack-tools.tmpl b/doc/manual/conntrack-tools.tmpl
index b897318..ab4e5fb 100644
--- a/doc/manual/conntrack-tools.tmpl
+++ b/doc/manual/conntrack-tools.tmpl
@@ -19,7 +19,7 @@
   </authorgroup>
 
   <copyright>
-   <year>2008</year>
+   <year>2008-2010</year>
    <holder>Pablo Neira Ayuso</holder>
   </copyright>
 
@@ -198,7 +198,12 @@ conntrack v0.9.7 (conntrack-tools): 1 flow entries have been shown.
 conntrack v0.9.7 (conntrack-tools): 1 flow entries has been updated.
  </programlisting>
 
-<para>Delete one entry, this can be used to block traffic (you have to set <emphasis>/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal</emphasis> to zero).</para>
+<para>Delete one entry, this can be used to block traffic if:</para>
+<itemizedlist>
+ <listitem><para>You have a stateful rule-set that blocks traffic in INVALID state.</para></listitem>
+ <listitem><para>You have to set <emphasis>/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loose</emphasis> or <emphasis>/proc/sys/net/netfilter/nf_conntrack_tcp_loose</emphasis>, depending on your kernel version, to zero.</para></listitem>
+</itemizedlist>
+
 <programlisting>
  # conntrack -D -p tcp --dport 3486
  tcp      6 431982 ESTABLISHED src=192.168.2.100 dst=123.59.27.117 sport=34846 dport=993 packets=169 bytes=14322 src=123.59.27.117 dst=192.168.2.100 sport=993 dport=34846 packets=113 bytes=34787 [ASSURED] mark=1 secmark=0 use=1

--------------010408050601000404050402--
