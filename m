From: Rick Mann <rmann@latencyzero.com>
Subject: Inbound port mapping blocks outbound connection?
Date: Sun, 19 Dec 2004 13:45:29 -0800
Message-ID: <4CE68372-5207-11D9-BA43-000A95CFE5AA@latencyzero.com>
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

As I was writing this email about a problem connecting outbound, I 
discovered what my problem was. Now I have a  new problem: Why would an 
inbound port mapping prevent an outbound connection on one of those 
ports, as described below? TIA!

----------------

I set up a Fedora Core 2 machine to act as a gateway/router so that I 
could do NAT and split-route VPN traffic to my office and everything 
else directly out to the 'net, without having to do anything special on 
my other computer(s) (I primarily use a PowerBook behind the router).

Everything has worked fine for some time. A few months ago, I set up 
inbound port mapping to support BitTorrent from a single machine behind 
the router. It's been working like gangbusters.

A couple of weeks ago, the power supply started giving me problems, so 
I replaced it (meaning I had to reboot my gateway). Around the same 
time (I can't say for sure), I lost the ability to connect to port 6969 
on external hosts. 6969 is used by the BitTorrent protocol to establish 
the connection to the other peers (it's the "tracker" server).

I have experimented by using telnet to see what I could and could not 
connect to, and from where. Here's the scoop: I can connect to port 80 
on any host out there from any host, including the router and my 
PowerBook. I can connect to port 6969 from the router, but NOT from the 
PowerBook (when I do, it times out):

> Aero:~ rmann$ telnet oasis.bscn.com 80
> Trying 216.60.208.252...
> Connected to oasis.bscn.com.
> Escape character is '^]'.
>
> Connection closed by foreign host.
> Aero:~ rmann$ telnet oasis.bscn.com 6969
> Trying 216.60.208.252...
> telnet: connect to address 216.60.208.252: Operation timed out
> telnet: Unable to connect to remote host

So, I'm fairly certain that there's something in the iptables rules 
that's blocking this one port, but I sure can't find it. The only 
port-specific rules I can see (using iptables -L on all tables) are for 
mapping the inbound ports 6881-6999...hmm. I changed this to exclude 
6969, and I can connect now.

Any ideas why that would be the case?

TIA

-- 
Rick


