From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables -t nat -A OUTPUT - j DNAT
Date: Sat, 24 May 2003 11:53:05 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CCA@wardrive.citadelcomputer.com.au>
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
To: Leszek Zur <lzur@record.com.pl>, netfilter@lists.netfilter.org

this usually means you did not compile the patch-o-matic patch to fix =
the OUTPUT bug. Can you check this and make sure it's done as it's not =
default (for some weird resason)..

-----Original Message-----
From: Leszek Zur [mailto:lzur@record.com.pl]
Sent: Saturday, May 24, 2003 12:41 AM
To: netfilter@lists.netfilter.org
Subject: iptables -t nat -A OUTPUT - j DNAT=20


Hello all.

Slackware 9.0
kernel 2.4.20
iptables 1.2.7a

iptables -t nat -A OUTPUT -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2
iptables: Invalid argument

From iptables manual:
   DNAT
       This  target  is  only valid in the nat table, in the PREROUTING =
and
OUTPUT chains,
       and user-defined chains which are only called from those chains.  =
It
specifies that
       the destination address of the packet should be modified (and all
future packets in
       this connection will also be mangled), and rules should cease =
being
examined.   It
       takes one type of option:

       --to-destination ipaddr[-ipaddr][:port-port]
              which can specify a single new destination IP address, an
inclusive range of
              IP addresses, and optionally, a port range (which is only
valid if the  rule
              also  specifies  -p tcp or -p udp).  If no port range is
specified, then the
              destination port will never be modified.



anybody can help me ??



