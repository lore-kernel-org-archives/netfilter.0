From: "Tanen" <tanen@tanen.dyndns.org>
Subject: [IP ?] what ip must be filtered ?
Date: Thu, 11 Dec 2003 09:58:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d701c3bfc4$eabdac20$02fea8c0@ALESK>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I'm confused, i try to set up my Firewall, with iptables sure :)
The problem, an easy problem to solve for you, but a big for me, it's =
the
next :
I have an Dedicated server, Linux, on an internal local network, who =
have as
ip 192.168.0.1, and other puters have 192.168.0.2 *.3 *.4 etc ... BUT =
the
dedicated box, use the reuters of my connection to be connected to =
internet.
This reuters have as ip 192.168.0.100, and my external ip have as ip
63.*.*.*, my problem is to know, WHAT ip i must filter, to prevent of =
any
attack or hack, the reuters is forwarding the needed port (http,
pop/imap/smpt) to the dedicated box. All work fine sure. But what IP i =
must
filtered, and authorised for have my firewall working fine ? actualy =
when
i'm filtering my local ip, or my external ip, my mail server, isn't =
getting
any mail from www, someone can help me please ?

Thanks you.


