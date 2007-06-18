From: Daniel <bozo@bozo.dnsalias.net>
Subject: NAT trouble (?) with Apple Macbook Pro
Date: Mon, 18 Jun 2007 9:25:47 +0200
Message-ID: <e665a3c72404c4395a117794eb0011dc@localhost>
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

Greetings,

   I have been running for the past few years a Linux box to drive my DSL=
 connection (using an USB modem), and sharing the connection to the rest =
of my LAN using Iptables masquerading :

    iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

I've never had the slightest trouble sharing that connection to my Window=
s desktop (and it's been working as well on my Sony PSP). Now I just got =
myself an Apple laptop (Macbook Pro), and internet access is working erra=
tically (just for that laptop, the Windows desktop still works just fine)=
.

The symptoms : some (not many) web sites work normally. Many others won't=
 display, going into timeout, typically while waiting for images to load =
(sometimes, I can even get the page layout and text, but never get the pi=
ctures). On the other hand, I've been able to establish stable SSH connec=
tions through the NAT box.

I am pretty sure the problem doesn't come from :

- the kind of connection between the laptop and the Linux NAT box, as I g=
et the exact same symptoms using wireless or a wired link
- MacOS, as I've also installed Windows on the laptop, and the symptoms p=
ersist
- the browser, as I've had the same trouble with Safari, Firefox and Inte=
rnet Explorer
- some kind of hardware defect in the laptop, as everything works just fi=
ne when using my neighbour's internet access

Therefore, I believe the problem to come from the laptop-NAT box interact=
ion. I tried playing around with the MTU, without success. The only expla=
nation left to me would be trouble at the NAT level, though I can't even =
remotely picture why it would only affect that laptop.

The Linux box is an Ubuntu 6.10, running kernel 2.6.15(ubuntu version : -=
28), and Iptables 1.3.3 (ubuntu version : -2ubuntu4).

Is there any way I can trace the NAT activity to check whether the proble=
m stems from that or not?

Thanks in advance,

    Daniel



