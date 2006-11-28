From: Brane F.=?utf-8?Q?Gra=C4=8Dnar?= <bfg@frost.ath.cx>
Subject: strange udp redirect problem
Date: Tue, 28 Nov 2006 08:44:40 +0100 (CET)
Message-ID: <13930.86.61.71.111.1164699880.squirrel@86.61.71.111>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: laforge@gnumonks.org

Hello there.

I have strange udp port redirection problem.


Here is my setup:


A (192.168.221.101) -> (192.168.221.100) GW (192.168.222.100) ->
(192.168.222.101) B

I would like to redirect packet when A would sends udp packet to
192.168.222.101 port 6000 to 192.168.221.100 port 7000 where runs udp
proxy server.

Well, hosts A and B can ping/telnet eachother, but port redirect does not
work:

iptables -t nat -A PREROUTING -p udp --dport 6000 -j REDIRECT --to-port 7=
000

Well, noting happens... packets traverse firewall/gw without any
redirection...

Why?

The same thing works flawlessly with tcp protocol (-p tcp, running tcp
listening server on port 7000)...

What am i doing wrong?

Brane
















