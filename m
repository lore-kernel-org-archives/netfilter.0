From: Tasha Smith <tashamaillist@yahoo.com>
Subject: Re: Trying to setup EMULE and IIS on LAN machine, behind firewall.
Date: Wed, 18 Jun 2003 22:58:30 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030619055830.3439.qmail@web80504.mail.yahoo.com>
References: <OF7BE6399D.A8C699DB-ON80256D49.005627FB@start-global.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF7BE6399D.A8C699DB-ON80256D49.005627FB@start-global.com>
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
Content-Transfer-Encoding: 7bit
To: richardo@start-global.com, netfilter@lists.netfilter.org

Hiii,

I tryed getting EMULE working first by adding these rules to my iptables script, i
put ithese rules right above the FORWARD rules
 
$iptables -A INPUT -p tcp --dport 4662 -j ACCEPT
$iptables -A OUTPUT -p tcp --sport 4662 -j ACCEPT
$iptables -t nat -A PREROUTING -d $IP_INET -p tcp --dport 4662 -j DNAT --to
192.168.0.69:4662
$iptables -t nat -A POSTROUTING -s 192.168.0.69 -p tcp --sport 4662 -j SNAT --to
$IP_INET:4662

My windows machine is a PRIVATE address 192.168.0.69 and even when i take the test:
http://www.thedonkeynetwork.com/connection_test

And i have EMULE running on my Windows machine i get:
timeout : timeout on ip 199.99.99.99 (6 sec)
this means, that we even did not receive a
RESET signal; maybe due to a 'stealth' firewall

I tryed to TELNET to the linux(FRIEWALL/ROUTER) machine from am machine on a
different network but it WONT let me connect either. Is there something else i could
try???

Thanks
Tasha!  




