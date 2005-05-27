From: Jason Opperisano <opie@817west.com>
Subject: Re: static 1:1 nat did not work
Date: Fri, 27 May 2005 16:23:11 -0400
Message-ID: <20050527202311.GA25095@bender.817west.com>
References: <OFBCF8CF54.D20A4809-ONC125700E.003D446D-C125700E.003E3BCB@team4.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OFBCF8CF54.D20A4809-ONC125700E.003D446D-C125700E.003E3BCB@team4.de>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 27, 2005 at 01:19:45PM +0200, Guenter.Sprakties@team4.de wrote:
> Hello,
> 
> I didn't get some simple 1:1 static natting (no masq!) to work.
> 
> Scenario is like this: Wintel computer with actual sarge 2.6.8-2 and 
> iptables,
> 
> three network interfaces
> net one: 172.31.24.0/21 eth0
> net two: 192.168.2.0/24 eth1
> net three:212.120.70.32/27 eth2 (def gateway)
> 
> net one is the internal, net two the dmz. net three the internet.
> 
> We like to do some double natting of our dmz machines:
> 
> The (internal) IP of one dmz computer may be 192.168.2.20
> The natted IP from the intranet should be 172.31.27.20
> The natted IP from the internet should be 212.118.72.20
> 
> Simple 1:1 static natting, but route dependend. Easily done by iproute2.
> No more longer possible because the kernel was changed and nat by ip 
> route/rule isn't possible anymore.
> 
> We got several manuals like NAT HOWTO or iptables from LeRoy D. Cressy or 
> double nat HOWTO.
> Most of them deal with port forwarding or masquerading. Nice, but this did 
> not help. 
>  
> In our test environment, this example for nat from internal didn't work 
> out:
> 
> | # NAT
> | #
> | iptables -t nat -A POSTROUTING -s 192.168.2.20 -d 172.31.24.0/21 -j SNAT 
> --to 172.31.27.20
> | iptables -t nat -A PREROUTING -s 172.31.24.0/21 -d 172.31.27.20 -j DNAT 
> --to 192.168.2.20
> 
> ICMP is allowed (ACCEPT) for alle the INPUT, OUTPUT and FORWARD chains. 
> Without using the rules, a ping between the network chains internal - dmz 
> is possible and can bee seen (all ICMP packet are logged) by tail -F 
> /var/log/messages, pinging the dmz computer by the use of the natted IP 
> 172.31.27.20 give no seen packet in the messages file.

how does a machine on 172.31.24.0/21 get a MAC address for 172.31.27.20?
have you created published arp entries on eth0 of the netfilter machine?
or are you using ip aliases on eth0 for each 172.31 address that should
be NAT-ed to a DMZ IP?  if you're not doing either--your problem is one
of arp, not routing or NAT.  start at layer 1 and work your way up,
taking all things into account along the way.

-j

ps - i know you don't care, but this kind of network setup makes me
     physically ill.  i literally just vomited a little bit.

--
"Peter: So what happened to the guy that stole the money?
 Joe Swanson: Ironically, I severed his spine when I fell on him.
 Peter: Sounds like you got some more competition at next year's
 Special People's Games. HehHehHehHehHeh.
 Joe Swanson: Nope, he's dead."
        --Family Guy

