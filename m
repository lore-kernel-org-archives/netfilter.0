From: =?ISO-8859-1?Q?Fabr=EDcio?= Barros Cabral <fxcabral@yahoo.com.br>
Subject: Changing packets captured using IP Queue
Date: Sun, 04 Sep 2005 23:48:04 -0300
Message-ID: <1125888484.7901.14.camel@hades.no-ip.org>
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
To: netfilter@lists.netfilter.org

Hi People!

I'm using ip_queue to capture all packets which transverse a router
(FORWARD rule), and I'd like know if is possible change a packet (I'm
thinking change destination address, port or other data in payload) and
re-inject this packet again in the network (to the box re-routing the
packet). It's a bit similar what NAT does.

If I can't do that with ip_queue, could anyone give me a idea how can I
do that?

Thanks in advance,

--fx


=09

=09
	=09
_______________________________________________________=20
Yahoo! Messenger com voz: PROMO=C7=C3O VOC=CA PODE LEVAR UMA VIAGEM NA CONV=
ERSA. Participe! www.yahoo.com.br/messenger/promocao


