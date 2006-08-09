From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: Problem with router connected to two ISPs (connection marking?)
Date: Wed, 9 Aug 2006 15:50:12 +0200
Message-ID: <5f27bf5930baa3a0281a14a9f32bf6cd@former03.de>
References: <200608082140.03815.marek.zachara@telperion.pl>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200608082140.03815.marek.zachara@telperion.pl>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Marek Zachara <marek.zachara@telperion.pl>, netfilter@lists.netfilter.org

I haven't really understood that in the documentation I've found, but=20
my understanding was that connmark and mark do not set the same type of=20=

mark (so packets marked using connmark won't match the fwmark of=20
iproute2).
Or am I wrong with that?

Apart from that: I experienced the same problem (very similar=20
situation, another port, however ;-) and haven't been able to resolve=20
it yet.
The only thing I've found out was that the rewrite of the reply packets=20=

does not really work - with exactly the effect thet you've described:=20
connection stuck in SYN_RECV forever.

Baltasar

--

Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


