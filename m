From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip address routing setup
Date: Wed, 5 Jun 2002 00:58:12 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206042358.g54NwDA15452@Networker.rockstone.co.uk>
References: <002401c20c22$2a06b820$1e00a8c0@neox>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002401c20c22$2a06b820$1e00a8c0@neox>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Wednesday 05 June 2002 12:47 am, Jack Baker wrote:

> Hi there..
>
> I just got a new set of ip addresses that are global. The isp has
> provided us with an initial set of ip addresses of these we had to
> select one to route the new set of ip addresses. Each set are from
> different subnets (thus the routing is required) From what I can tell,
> we act as the router for the new set of ip addresses, using the selected
> ip addresses which connects to their router. I'm just not sure what to
> do on the linux box to get the ip's routing from one router to
> another...
>
> I hope I'm making more sense.

Okay, I think what you're saying is you have had a bunch of IP addresses for 
some time, and your ISP has now given you a new (completely unrelated) set of 
addresses, and they're routing those to you through one of your existing 
addresses.

In which case, all you need to do is put a router (Linux box will do just 
fine :-) on that single old address, and tell it what to do with the new 
bunch of addresses.

For example (going back to your original set of fake addresses...)

You need to set up a machine listening on 192.168.0.7 which has a routing 
table which includes 192.168.1.64/29 (presumably you want these addresses to 
be on internal servers or something - why did you ask for them ?), and then 
you set up those machines with the new range of addresses on the internal 
side of that router machine (hopefully with some nice iptables rules to keep 
control of what gets routed....)

You say you already have a gateway machine on 192.168.0.5 - the simplest 
solution might be to put another network card in that machine, to connect the 
new publicly-addressed systems to, and then add the address 192.168.0.7 to 
the current external interface of the gateway so it responds to arps 
correctly.   Either:

ifconfig eth0:1 192.168.0.7 netmask 255.255.255.248 broadcast 192.168.0.8

or if you have the new iproute2 suite:

ip addr add 192.168.0.7/29 dev eth0

Does this answer your question ?

Antony.

