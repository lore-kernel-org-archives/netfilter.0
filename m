From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Help debugging iptables firewall....
Date: Tue, 25 Jan 2005 10:09:43 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F01991E@pxtvjoexd01.pxt.primeexalia.com>
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
To: Greg Cope <gregcope@gmail.com>, netfilter@lists.netfilter.org

Crap, I had a typo.  It should have been -i, not -o for the lan
interface

$IPTABLES -A FORWARD -o $DMZ_IFACE -i $LAN_IFACE -j ACCEPT

Try that and let us know.

Gary Wayne Smith


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Greg Cope
Sent: Tuesday, January 25, 2005 9:59 AM
To: netfilter@lists.netfilter.org
Subject: Re: Help debugging iptables firewall....

I think we are getting there:

The one you suggested gives an error:

Starting firewall: ^[[Aiptables v1.2.9: multiple -o flags not allowed

Looking at tcpdump on a few machines it looks like the packets are
getting through - but nothing gets sent:

17:57:18.168655 ex.e-dba.net.32931 > trotter.e-dba.net.1521: S
965495617:965495617(0) win 5840 <mss 1460,sackOK,timestamp 2026024
0,nop,wscale 0> (DF) [tos 0x10]

And then nothing else - sadly I am not a tcpdump expert.....

Any clues?  I am at a loss as to why this was working and now it does
not.....=20

Greg



