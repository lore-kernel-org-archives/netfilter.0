From: Thanos Panousis <pthanos@gmail.com>
Subject: Packets from "self" dont pass through netfilter
Date: Wed, 11 Jan 2006 16:35:24 +0100
Message-ID: <4dcb3660601110735o30468a40m87b7629d8b0e041d@mail.gmail.com>
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

Hello,

I have bothered this list before with a little project I am working
on, so here goes again.

I have 3 hosts: a client, a primary and a backup server, all on a HUB,
so everybody hears everybody else's traffic. The primary and the
backup have the same IPs AND the same MACs. The backup has

ifconfig eth0 -arp
ifconfig eth0 promisc

, meaning I have disabled arp broadcasting and I ve put its interface
in promisc mode. I am using iptables in the backup to redirect all
traffic going in or out of its NIC to a QUEUE target, and these
packets get processed by a script of my that is suppossed to do
smthing.

So, say I do a telnet from client to primary(and the backup, since
they got the same IP). The primary will do the TCP handshake OK, and
the backup will get fucked up, sending RST tcp packets. What SHOULD
traverce the firewall (and hence the QUEUE target) on the backup is:

-the clients SYN packet going in
-the primary SYN/ACK packet going in
-the backup SYN/ACK going out
-the client ACK going in

then the backup server would see the wrong ACK that came in and get
fucked up(send an RST?).

But the packets that come from the primary server(which has the same
IP/MAC) NEVER go in the backups QUEUE. Why is that?? I dont grab them
at the QUEUE target, but I can see them crossing if I use ethereal!

