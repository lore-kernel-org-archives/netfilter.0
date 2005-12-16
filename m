From: Thanos Panousis <pthanos@gmail.com>
Subject: a way to rewrite tcp ISNs?
Date: Fri, 16 Dec 2005 14:39:51 +0100
Message-ID: <4dcb3660512160539m17fa57favce756b8580d14f56@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello to everybody,

I just subscribed to the list; I already send an email to Harald
Welte, since my questions involves ct_sync, but I m sure he has better
things to do than answering my emails. So, here goes:

I 'm trying to implement a kind of a failover architecture, mainly
targeted for router machines. The goals are no loss of state
information, or dropped connections, since for example BGP keeps a
connection open between peers, and if the failover architecture is any
good, it should not allow these connections to get dropped.
So, my architecture is about the same with Harald Welte's poor mans
failover in his paper "replicating the fire, failover of stateful
firewalls".

A primary and a backup router, both on a HUB, both with the same MAC
and IP. The backup has MAC broadcasting suppressed, and also has (some
kind of) way of suppressing all his outgoing packets and is able only=20
to recv packets coming from clients. The primary can function
normally. This way ensures that state information is kept (almost)
synchronized (without guarantees) between primary and backup. Using a
heartbeat mechanism the backup queries the primary; when its
down(assume powered-off), the backup drops its firewall and starts
sending answers to the client.

One of the problems of the architecture is the ISN. Both primary and
backup will have the clients ISN number for the connection for the one
way connection. BUT the the primary will handshake his own (random)
ISN for his replies, and the secondary will not be able to establish a
connection due to the client not agreeing to use his (random) ISN.

Is there anyway to change the ISN of the backup node? I mean, can
iptables do that? Then what's left is to get the ISN that the primary
node issued.

I am deeply sorry for any errors/inaccuracies in the above ideas. I am
a new-comer to the low level TCP and netfilter theory. I just finished
my first rough study of RFC 793 :). Any ideas and comments/flames are
welcome.

