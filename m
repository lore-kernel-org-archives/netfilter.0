From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: dnatting
Date: Mon, 11 Jul 2005 20:42:26 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507112041001.14167@yvahk01.tjqt.qr>
References: <20050711151830.GA26670@tranquility.scriptkitchen.com>
	<Pine.LNX.4.61.0507111720230.26881@yvahk01.tjqt.qr>
	<42D2BCAF.4040906@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D2BCAF.4040906@gmx.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

> The Web proxy suggestion has me puzzled. :)

"me2", because given that 1.2.3.4 is a valid internet-wide IP (e.g. ppp0), 
10.x.y.z is the local net (eth0) and a client is 10.0.0.1 on eth0, there 
should not be any problem to connect from 10.0.0.1 to 1.2.3.4:80 and get it 
DNAT'ed.

Or do you mean that `telnet 127.0.0.1 80` on the DNAT-rulebox itself does not 
work [anymore]?



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/


