From: methodaut@netscape.net (Thomas Meindl)
Subject: Re: iptables, portforward, DNAT, SNAT
Date: Thu, 31 Oct 2002 14:23:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <542FEF78.196CA339.03240133@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

>On Thursday 31 October 2002 3:33 pm, Thomas Meindl wrote:
>
>> #!/bin/bash
>>
>> EXTIF=eth0
>> INTIF=eth1
>> EXTIP=www.xxx.yyy.zzz
>> INTIP=192.168.0.1
>> WWWSRV=192.168.0.2
>>
>> #here I'll make some
>> echo 1 > /proc/sys/net/ipv4/*
>
>Does that line really say "echo 1 to every file in the /proc/sys/net/ipv4 
>directory" !?
>
>Why ???

no, i didn't write it that way in the actual script.
just to save some tipping here..

* stands for the three below

sorry for that confusing
I simply should have copied and pasted it like

echo 1 > /proc/sys/net/ipv4/ip_dynaddr
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/tcp_syncookie


>
>> #to some features like ip_dynaddr, ip_forward, tcp_syncookie
>>
>> #then I set the default policies
>> #accept everything except the FORWARD chain
>> #and flush them
>> iptables -P INPUT -j ACCEPT
>
>I don't like that - you should have a default DROP on INPUT and then create 
>rules to ACCEPT what you know you want.   Otherwise you're accepting anything 
>anyone cares to send you....
>

I know. I have a more extended script, but to be sure that portforwarding works pretty soon, i'll keep that one simple

>> iptables -F INPUT
>> iptables -P OUTPUT -j ACCEPT
>> iptables -F OUTPUT
>> iptables -P FORWARD -j DROP
>> iptables -F FORWARD
>> iptables -t nat -f        #flush the nat table
>>
>> # and here's my little disaster
>> # i try to forward port 1234 to my internal www-server
>> iptables -t nat -A PREROUTING -p tcp -i $EXTIF -d $EXTIP --dport 1234 -j
>> DNAT --to-destination $WWWSRV:80
>
>Okay - that will redirect the incoming packets on TCP port 1234 to your 
>internal web server, port 80
>
>> iptables -A FORWARD -p tcp -i $EXTIF -o $INTIF -d $WWWSRV --dport 80 -j 
>ACCEPT
>
>That rule will forward the packets through your firewall to the web server 
>(do you have a rule somewhere to allow the replies back again ?)
>
>> iptables -t nat -A POSTROUTING -p tcp -o $EXTIF -s $WWWSRV --sport 80 -j 
>SNAT --to-source $EXTIP:1234
>
>I don't understand this rule - replies from the webserver are going to get 
>automagically reverse NATted anyway, so this rule is redundant...
>
>> # for what i understand from iptables till now is
>> # packet comes in thru ethernet, arrives in kernel
>> # so packet looks like this
>> # ip-layer: source-ip: WWWREQUEST  destination-ip: $EXTIP
>> # tcp-layer: source-port: a port higher than 1024   destination-port: 1234
>> # and hits the PREROUTING chain
>
>Looks good so far.
>
>> # with the DNAT rule above it changes following
>> # ip-layer: source-ip: WWWREQUEST   destination-ip: $WWSRV
>> # tcp-layer: source-port: a port higher than 1024   destination-port: 80
>
>Yup.
>
>> # then hits FORWARD chain (usually it would hit the INPUT chain,
>> # but we changed that with DNAT; it has to go out on $INTIF to reach
>> # its destination..)
>
>Correct.
>
>> # with the FORWARD rule it can bypass..
>
>Sorry - what do you mean ?
>
>> # when applying DNAT all other packets in that stream are bypassed as well
>
>All other packets in that stream are translated (both ways), yes.
>
>> # with this two rules it is sure that a request from a www-client from
>> # the inet is reaching the inner $WWWSRV, and the $WWWSRV can respond but
>> # there is still something wrong with the reply packet:
>> # ip-layer: source-ip: $WWWSRV destination-ip: WWWREQUEST
>> # tcp-layer: source-port: 80   destination-port: 1024:
>
>That's how it goes out from the web server, yes, but that doesn't show the 
>reverse NAT which will have been applied by netfilter by the time it gets 
>back to the client.   Borrowing your terminology, that would look like:
>
>> # ip-layer: source-ip: $EXTIP destination-ip: WWWREQUEST
>> # tcp-layer: source-port: 1234   destination-port: 1024:
>
>> # when the packet arrives at the WWWREQUEST-host-browser it doesn't know
>> # what to do with the packet (there was no request to this host $WWWSRV)
>> # so here comes rule 3; it changes the source ip and port to this
>> # ip-layer: source-ip: $EXTIP destination-ip: WWWREQUEST
>> # tcp-layer: source-port: 1234   destination-port: 1024:
>> # now the packet seems like the awaited reply from the request
>> # he has given to $EXTIP:1234
>
>I think you do not realise that netfilter automagically applies the reverse 
>NAT rules to reply packets, so you do not have to create your own rules to do 
>this.
>
>> # and another few rules to complete the firewall script
>>
>> # allow all connections from inside out and only related
>> # and established ones in
>> iptables -A FORWARD -p tcp -i $EXTIF -o $INTIF -m state --state
>> ESTABLISHED,RELATED -j ACCEPT
>> iptables -A FORWARD -p tcp -o $EXTIF -i $INTIF -j ACCEPT
>
>Okay, these two rules (specifically the last one) will allow your replies 
>back out from the web server to the client.
>
>> # enable masquerading
>> iptables -t NAT -A POSTROUTING -o $EXTIF -j MASQUERADE
>
>"NAT" in this rule should read "nat" - it matters !
>

spelling mistake sorry! nat

>> I hope anyone out there can help me..
>> I tried serveral permutations with the three portforwarding rules:
>
>I think if you remove the third one it will work.

I just tried it without the third (i have tried it that way before)
but it still won't work !!!


>
>> I changed some params or even let them away
>> One Variation was to ACCEPT the full FORWARD chain
>
>Ugh !!!

i know, i know; but one gets really bad ideas when sth doesn't work

> 
>
>Antony.
>
>-- 
>
>It is also possible that putting the birds in a laboratory setting
>inadvertently renders them relatively incompetent.
>
> - Daniel C Dennett
>
>


__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://channels.netscape.com/ns/browsers/download.jsp 

Get your own FREE, personal Netscape Mail account today at http://webmail.netscape.com/

