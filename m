From: "Frederic SOSSON" <fred_sos@swing.be>
Subject: [newbie]
Date: Sun, 9 Mar 2003 11:53:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006901c2e62a$2d4ef780$3200a8c0@xp1700>
Reply-To: "Frederic SOSSON" <fred_sos@swing.be>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I'm juste a newbie in iptables ;)  My problem is, i have a linux box routing my DSL
connection, i set these rules:

iptables -A FORWARD -i ppp0 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -A FORWARD -j LOG --log-prefix "Firewall: "

== Great, i have acces to thet NET ! ==

I have also a machine (192.168.0.50) in my local network running an FTP client this
one runing an identd daemon (port 113) to access to an FTP server on the internet, i
have added this rule

iptables -t nat -A PREROUTING -p tcp --dport 113 -i ppp0 -j DNAT --to
192.168.0.50:113

But my FTP client tels me:

[11:51:58] PORT 192,168,0,50,13,161
[11:51:58] 200 PORT command successful.
[11:51:58] LIST
[11:52:02] 425 Can't build data connection: No route to host.

Any help would be appreciate ;)



Frederic



