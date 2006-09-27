From: "Ryan Belcher" <Ryanb@sealevel.com>
Subject: RE: iptables REJECT NAT Internal -> External Portrange
Date: Wed, 27 Sep 2006 12:43:42 -0400
Message-ID: <4F7EDC4D48D076428187517D1D77B017239AA6@mercury.int.sealevel.com>
References: <Pine.LNX.4.61.0609271830190.17586@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <Pine.LNX.4.61.0609271830190.17586@yvahk01.tjqt.qr>
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
Cc: netfilter@lists.netfilter.org

Yeah, I figured that out while iteratively trying to get this to work.  =
I guess I was using that command as more of a pseudocommand in the =
context of this email. =20

I've tried putting *roughly* the same rule into filter:OUTPUT =
filter:FORWARD and nat:PREROUTING and each time I either got a complaint =
from iptables or when I tried to modify the rule to "fit" into the above =
mentioned chains it never worked (matched any packets).

Do I have to bounce this packet from one table to another to get this to =
work?

>iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 10000:11000 -j =
REJECT --reject-with icmp-host-unreachable
>
>The above command returns with "Invalid Argument".

REJECT is to be used in -t filter.


Jan Engelhardt
--=20

