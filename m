From: "lorenz fischer" <l.fischer@conx.ch>
Subject: DMZ - Lan - NetBios - connection problems
Date: Tue, 14 Jan 2003 18:00:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c2bbee$7d876130$f001a8c0@aeonbook>
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
To: netfilter@lists.netfilter.org

DMZ - Lan - NetBios - connection problems

hello all,
I'm quite new to linux and iptables but I read a bunch of documentations
and searched in several forums and I managed to set up a linux firewall
and most of it works pretty well. But concerning this problem I didn't
find anything even not by reading across those 16000 (;>) emails in the
archives of this list.
i have a Linux8.0 firewall with kernel 2.4.20. i use iptables for
packetfiltering.
everything that comes through my lan interface is being masqueraded
(nat). between the dmz interface and the wan interface theres no nat
masquerading i simply use ipforwarding (proxy arp) between them.

/-----------\            /---------\           /-----------\
|   Win2k   |------------| Linux   |-----------| DSL Pipe  |------->
Internet
| Webserver |            | Firwall |           \-----------/
|   (DMZ)   |            \---------/
\-----------/                 |
                              |
                              |
                              |
                         /---------\
                         | Windows |
                         | Clients |
                         |  (LAN)  |
                         \---------/

i have problems with some netbios connections. for example when i open a
ms access database which is located on the webserver from one of my
clients over a normal windows share the connections sometimes breaks.
half of the time ms access gives me a message like "this database is not
in your intranet or trusted site" and sometimes i'm able to open the
database but suddenly i get a "disk or network error". storing or
reading data from a client in the lan from/to the webserver in the dmz
is also difficult sometimes especially when more than about 2 or 3
clients are working on the webserver at the same time.

i dont see any packets dropped or denied by iptables. the problem is
most likely whith the server or the clients.. is it possible that the
webserver has a problem with all clients coming from the "same"
source-ip (because of my nat routing)? and if so, whats the best
solution for this problem. i thought about a vpn or including a second
network card into the webserver but im not very fond of both solutins
because i dont want to change anything on the webservers configuration
if it's possible.

can anyone give me some advice or resources where i can find a solution
for my problem?

thank you very much and greetings 

lorenz



