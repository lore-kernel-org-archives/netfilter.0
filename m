From: arif <djreef@yahoo.com>
Subject: Help with Iptables Tutorial and Port Forwarding/NAT
Date: Thu, 11 Mar 2004 16:27:36 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040312002736.88891.qmail@web10204.mail.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi, I am having a hard time trying to figure out why
any packets I am trying to forward to my internal
network are being dropped. I am using the
'rc.firewall' file that is included in the 'Iptables
Tutorial'
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
=20

Everything is fine, except I can't get any packets to
forward to an internal webserver here. I am using this
line:=20


/sbin/iptables -t nat -A PREROUTING --dst 1.2.3.4 -p
tcp --dport 80 -j DNAT --to-destination 10.0.0.3:80

When I look at the packet count doing iptables -t nat
-L -v I can see the packet count go up on that rule,
every time i try and connect to port 80. But in my
logs, I see that it matched a logging rule, and shows
up as 'IPT FORWARD packet died", so i guess it is
ending prematurely in the forward chain? Any help
would be greatly appreciated!!! THANKS!!!


__________________________________
Do you Yahoo!?
Yahoo! Search - Find what you=92re looking for faster
http://search.yahoo.com