--- richardo@start-global.com wrote:
> 
> Hi Girl ;-)
> 
> I don't really know much about eMule, but reading from the link you gave,
> it appears that you will need to allow connections initiated from the
> outside world to connect to your windows machine (which has a 192.168.x.x
> address, correct ?) .... the same would be true for an IIS server
> 
> There are two ways that you can acheive this, either by using port
> forwarding or by using a valid internet IP address (if you have a spare one
> available).
> 
> Port Forwarding
> This involves setting up a couple of rules in the INPUT and OUTPUT chains
> of the firewall, to allow people to connect to that machine on ports 80
> (for IIS) and port 4662 ?? (for eDonkey/eMule). The firewall machine will
> then forward on the request to the windows machine. This is ok, but there
> could be some problems, like if you want your IIS server to be reachable on
> port 80 (the normal port), but you are already running a webserver on the
> firewall that uses port 80 ... in this case you will need to use the 'valid
> ip address' option, or reconfigure one of the webservers to use a different
> port. The same would be true for the eMule thing .....
> 
> So, to do this, set up some rules, as follows :
> 
> WIN_IP=internal.ipaddress.of.windowsmachine
> 
> # for the IIS server
> $iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> $iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
> $iptables -t nat -A PREROUTING -d $IP_INET -p tcp --dport 80 -j DNAT --to
> $WIN_IP:80
> $iptables -t nat -A POSTROUTING -s $WIN_IP -p tcp --sport 80 -j SNAT --to
> $IP_INET:80
> 
> # for eMule
> $iptables -A INPUT -p tcp --dport 4662 -j ACCEPT
> $iptables -A OUTPUT -p tcp --sport 4662 -j ACCEPT
> $iptables -t nat -A PREROUTING -d $IP_INET -p tcp --dport 4662 -j DNAT --to
> $WIN_IP:4662
> $iptables -t nat -A POSTROUTING -s $WIN_IP -p tcp --sport 4662 -j SNAT --to
> $IP_INET:4662
> 
> ... I've not done any port forwarding myself before, so there could be a
> mistake in the rules above, but I think they should work ok .... if not
> mail me back and I'll confuse us both some more ;-) Once the rules have
> been set up, you would connect to the IIS server using the firewall's IP
> external ip address, as follows :
> 
> http://external.ipaddress.of.firewall
> 
> 
> Valid IP Address
> This involes setting up a full NAT implementation for the windows machine,
> and would be the prefered option, as port forwarding can be a little messy
> and also you could start other services on the windows machine and then
> just add rules into the FORWARD chain on the f/w to allow people to connect
> to the service ... if you have a spare external IP address, I would
> recommend this way of doing it.
> 
> So, to do this, set up some rules, as follows :
> 
> WIN_IP_LAN=internal.ipaddress.of.windowsmachine
> WIN_IP_INET=external.ipaddress.of.windowsmachine (<- this is the spare IP
> address you have been assigned by your ISP)
> 
> # for the IIS server
> $iptables -A FORWARD -d $WIN_IP_LAN -p tcp --dport 80 -j ACCEPT
> $iptables -A FORWARD -s $WIN_IP_LAN -p tcp --sport 80 -j ACCEPT
> $iptables -t nat -A PREROUTING -d $WIN_IP_INET -j DNAT --to $WIN_IP_LAN
> $iptables -t nat -A POSTROUTING -s $WIN_IP_LAN -j SNAT --to $WIN_IP_INET
> 
> #for the eMule ting ....
> $iptables -A FORWARD -d $WIN_IP_LAN -p tcp --dport 4662 -j ACCEPT
> $iptables -A FORWARD -s $WIN_IP_LAN -p tcp --sport 4662 -j ACCEPT
> $iptables -t nat -A PREROUTING -d $WIN_IP_INET -j DNAT --to $WIN_IP_LAN
> $iptables -t nat -A POSTROUTING -s $WIN_IP_LAN -j SNAT --to $WIN_IP_INET
> 
> .. you'll also need to setup an alias on the firewall's external network
> interface to listen for requests coming in for the WIN_IP_INET address, as
> follows :
> 
> ifconfig eth0:0 external.ipaddress.of.windowsmachine netmask
> external.mask.of.windowsmachine
> 
> ... if you then wanted to run another service on the windows machine (say
> telnet on port 23), you would only need to add rules to the FORWARD chain,
> as follows :
> 
> $iptables -A FORWARD -d $WIN_IP_INET -p tcp --dport 23 -j ACCEPT
> $iptables -A FORWARD -s $WIN_IP_LAN -p tcp --sport 23 -j ACCEPT
> 
> ... and you could then telnet to the machine from the internet ... ie the
> NAT setup hasn't changed, you've just allowed people to connect through on
> 23, to do this using port forwarding you would need to change not only the
> filter rules in the OUTPUT and INPUT chains, but also the PREROUTING and
> POSTROUTING nat rules ....
> 
> Once the rules have been set up, you would connect to the IIS server using
> the external IP address assigned to the windows machine, as follows :
> 
> http://external.ipaddress.of.windowsmachine
> 
> Hope this helps,
> Richard.
> 
> Richard Oatridge
> Head of IT, Start-global Ltd
> http://www.start-global.com
> tel :  +44 1564 779297
> email : richardo@start-global.com
> 
> 
> |--------+----------------------------------->
> |        |          Tasha Smith              |
> |        |          <tashamaillist@yahoo.com>|
> |        |          Sent by:                 |
> |        |          netfilter-admin@lists.net|
> |        |          filter.org               |
> |        |                                   |
> |        |                                   |
> |        |          18/06/2003 09:31         |
> |        |                                   |
> |--------+----------------------------------->
>  
>
>-------------------------------------------------------------------------------------------------------------------------|
>   |                                                                               
>                                          |
>   |       To:     netfilter@lists.netfilter.org                                   
>                                          |
>   |       cc:                                                                     
>                                          |
>   |       Subject:     Trying to setup EMULE and IIS on LAN machine, behind
> firewall.                                       |
>  
>
>-------------------------------------------------------------------------------------------------------------------------|
> 
> 
> 
> 
> Hi Boys
> 
> Hi im running RedHat 7.3 - 2.4.20 Iptables 1.2.7a on my FIREWALl/ROUTER
> machine.I am
> having some probles creating some rules for 2 programs im running on my
> WIndows 2000
> machine which is behind the FIREWALL/ROUTER machine (LAN). First im trying
> to get
> EMULE(P2P) working properly, those of you who are familiar with it...I keep
> getting
> a LOWID error even though i created a FORWARD rule. I can connect to the
> network but
> with a LOWID for those of you who do not know what that means here is a
> link to what
> it is.
> http://www.edonkey2000.com/documentation/lowid.html
> 
> I think i need a rule to FORWARD my connection straight to my windows 2000
> machine.
> Secondly i want to run IIS on my windows 2000 machine, What would be the
> rules soo
> my LINUX(FIREWALL/ROUTER) would FORWARD request to my WINDOWS machine on
> the LAN.
> WOuld these 2 rules for EMULE and IIS be similiar? Thanks for the help
> guys.
> 
> Here are my rules:
> 
> #Where my iptables are located
> iptables="/usr/local/sbin/iptables"
> 
> # This will also update my ipaddress.
> IP_INET=`/sbin/ifconfig eth0 | grep inet | cut -d: -f2 | cut -d\  -f1`
> 
> # Remove any existing rules from all chains.
> $iptables --flush
> $iptables -t nat --flush
> $iptables -t mangle --flush
> 
> # Unlimited access on the loopback interface.
> $iptables -A INPUT  -i lo -j ACCEPT
> $iptables -A OUTPUT -o lo -j ACCEPT
> 
> # Set the default policy to drop.
> $iptables --policy INPUT DROP
> $iptables --policy FORWARD DROP
> $iptables --policy OUTPUT ACCEPT
> 
> $iptables -t nat --policy PREROUTING ACCEPT
> $iptables -t nat --policy OUTPUT ACCEPT
> $iptables -t nat --policy POSTROUTING ACCEPT
> 
> $iptables -t mangle --policy PREROUTING ACCEPT
> $iptables -t mangle --policy OUTPUT ACCEPT
> 
> # All of the bits are cleared
> $iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
> $iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP
> # SYN and FIN are both set
> $iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> $iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> 
=== message truncated ===


__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

