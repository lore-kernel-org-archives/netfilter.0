From: "Philipp Stader" <me@ph1l.de>
Subject: MS PPTP Server behind Debian Internet Gateway
Date: Thu, 13 Nov 2003 18:11:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311131711.hADHBhEd031172@mini001.webpack.hosteurope.de>
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

Hello List,

i've spent the last days trying to get connections from the Internet to =
a MS Windows 2003 Server on the local LAN via PPTP working. The LAN is =
connected to the Internet via a Debian box (vanilla 2.4.22 Kernel)which =
does the pppoe handling and masquerading:

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

This works.

While trying to make the Windows 2003 Server available for pptp =
connections from the outside [internet] i read a lot on the web and this =
mailinglists archive and came to the conclusion that i will have to =
patch the kernel with the pptp-conntrack-nat patch from Harald Welte [ =
http://www.netfilter.org/documentation/pomlist/pom-extra.html#pptp-conntr=
ack-nat ] and compile the userland tools to make things work.

But browsing a Forum i found the following fragments which actually do =
what i was trying:

iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 1723 -j DNAT =
--to-destination 192.168.200.99
iptables -A FORWARD -i ppp0 -m state --state NEW -p tcp -d =
192.168.200.99 --dport 1723 -j ACCEPT=20

iptables -A FORWARD -i ppp0 -m state --state NEW -p 47 -d 192.168.200.99 =
-j ACCEPT=20
iptables -t nat -A PREROUTING -i ppp0 -p 47 -j DNAT --to-destination =
192.168.200.99

192.168.200.99 is the Windows 2003 Server.

Is the above code sufficient? Will i run into trouble with it sooner or =
later? Users from the LAN don't and won't use PPTP Connections to other =
sites via internet. For which scenario do i have to patch the Kernel =
with the pptp-conntrack-nat patch?

Thanks for reading.

Kind regards

Phil


