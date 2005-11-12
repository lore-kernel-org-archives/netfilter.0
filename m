From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: dhcp windows client port (nfcan: addressed to exclusive sender
	for this address)
Date: Sat, 12 Nov 2005 14:36:49 -0500
Message-ID: <20051112193649.GA28723@salty>
References: <BAY102-F11CCDDEA703406CE17D6F8AE580@phx.gbl>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY102-F11CCDDEA703406CE17D6F8AE580@phx.gbl> (from
	+nfcan+jimlaur+957286d880.props666999#hotmail.com@spamgourmet.com
	on Sat, Nov 12, 2005 at 13:45:55 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.11.12 13:45, P theodorou - props666999@hotmail.com wrote:
> Thanks Rob for you detailed reply.
> 
> My intention is to secure this side  of network as much as possible
> I'm not a guru but common sense says that  if i block everything apart from  
> the
> web access then this is   well restricted policy  OR IT IS NOT ?

First, it may be overly restrictive.
For instance, some people find ftp useful,
some people send and receive email,
and some use network time protocol.

Second, some clients you may not approve of
will contact outside servers on port 80
when their preferred ports are blocked.
I believe that skype, for instance, does this.

The firewall rules below work at the level of
internet protocols, such as 'tcp',
and, for tcp, the ports that tcp uses.
These rules do not distinguish what flows
through a tcp connection on port 80;
they do not distinguish 'http' from other traffic.
And even the http protocol can be used as a
wrapper for many other things - it does not
have to originate from a web browser, for instance.
So, you should not feel overly secure just because
of the limits on which ports are allowed.

Jim

> 
> regards
> 
>> From: "Rob Sterenborg" <rob@sterenborg.info>
>> To: <netfilter@lists.netfilter.org>
>> Subject: RE: dhcp windows client port Date: Sat, 12 Nov 2005 18:08:14 +0100
>> 
>> > i wish  the windows machine which receives Internet from the
>> > firewall pc to be restricted fully apart from the port needed to
>> > access the internet
>> >
>> > the windows machine has got fully access when my rc.firewall
>> > contains
>> >
>> > $iptables -A FORWARD -i $LAN_IFACE -j ACCEPT
>> >
>> > which gives to the windows machine access to every port
>> >
>> > i've tried unsuccesully the following command
>> >
>> > $iptables -A FORWARD -p TCP -i $LAN_IFACE -- sport XX -j ACCEPT
>> >
>> > my netstat on the windows machine displays various connections
>> > few questions now
>> >
>> >
>> > 1 which port should be alolwed for the windows machine to see internet
>> > 2 can i restrct it to  something like :
>> > $iptables -A FORWARD  -p TCP -i $LAN_IFACE  -sport XX -dport XX -j
>> > ACCEPT
>> >
>> > in other words, allow  the windows relevant port for accesing on the
>> > internet  to be connected to the specific port of the firewall
>> 
>> You will not connect to any port on the firewall. The firewall will
>> route your packets through to the internet.
>> 
>> To access websites you need DNS (port 53/udp, sometimes tcp) to be able
>> to resolve the hostname of the website. Further, most websites use http
>> and/or https, ports 80/tcp and 443/tcp.
>> So, your ruleset would look like :
>> 
>> $ipt -P FORWARD DROP
>> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>> $ipt -A FORWARD -i $IF_LAN -o $IF_INET -m state --state NEW \
>>   -p udp --dport 53 -j ACCEPT
>> $ipt -A FORWARD -i $IF_LAN -o $IF_INET -m state --state NEW \
>>   -p tcp --dport 53 -j ACCEPT
>> $ipt -A FORWARD -i $IF_LAN -o $IF_INET -m state --state NEW \
>>   -p tcp --dport 80 -j ACCEPT
>> $ipt -A FORWARD -i $IF_LAN -o $IF_INET -m state --state NEW \
>>   -p tcp --dport 443 -j ACCEPT
>> 
>> But, this way you will not be able to browse a website that is not
>> hosted on a standard port (eg 81/tcp).
>> For more information about Netfilter, check out
>> http://iptables-tutorial.frozentux.net/iptables-tutorial.html.
>>

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

