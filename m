From: Askar Ali Khan <askarali@gmail.com>
Subject: router/firewall
Date: Fri, 2 Jul 2004 10:35:45 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e504070122354e2d19d5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

Im learning lot of new things here specially from Mr. Anthony Stone he
is master :)

Alright here with another very beginner question :)
my linux box is part of LAN where net is connected via windowz system.
my linux box uses windows box as gateway to Internet.
There is another windowz client (1) now I want to make my this linux
box "gateway/firewall" for that window client.

first thing I did to enbble forwarding on  my linux box with..
                net.ipv4.ip_forward = 1

my only  interface on this linux box is eth0 i also created another
vitual interface eth0:1, now i want to accept LAN tarffic from windows
client on eth0 and forward it "outbound" on eth0:1
howto? :)

I will appreciate if someone teach me for both cases
1) to use the interface etho0 to foward packets
2) also to use the other virtual interface eth0:1 for fowarding

It means I need to separate scripts one for eth0 and another for eth0:1

Thanks in adance

Askar

