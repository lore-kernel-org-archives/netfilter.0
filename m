From: "Todd Landfried" <tlandfried@hotmail.com>
Subject: Re: How to redirect browsers with static proxy settings in iptables?
Date: Sun, 25 Jul 2004 06:00:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY2-F18gRXrJrozCsV00007623@hotmail.com>
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

How does one know if a given packet is destined for a proxy server or not? =

Is there something in the packet that I can look for that tells me this? I =

know there's the port, but HTTP traffic also uses port 80. The reason I ask=
=20
is because the proxy address sometimes changes.

Thanks

Todd

&gt;From: Askar Ali Khan &lt;askarali@gmail.com&gt;
&gt;To: Todd Landfried &lt;tlandfried@hotmail.com&gt;
&gt;Subject: Re: How to redirect browsers with static proxy settings in=20
iptables?
&gt;Date: Fri, 23 Jul 2004 14:58:47 +0500
&gt;
&gt;Hi Todd
&gt;
&gt;you only need these rules for transparent proxy
&gt;
&gt;## Enable forwarding
&gt;echo 1 &gt; /proc/sys/net/ipv4/ip_forward
&gt;
&gt;## Enable MASUERADE for router
&gt;iptables --table nat --append POSTROUTING -s 192.168.0.0/24
&gt;--out-interface eth0 -j MASQUERADE
&gt;
&gt;## Enable Transparent proxy using squid port
&gt;iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT
&gt;--to-port 3128
&gt;
&gt;change port 3128 if you are running squid on some other ports such as=20
8080
&gt;
&gt;Regards
&gt;Askar
&gt;On Thu, 22 Jul 2004 14:48:52 -0700, Todd Landfried
&gt;&lt;tlandfried@hotmail.com&gt; wrote:
&gt; &gt; I'm new to this firewall stuff, so any assistance would be greatly
&gt; &gt; appreciated. I've RTFM as much as I can, but nothing seems to fit=
=20
this
&gt; &gt; situation exactly. Maybe I'm not asking the questions correctly i=
n=20
Google.
&gt; &gt;
&gt; &gt; I have a Linux 7.3 (2.4.20-28) server with two NICs. One is eth0 =

and
&gt; &gt; connects to the router. The other is eth1 and connects to the=20
switch that
&gt; &gt; connect the computers in the house. We have a couple of laptops=20
that have to
&gt; &gt; have static proxy settings in the browser for work, but it's a=20
royal pain to
&gt; &gt; have to go and unclick the &quot;use proxy&quot; settings all the=
=20
time. I'm being
&gt; &gt; pressured to find a solution--if you know what I mean.
&gt; &gt;
&gt; &gt; Let's say the proxy settings are:
&gt; &gt;
&gt; &gt; IP: 68.152.65.65
&gt; &gt; Port: 80
&gt; &gt;
&gt; &gt; Let's say the internal network is 10.1.0.x. I've also installed=20
squid
&gt; &gt; (2.4.stable6) and I think I have that correct, but it's not=20
working. I may
&gt; &gt; be missing some component, but I'm not sure.
&gt; &gt;
&gt; &gt; How do I create a rule that will route the browser traffic throug=
h=20
the linux
&gt; &gt; box without having to uncheck the silly checkbox everytime she=20
comes home?
&gt; &gt;
&gt; &gt; Any solution or guidance would be appreciated.
&gt; &gt;
&gt; &gt; Thnks
&gt; &gt;
&gt; &gt; Todd
&gt; &gt;
&gt; &gt; _________________________________________________________________
&gt; &gt; Overwhelmed by debt? Find out how to 'Dig Yourself Out of Debt'=20
from MSN
&gt; &gt; Money. http://special.msn.com/money/0407debt.armx
&gt; &gt;
&gt; &gt;

_________________________________________________________________
Don=92t just search. Find. Check out the new MSN Search!=20
http://search.msn.click-url.com/go/onm00200636ave/direct/01/


