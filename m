From: Christos Panagiotakis <chrismfz@gmail.com>
Subject: Masquerading problem - question
Date: Sun, 8 Jan 2006 08:21:52 +0200
Message-ID: <dac71d7b0601072221j8a15c80g@mail.gmail.com>
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

Hello people. This is my first post, please be nice with me :-)

I have a little network with 3 computers. 2 workstations, 1 server.
the network is 10.166.0.0
server 10.166.0.1
1 workstation 10.166.0.2 and a new one the third 10.166.0.3
server has 2 interfaces. the one is connected with another network
( 10.165.0.0) wirelessly. from the "main" server they assigned me with
2 internet static ips (for 10.166.0.1 and 10.166.0.2). But when I took
the third one (10.166.0.3) I wanted to connect it with internet.
I did echo 1 > /proc/sys/net/ipv4/ip_dynaddr
and the problematic one:
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
thats good! it worked! But the problem is that both 10.166.0.2
and 10.166.0.3 having internet with the server's ip address...
I just want 10.166.0.3 to share the same static ip address.
I dont know what exactly to do to make only 10.166.0.3 to "share"/masq
the same ip with the server. And now I have both 10.166.0.2 and 10.166.0.3
with the same ip, yeap its working but I need the second static ip to 10.16=
6.0.2
and I dont know what to do...

Christos Panagiotakis

ps: forgive me for my awful english I hope to understand me

