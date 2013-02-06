From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: How to use TPROXY with 2 lan interfaces and one wan
Date: Wed, 06 Feb 2013 14:48:27 +0200
Message-ID: <5112511B.9020007@ngtech.co.il>
References: <bc1efe8ab3ae9b4a050915eeb4d8454e@bsod.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bc1efe8ab3ae9b4a050915eeb4d8454e@bsod.eu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Francesco <francesco@bsod.eu>
Cc: netfilter@vger.kernel.org

On 02/06/2013 12:54 PM, Francesco wrote:
> I'm configuring a router with squid with tproxy feature.
>
> This router has 4 nic (well, really are 4 vlans)
> one for internet
> one for management
> other two are used for the internal clients to surf internet.
>
> This two interfaces are two different subnet, 192.168.100.0/24 
> (vlan100) and 192.168.200.0/24 (vlan200).
>
> My goal is to allow both the interfaces to go trought squid via tproxy.
>
> This is the scenario:
>
>
>                         ############
>     eth1.100    <-------#  ROUTER  #  eth0 wan
>                         #    +     #-------------> internet
>     eth1.200    <-------#  TPROXY  #
>                         # + SQUID  #
>                         ############
>                               |
>                               |
>                        MNG Interface (eth2)
>
>
> Afaiu, i need to mark traffic on both interfaces in this way (i'm 
> quoting just one, vlan100):
>
> iptables -t mangle -N DIVERT100
> iptables -t mangle -A DIVERT100 -i eth1.100 -m conntrack --ctstate NEW 
> -j MARK --set-mark 1
> iptables -t mangle -A DIVERT100 -j CONNMARK --save-mark
>
> iptables -t mangle -A PREROUTING -i eth1.100 -p tcp -m socket -j 
> DIVERT100
> iptables -t mangle -A PREROUTING -i eth1.100 -m conntrack --ctstate 
> ESTABLISHED,RELATED -j CONNMARK --restore-mark
> iptables -t mangle -A PREROUTING -i eth1.100 -p tcp --dport 80 -j 
> TPROXY --tproxy-mark 1 --on-port 8080
>
I'm not sure you understood how it works.

Take a look at:
http://wiki.squid-cache.org/ConfigExamples/UbuntuTproxy4Wccp2#Linux_and_Squid_Configuration

the divert is a match for a local socket connection which is not related 
to marks and should not be marked in the same way as intercepted connection.
For what have you used CONNTRACK and save mark?

>
> Now, i need to setup the rules:
>
> ip rule add fwmark 1 lookup 100
>
> then, i set the routing for table 100:
>
> ip route add local 0.0.0.0/0 dev lo table 100
>
> All this hould mean:
>
> packet comes in the router are matched against PREROUTING (the first 
> table).
>
> Packets jump to DIVERT100 chain, where packet is marked in case this 
> is a new connection, then save the mark

>
> Now, packets return to PREROUTING chain, and restore mark if is not a 
> new connection, then mark 1 is managed with tproxy target.
ha? i must tell you to write it again and maybe on paper just to 
illustrate for yourself what you have just written.
if the connection was already been intercepted in the what so called 
"socket" level into the proxy and the client end point the proxy why do 
we need to mark it again?

Lets imagine what you have just written:
#In order the to start a car turn the switch on
- if you are entering the car switch on the car.
- if you are switching the car on then continue to step one...

Does it make sense to me? no.
(take the example as illustration only and might not fit as BIT to BIT 
match)

I hope the example helps you.

Eliezer
> After prerouting, packets are routed according with routing table, where:
>
> if packets has mark 1, table 100 should be contacted
>
> in table 100 i have that everything (0.0.0.0/0) should go via lo.
>
> In loopback there is squid with tproxy that carry on the request and 
> goes to internet.
>
>
> Someone could clarify what is wrong here? Especially the CONNMARK, 
> that i've not very clear how to implement in this scenario.
>
> Thanks in advance.
>
>

