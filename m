From: Ian Moyce <ian@ianmoyce.co.uk>
Subject: Re: Combining rules
Date: Thu, 07 Jun 2007 18:36:54 +0100
Message-ID: <46684236.2020606@ianmoyce.co.uk>
References: <2B31733C-BA34-44B8-AB44-FBBFA81BE9B0@ianmoyce.co.uk>
	<466830E2.3000204@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <466830E2.3000204@riverviewtech.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: gtaylor+reply@riverviewtech.net
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

Grant Taylor wrote:
> On 06/07/07 04:18, Ian Moyce wrote:
>> I am trying to combine a load of ip rules, but I am having problems=20
>> fathoming it out.
>>
>> I run a VPS with openVPN. I have the following rules:
>>
>> iptables -t nat -A POSTROUTING -s 192.168.2.3 -j SNAT --to=20
>> 85.234.144.236
>> iptables -t nat -A POSTROUTING -s 192.168.2.4 -j SNAT --to=20
>> 85.234.144.236
>> iptables -t nat -A POSTROUTING -s 192.168.2.5 -j SNAT --to=20
>> 85.234.144.236
>> iptables -t nat -A POSTROUTING -s 192.168.2.6 -j SNAT --to=20
>> 85.234.144.236
>> iptables -t nat -A POSTROUTING -s 192.168.2.7 -j SNAT --to=20
>> 85.234.144.236
>> iptables -t nat -A POSTROUTING -s 192.168.2.8 -j SNAT --to=20
>> 85.234.144.236
>> iptables -t nat -A POSTROUTING -s 192.168.2.9 -j SNAT --to=20
>> 85.234.144.236
>> iptables -t nat -A POSTROUTING -s 192.168.2.10 -j SNAT --to=20
>> 85.234.144.236
>
> I'm not sure why you would be wanting to SNAT 8 systems to the same=20
> IP, but hey, it's your script.  The rules them selves look good enough.

I was just following instructions! Jan gave me a shorter list of=20
commands which I hope to try
>
>> Which works great. However, I am wanting to pass any IP traffic from=20
>> the 192.168.2.x range to be passed through a socks proxy on a=20
>> specific port, which I have been told can work with:
>
> (Comments in line below)
>
>> #!/bin/sh
>>
>> LOCAL_NET=3D192.168.2.0/24
>> /sbin/iptables -F
>> /sbin/iptables -t nat -F
>> /sbin/iptables -P INPUT ACCEPT
>> /sbin/iptables -P FORWARD DROP
>> /sbin/iptables -P OUTPUT DROP
>
> A default of DROP in the OUTPUT can catch you on a LOT of things.
>
>> /sbin/iptables -t nat -P OUTPUT ACCEPT
>> /sbin/iptables -t nat -A OUTPUT -p udp --dport 53 -j DNAT=20
>> --to-destination 127.0.0.1:5353
>> /sbin/iptables -t nat -A OUTPUT -o lo -j RETURN
>> /sbin/iptables -t nat -A OUTPUT -d 127.0.0.1 -j RETURN
>> /sbin/iptables -t nat -A OUTPUT -d $LOCAL_NET -j RETURN
>> /sbin/iptables -t nat -A OUTPUT -m owner --uid-owner 103 -j RETURN
>> /sbin/iptables -t nat -A OUTPUT -p tcp --syn -j DNAT --to-destination=20
>> 127.0.0.1:1211
>
> So you are wanting to block all outbound traffic except for the=20
> following conditions:
> - Loop back traffic
> - Local host network traffic
> - Local network traffic
> - Any thing sent by uid 103
>
> Is this really what you are wanting to do?
I think so...

The server itself runs exim, dovecot and apache2. I would like these=20
services to work, so if someone went to my domain name, or sent me an=20
email, that'd work.

