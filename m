From: =?iso-8859-1?q?Giancarlo=20Boaron?= <gboaron@yahoo.com.br>
Subject: Conntrack helpers for ICQ and MSN Messenger
Date: Fri, 10 Sep 2004 18:07:28 -0300 (ART)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040910210728.7056.qmail@web50206.mail.yahoo.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello.=20
I have some clients in my LAN that need to access ICQ
and MSN Messenger.
Reading some iptables tutorials, I discovered that ICQ
and MSN Messenger protocols are some kind of "complex
protocols" because they send some information about
openning new connections back inside the payload of
the packets.
So, iptables needs some CONNTRACK and/or NAT helpers
to let this protocols work properly.
I looked for it on NETFILTER home page but I didn't
find it. So, I need some help about it!
Where can I get an how to apply it on my iptables?
(Do I have to use patch-o-matic?)
Besides, I want to use the FORWARD chain instead of
sending this protocols via SQUID or another proxy.

Some solution?

Regards
Giancarlo



=09
=09
	=09
_______________________________________________________
Yahoo! Messenger 6.0 - jogos, emoticons sonoros e muita divers=E3o. Instale=
 agora!
http://br.download.yahoo.com/messenger/

