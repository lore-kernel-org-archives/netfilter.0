From: Jakub Nadolny <jakub.nadolny@carrywater.pl>
Subject: Re: Problem with address forwarding
Date: Mon, 3 Dec 2007 15:44:39 +0100
Message-ID: <20071203144439.GQ4452@jnamobiled.ite.pl>
References: <20071203125238.GN4452@jnamobiled.ite.pl> <57523.217.166.60.19.1196689813.squirrel@ma.rtij.nl> <47540EC9.6080303@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47540EC9.6080303@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Dec 03, 2007 at 03:12:25PM +0100, Pascal Hambourg wrote:
>> <citaat van="Jakub Nadolny">
>>> I try to do simple address:port forwarding and I can not get it
>>> working. I want to have all traffic send to
>>> some.internet.address:some_port to be forwarded to 192.168.155.123:80.
>>>
>>> So I guess following rule should work fine:
>>> iptables -t nat -A PREROUTING -p tcp -d some.internet.address --dport 
>>> 1234
>>> -j DNAT --to 192.168.155.123:80
>>>
>>> But when afterthat I enter some.internet.address:1234 in firefox I can
>>> not see webpage which is located at 192.168.155.123. It tries to connect
>>> but there is no result.
>>>
>>> What could be the reason of that?
>> If you are doing this from the same network the webserver is on, this will
>> not work. The return traffic is going straight back to the client instead
>> of being 'Natted-back' by the firewall.
>
> That's when the DNAT is done on a router and the browser and the server are 
> on the same side of the router. The workaround is to SNAT the DNAT-ed 
> connection in the POSTROUTING chain as it is forwarded back to the LAN. 
> Take care to SNAT only connections from the local network, not those from 
> the internet because it hides the original source address.
>
> If you are not doing the port forwarding on a router but on the box the web 
> browser is running on, the DNAT must be done in the OUTPUT chain instead of 
> PREROUTING.

Unfortunatelly result is the same when I try to connect from outside of
local network. 

So my configuration is like that:

web server      |        | server with NAT  |       |
192.168.155.123 |--------| 192.168.155.122  |-------| Internet
                |        | some.internet.ip |       |

Whether I connect from my local network (192.168.155.*) or from outside
result is the same. 
In web browser I enter IP address - not domain name. 

# iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       tcp  --  0.0.0.0/0            some.internet.ip        tcp dpt:80 to:192.168.155.123:80 

To be sure I have temporarly turned off all other rules:

# iptables -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination     


Do you have some suggestions?
