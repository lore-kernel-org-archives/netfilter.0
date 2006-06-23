From: =?iso-8859-1?q?Andr=E9=20Marques?= <andre_sesred@yahoo.com.br>
Subject: TOS packet marking can be cancelled by IPTables?
Date: Fri, 23 Jun 2006 15:01:44 +0000 (GMT)
Message-ID: <20060623150144.20297.qmail@web34506.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Lista NetFilter <netfilter@lists.netfilter.org>

Greetings to everyone!

Hope you can help me with a question. :)

I'm implementing a traffic control (shaping) scheme on
my job, based on the TOS value of the IP packet, and
next on Different Services configured on the router
(by the TOS marking).

At the moment, the scheme works this way:

1) The browser requests access to a site, using a
proxy server;

2) The proxy server identifies the user, and mark the
TOS field of the outgoing packet with an specific
value (for an example, 0x1c);

3) Looking the tcpdump records for this traffic (on
the proxy server), the packet is receiving the mark
normally. But when we try to see the traffic
"mirrored", for the exit communication links (Internet
Links), the packets lose their marking, turning to
0x00 (normal).

As the traffic goes normally (just the marks
disappear), i see that the packets are not being
dropped or rejected. I think that in any way the
packets are marked again as normal on the firewall,
but i can't confirm that.

I got two questions:

1) Does the firewall (IPTables) remove any marking
done by the proxy server?
2) If this really happens, is there any way to mark
the packets again, before they go to the router?

Any help would be very appreciated. Thanks in advance!


Andr=E9=20




=09



=09
	=09
_______________________________________________________=20
Yahoo! doce lar. Fa=E7a do Yahoo! sua homepage.=20
http://br.yahoo.com/homepageset.html=20


