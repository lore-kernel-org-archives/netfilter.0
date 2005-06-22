From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: Script verification
Date: Wed, 22 Jun 2005 12:40:17 +0200
Message-ID: <004d01c57716$cbfda230$4206a8c0@loki>
References: <20050622041115.96034.qmail@web30615.mail.mud.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi everybody,

On Wednesday, June 22, 2005 6:11 AM,
Mohamed Nassih wrote:

> [...]
> echo 1 > /proc/sys/net /ipv4/ip_forward

You still have the space in that line, which Guido already noticed. It 
should be
echo 1 > /proc/sys/net/ipv4/ip_forward
without the space between .../net and /ipv4...

> IPTABLES -F INPUT
> IPTABLES -F OUTPUT
> IPTABLES -F FORWARD
> IPTABLES -P INPUT DROP
> IPTABLES -P OUTPUT DROP
> IPTABLES -P FORWARD DROP
> Iptables -A INPUT  -i lo -j ACCEPT
> Iptables -A OUTPUT  -o lo -j ACCEPT

These rules seem to be good.

> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE

This rewrites the source address of every packet originating from 
192.168.1.0/24 going out through eth0 to the public IP of your router 
(assuming eth0 is the interface connected to the internet side of your 
network) --> OK

> iptables -A FORWARD -i eth1 -o eth0 -p tcp -d 123.45.67.2
> --destination-port 80
> -m state --state NEW,ESTABLISHED  -j ACCEPT

This allows traffic (including new connections) coming from eth1 and going 
out through eth0 to pass, if it is destined for 123.45.67.2:80. With the 
assumption that eth1 is connected to the LAN side of your network --> OK

> iptables -A FORWARD -p tcp -i eth0 -o eth0 --source-port 80 -m state
> --state ESTABLISHED -j ACCEPT

With above assumptions regarding your eth0 and eth1 this should be
iptables -A FORWARD -p tcp -i eth0 -o eth1 --source-port 80 -m state --state 
ESTABLISHED -j ACCEPT
Then it allows all returning packets from the internet originating from port 
80 to pass.

It should work then, but I think it should work equally well if you took 
Guido's rules (in 
http://lists.netfilter.org/pipermail/netfilter/2005-June/061098.html), since 
as he already said, that notation is more readable, and IMHO, also cleaner.

So with above changes the script should be sufficient to allow your LAN 
clients access to that single webserver 123.45.67.2. But depending on your 
configuration your clients might be unable to do DNS, so it might be 
necessary to type the IP address into the browser.

Good luck,

Marius 


