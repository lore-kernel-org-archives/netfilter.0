From: =?utf-8?q?O=C4=9Fuz_Yar=C4=B1mtepe?= <comp.ogz@gmail.com>
Subject: 3 ethernet card package transfer
Date: Thu, 6 Sep 2007 23:08:12 +0300
Message-ID: <200709062308.12951.comp.ogz@gmail.com>
Reply-To: comp.ogz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:from:reply-to:to:subject:date:user-agent:mime-version:content-type:content-transfer-encoding:content-disposition:message-id;
	bh=g5BzDgQTr3FRtjr8xhIzasGs8TRO9BIUtqJIS40C1zU=;
	b=ELIvk4MDAZEkaFARA4a+nf5Oy6ZVoZMNtkrH5OZvz3KMVsd+VEYqmBt76xUAyIgCYSErEEwho808szr3x22PTaaPYgt51qu5KpcetAvKCRLD89v8+RRPZjPPY1PrA9/GzFmmKeQZ9sTFNa+azPCc3NR2WvgKkixkhOwMEX2VDZo=
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

Hi,

In my machine i have 3 ethernet cards: eth0, eth1 and eth2

eth0 had 192.168.1.20, eth1 192.168.1.1 and eth2 had 10.0.0.1 ip. eth1 and=
=20
eth2 are connection to pcs that have the gateway information of those ips.=
=20
What i was trying was to send a package using eth1 to eth2, so i was sendin=
g=20
tcp packagex using hping2 from the pc that has the gateway of 192.168.1.1=20
(pc1, 192.168.1.2) to the other pc that has the gateway of 10.0.0.1 (pc2,=20
10.0.0.2). Every ethernet card was plugged to the same switch, also pc1 and=
=20
pc2. What my expectation was to see a traffic at eth1 and eth2 after the=20
iptables rules here: http://rafb.net/p/8bLvVP45.html and after adding=20
iptables -I FORWARD 1 -s 192.168.1.2 -d 10.0.0.2 -j ACCEPT

But i saw a traffic at eth0 and eth2.=20

=46irst, how can i fix it with iptables configuration?

When change 192.168.1.1 ip to 172.16.0.1 and configure the pc1 according to=
=20
that gateway i saw only traffic at eth1 and eth2, so it seems the problem w=
as=20
beeing in the same network.=20

If i change eth1 to 192.168.1.1, eth2 to 192.168.2.1 and eth0 to 192.168.3.=
1=20
will it work again, which will fix being on a different network?

And my last question at the 172.16. example, that is when the packages are=
=20
being transfered from eth1 to eth2, a routing is done internally. Is that=20
done automatically, or how can the the machine decide when it gets a packag=
e=20
from eth1 and sees the destination ip and say ok i should send to the eth2?

Thanx.
=2D-=20
O=C4=9Fuz Yar=C4=B1mtepe
http://www.yarimtepe.com/en

