From: "Todd Landfried" <tlandfried@hotmail.com>
Subject: How to redirect browsers with static proxy settings in iptables?
Date: Thu, 22 Jul 2004 14:48:52 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY2-F17K8rBKXGA7zy0000775f@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

I'm new to this firewall stuff, so any assistance would be greatly=20
appreciated. I've RTFM as much as I can, but nothing seems to fit this=20
situation exactly. Maybe I'm not asking the questions correctly in Google.

I have a Linux 7.3 (2.4.20-28) server with two NICs. One is eth0 and=20
connects to the router. The other is eth1 and connects to the switch that=20
connect the computers in the house. We have a couple of laptops that have t=
o=20
have static proxy settings in the browser for work, but it's a royal pain t=
o=20
have to go and unclick the "use proxy" settings all the time. I'm being=20
pressured to find a solution--if you know what I mean.

Let's say the proxy settings are:

IP: 68.152.65.65
Port: 80

Let's say the internal network is 10.1.0.x. I've also installed squid=20
(2.4.stable6) and I think I have that correct, but it's not working. I may =

be missing some component, but I'm not sure.

How do I create a rule that will route the browser traffic through the linu=
x=20
box without having to uncheck the silly checkbox everytime she comes home?

Any solution or guidance would be appreciated.

Thnks

Todd

_________________________________________________________________
Overwhelmed by debt? Find out how to =91Dig Yourself Out of Debt=92 from MS=
N=20
Money. http://special.msn.com/money/0407debt.armx