I am wanting any of the VPN users who are on the local IP range -=20
192.168.2.x to have all their traffic go through Tor's SOCKS server.=20
Following the instructions at=20
http://wiki.noreply.org/noreply/TheOnionRouter/TransocksifyingTor, I am=20
using a magical program (all but black magic to me) to convert generic=20
TCP network traffic redirected by iptables into a socks compatible=20
request which it then passes to tor, so localhost/127.0.0.1 traffic=20
needs to be outside of these rules.
The second set of queries is something directly from the site. I hate to=20
admit it, but I am weak at iptables, which is why I am on my knees=20
asking for help.
> Loop back and local host network are really about the same unless you=20
> have other subnets bound to your loop back interface or for some=20
> strange reason the 127.0.0.0/8 subnet bound to something other than=20
> loop back.
*looks blank*
> It looks like you are using a local DNS (proxy?) server and=20
> redirecting any DNS queries to it.
Thats correct
>
> Then there is the main critter where you are redirecting any new TCP=20
> traffic to a service on the local host.  I'm not quite sure what will=20
> happen to the destination IP and port of the request traffic.  I'm=20
> afraid that they will be translated to be the local host and port you=20
> are DNATing to, not the original destination.  If the original=20
> destination is lost, how is your proxy going to work?  I guess I=20
> should as, are you trying to transparent proxy or are you really=20
> telling your client systems that they are using a proxy?
I am wanting it to work transparently. I guess I could survive if I=20
block all outbound traffic from the 192.168.2.x IP addresses from going=20
outside the server - so clients have no option but to use the socks=20
server. It sounds easier, but there is the IBKAC factor, and I want to=20
make it as easy as possible.
>> /sbin/iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> /sbin/iptables -A OUTPUT -o lo -j ACCEPT
>> /sbin/iptables -A OUTPUT -d 127.0.0.1 -j ACCEPT
>> /sbin/iptables -A OUTPUT -d $LOCAL_NET -j ACCEPT
>> /sbin/iptables -A OUTPUT -m owner --uid-owner 103 -j ACCEPT
>> /sbin/iptables -A OUTPUT -j LOG
>> /sbin/iptables -A OUTPUT -j REJECT=20
>
> Again, you are wanting to block all outbound traffic except for the=20
> following conditions:
> - Loop back traffic
> - Local host network traffic
> - Local network traffic
> - Any thing sent by uid 103
Not sure, sorry, I hope my previous responses cover this.. UID 103 is=20
the SOCKS server, so the traffic from this uid does not need to go=20
through itself. That would be a bit wrong..
>
> Any thing that is not allowed out is logged and rejected.
>
> The state rule is the normal short cut to by pass the rules for=20
> previously seen traffic.
>
> As an aside:  Why are you filtering in your nat table?  Filtering=20
> really is better done in the filter table.
Havent a clue. I was just doing what I was told!

>
>> If someone is able to help me figure this out, I am offering a reward=20
>> of =A350 (about $100) as it is driving me insane!!!
>
> I don't see any thing to out standing other than the fact, which may=20
> be my unfamiliarity with Socks, that any traffic not explicitly=20
> allowed TCP traffic is being redirected in to one port on the system. =20
> I'm not sure that this will work.  However like I have said, I do not=20
> use Socks so I am not familiar with it.  To me, when you are DNATing=20
> to the local port, you are going to loose your destination IP and=20
> port.  Thus, how will your service know where to send the traffic to=20
> unless there is some sort of indicator in what is coming in to the=20
> service.  If there is data coming in to the service telling it where=20
> to connect to, then you have obviously configured the clients to talk=20
> to the service.  If you have configured the client to talk to the=20
> service, why are you having to redirect the traffic?  Why did you not=20
> configure the client to talk directly to the correct port of the service?
I am just wanting to make this as simple as possible for the end user-=20
they connect with OpenVPN, get a 192.168.2.x IP address, and all their=20
network traffic going out of the network goes through tor. I am leaning=20
towards blocking all but traffic to 192.168.2.x addresses, which forces=20
them to use SOCKS, however I am wanting to cover all the bases for=20
things like SSH and other TCP programs which dont have any obvious SOCKS=20
support without having to have some kind of wrapper.
>
> It almost sounds like you are wanting to do transparent proxy with=20
> Squid.  Squid is an entirely different prosy than Socks.  Socks (to my=20
> knowledge) is a system for a client to request that an intermediary=20
> (bastion) host make the connection on the client's behalf.  With=20
> Socks, the client passes information on where it wants to connect to=20
> the Socks proxy.
> Squid transparent proxy on the other hand is entirely different. =20
> Squid is primarily used to proxy HTTP / HTTPS requests on behalf of=20
> clients.  Part of the HTTP protocol is the information that you are=20
> trying to request.  I.e. you pass what host (name) and item that you=20
> want.  Squid can interpret these requests and make the appropriate=20
> connection on your behalf.  Or, you can do the standard thing and=20
> configure Squid as a standard proxy and just point the clients to it=20
> and it will behave more like a Socks proxy where the client tells=20
> Squid what it wants and Squid then goes and gets it.
>
> Incidentally, setting Squid up as a transparent proxy and redirecting=20
> any and all HTTP traffic in to it is not difficult and can be done in=20
> a very similar manner (as far as the redirects on the router).

Agreed. I though of this, but I was hoping to cover more than HTTP/S=20
traffic. However, I am seriously considering doing this in the=20
meantime... Are you able to point me in the right direction on what I=20
need to do to transparently handle all http/https traffic to go to=20
squid..? Sorry if I am being cheeky!
>
> Digest this and let me know if you have any more questions.
>
>
Thanks grant for your reply.. I am pretty new to netfilter, and I think=20
I may have bitten off more than I can chew..
>
> Grant. . . .
>


