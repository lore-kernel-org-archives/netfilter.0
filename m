From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: DNAT with orignal source address
Date: Wed, 2 Aug 2006 16:34:53 -0600
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE125824@q.LeBlancNet.us>
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

I'm having problems with my e-mail server saying that every connection
originates from the NAT box. I checked it on my other linux server and
sure enough even though I have 1:1 DNAT and a reverse SNAT configured,
packets destined for my server show the NAT box as the source. How do
you configure DNAT so that it keeps the original Internet address and
does not mangle it, only the destination address to my server on a
private subnet?

iptables -t nat -A PREROUTING -d 1.1.1.4 -j DNAT --to-destination
192.168.2.10
iptables -t nat -A POSTROUTING -s 192.168.2.10 -j SNAT --to-source
1.1.1.4

So the gateway's public address is 1.1.1.1 and the e-mail server is
1.1.1.4. The e-mail logs and ssh logins all show that every connection
is made from 1.1.1.1 even though the connections are made from the
Internet.

Thanks,
Robert LeBlanc

