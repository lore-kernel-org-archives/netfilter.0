From: Michael Hissler <mhis38@freenet.de>
Subject: Re: Unable to block ICMP
Date: Tue, 17 Apr 2007 11:20:36 +0200
Message-ID: <46249164.1020902@freenet.de>
References: <46224132.4080702@gmail.com> <4622A0A4.70007@yahoo.de>
	<4623AA24.4000002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4623AA24.4000002@gmail.com>
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

Ronald wrote:

[...]

> That is weird, if you block ICMP outgoing in comodo, all the closed
> ports are shown as stealthed. This is really confusing ...

What is comodo?

Which scan test are you using? If it's a UDP scan this is not weird. If
a closed port (i.e. a port no service is listening on) is contacted, an
ICMP port unreachable message is sent back. By blocking this ICMP
message (or blocking all outgoing ICMP traffic), you get the same result
as if you blocked the incoming packet: the sender doesn't get a response
and so the port is 'stealthed'.
If it's a TCP scan, the kernel sends back a TCP Reset. In this case
blocking ICMP should have no effect (in this case: yes, it's weird).


BTW: If you block traffic to ports services are listening on, but accept
traffic to closed ports, someone who scans your IP knows:

1. You are there. He gets ICMP port unreachable messages or TCP Reset
for the closed but unblocked (not 'stealthed') ports.
2. He knows which ports you are running services on (-> the ports he
doesn't get the ICMP messages or TCP Reset).

This may not be what you want.


You wrote that skype requires to have everything open above port 1024.
This can't be true!
Skype works perfectly if you accept all outgoing traffic and

a) configure skype to use a certain port and accept incoming traffic to
this port,

or (better)

b) drop *all* incoming traffic and use connection tracking. This lets
pass all incoming packets belonging to a connection initialized by your
computer:
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
(you can leave out the ',RELATED' but then you'll run into trouble with
e.g. FTP and ICMP error messages)



michael





