From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Performace problems with NAT
Date: Fri, 25 Oct 2002 17:59:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021025170004.BDIX27595.mta05-svc.ntlworld.com@there>
References: <1035554190.24028.19.camel@ITS-Sevcik> <200210251446.g9PEkUe06183@vulcan.rissington.net> <1035560291.24039.38.camel@ITS-Sevcik>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035560291.24039.38.camel@ITS-Sevcik>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Friday 25 October 2002 4:38 pm, Berndt Sevcik wrote:

> Thanks for the answer!
>
> We use two Internet Connections. So we need to splitt our Source
> addresses over these. All our official addresses are sent via the slower
> one and all private addresses and proxies are transmitted via the fast
> line (neede NAT).
>
> Another interessting fact ist that ping times are exptremely good. We
> have about 2ms between each Hop in the Chello Nertwork, better than
> ever.
>
> We need source based routing, because we have to default gateways, one
> for each internet connection.

Okay, I understand.

> Here our full configuration:
>
> route add -net ..... (local nets)
> route add default gw 193.170.9.1 (first ISP)
>
> ip rule add from 10.0.0.0/8 table chello1
> ip route add feault via 192.168.158.101 table chello1 (second ISP)
> ip rule add from 193.170.8.133 table chello1
> ip rule add from 193.170.8.134 table chello1
> ip route flush cash

Ah.   A little more than you posted last time :-)   However I still don't see 
a reason for only 20% usage of a 10Mbit connection.

How do you know the problem is not with your ISP ?   Can you download
at 10Mbit under any circumstances ?

What makes you think is it NAT which is causing the performance
problem ? Does the problem go away if you do not use NAT ?

How busy is your box (what load average does uptime show) ?

Are you getting any kernellogging messages about conntrack table full
etc ?

What speed CPU / how much memory is in the netfilter machine ?

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them

