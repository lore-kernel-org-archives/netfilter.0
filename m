From: pgaynor@storactive.com
Subject: PPTP connection tracking patch
Date: Wed, 26 Mar 2003 16:30:05 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF9D9FD05D.2ACE3451-ON88256CF6.000219D2-88256CF6.0002A4CD@storactivexd.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0002A4CB88256CF6_="
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multipart message in MIME format.
--=_alternative 0002A4CB88256CF6_=
Content-Type: text/plain; charset="US-ASCII"

Hi,

   When I build a Kernel with the ip_nat_pptp and ip_nat_proto_gre I 
recieve an
iptables: "invalid command" when my firewall script trys to run.   This 
error is with -j MASQUERADE.
When I run the firewall script without these modules installed the 
MASQUERADE target works.
I have attempted this with both kernel 2.4.19 and 2.4.20.  I have compiled 
the latest iptables 1.2.7a
and i am using the latest pom.  Any help is greatly appriciated.

Thanks in advance,

-PaulG 
--=_alternative 0002A4CB88256CF6_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hi,</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; &nbsp;When I build a Kernel with
the ip_nat_pptp and ip_nat_proto_gre I recieve an</font>
<br><font size=2 face="sans-serif">iptables: &quot;invalid command&quot;
when my firewall script trys to run. &nbsp; This error is with -j MASQUERADE.</font>
<br><font size=2 face="sans-serif">When I run the firewall script without
these modules installed the MASQUERADE target works.</font>
<br><font size=2 face="sans-serif">I have attempted this with both kernel
2.4.19 and 2.4.20. &nbsp;I have compiled the latest iptables 1.2.7a</font>
<br><font size=2 face="sans-serif">and i am using the latest pom. &nbsp;Any
help is greatly appriciated.</font>
<br>
<br><font size=2 face="sans-serif">Thanks in advance,</font>
<br>
<br><font size=2 face="sans-serif">-PaulG </font>
--=_alternative 0002A4CB88256CF6_=--

