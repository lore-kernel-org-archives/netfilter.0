From: iptables-user <iptables@theorb.net>
Subject: Re: some addresses won't route
Date: Sun, 18 Sep 2005 15:08:25 -0700
Message-ID: <432DE559.6070409@theorb.net>
References: <432DBC78.8070504@theorb.net> <200509181605.16460.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509181605.16460.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

/dev/rob0 wrote:

Thanks for the detailed reply.  Your efforts are _very_ appreciated.

> On Sunday 18 September 2005 14:14, iptables-user wrote:
> 
>>I created what I thought was a simple 3 network router which worked
>>great for 4 or 5 days, but has gone bonkers.  Restarting it doesn't
>>make it work correctly, neither does rebooting.  I have a hunch that
>>something in a cache somewhere may have expired or one of the flags
>>in the /proc tree changed but I sure don't know what.
> 
> 
> The /proc tree is dynamic; it does not persist across reboots. If 
> something is changing it, it's being done by the OS startup scripts.
> 
> 
>>I'm using unpatched iptables-1.2.11 on fc4 with unmodified kernel.
> 
> 
> Very close to 100% chance that it will work when set up properly. A 
> common error is to omit something important from a custom kernel, but 
> distro kernels tend not to have those problems.
> 
> 
>>Box is setup as a router with a WAN, DMZ, and LAN.  WAN traffic
>>DNAT'd to DMZ works. DMZ and LAN through WAN works. The problems show
>>up in LAN to DMZ traffic.
> 
> 
> Incomplete description. Does the LAN and the DMZ have different 
> netblocks? What IP addresses are being accessed by LAN clients? Are you 
> doing the DNAT for those?
> 
> 
>> From LAN to/through DMZ ping (icmp), dns (udp and tcp), and ssh work
>>fine. pop3 and smtp work, but only after a looong wait, much longer
>>than a dns timeout. http works on one DMZ'd server, but on another
>>webserver with 2 IPs will only connect to one of the IPs (the one
>>that the webserver is NOT listening to, but works correctly for WAN
>>traffic).
> 
> 
> /me reaches for the aspirin bottle
> 
> 
>>Sniffing with tcpdump on DMZ for pop3 or smtp traffic shows
>>syn/ack/ack followed by a minutes long wait.  Sniffing for http on
>>DMZ shows correct traffic for D.M.Z.12, but for D.M.Z.11 never shows
>>up on the DMZ interface (11 and 12 are on the same dev).  Switching
>>the order the addresses are added to the interface has no effect.
>>
>>All nics on all machines are brought up with "ifconfig ethX up" and
>>addresses are attached using "ip addr add a.b.c.d/nm dev ethX". 
>>Default routes are created, and on the router
>>/proc/sys/net/ipv4/ip_forward is set to "1".
>>
>>On all machines ifconfig, ip addr show, and route display expected
>>results.
>>
>>The puzzler is that it worked so well for 4 or 5 days.
> 
> 
> More of it is puzzling to me. I think we missed part of the story.
> 
> 
>>Here is the iptables rule set which gets loaded using
>>iptables-restore.
>>
>>##########  VERY BASIC 3-LEGGED FIREWALL/ROUTER  ###########
>>#
>># [eth0] LAN is L.A.N.1   /24 (private)
>># [eth1] WAN is W.A.N.1-5 /29 (dsl to internet)
> 
> 
> Your iptables box is listening on all of these WAN IP's? Is it a /28?
> 
/29

> 
>># [eth2] DMZ is D.M.Z.1   /24 (servers)
> 
> 
> Are these another RFC 1918 netblock? If so why are you obscuring the 
> IP's?
> 
Intent was not to obfuscate.  It was easier for me to keep track of what 
was coming/going to/from where.

> 
>>*nat
>># remember: only NEW connections go through PREROUTING
>>
>>:PREROUTING ACCEPT [0:0]
>>:POSTROUTING ACCEPT [0:0]
>>:OUTPUT ACCEPT [0:0]
>>:GO_1 - [0:0]
>>:GO_2 - [0:0]
>>:GO_3 - [0:0]
>>:GO_4 - [0:0]
>>:GO_5 - [0:0]
>>
>># filtering belongs in filter table...
> 
> 
> Amen, brother, preach on!
> 
> 
>>-A PREROUTING -p icmp -j RETURN
> 
> 
> What does a RETURN do from a builtin chain? I don't understand what 
> you're trying to do with that rule. If it works like ACCEPT, in the nat 
> table that just means no NAT will be done.
> 
Correct.  If it's ICMP I want to skip the NAT rules.
> 
>># divvy ip's into chains; it's faster
>>-A PREROUTING -d W.A.N.1 -j GO_1
>>-A PREROUTING -d W.A.N.2 -j GO_2
>>-A PREROUTING -d W.A.N.3 -j GO_3
>>-A PREROUTING -d W.A.N.4 -j GO_4
>>-A PREROUTING -d W.A.N.5 -j GO_5
> 
> 
> So each WAN IP has its own chain in nat PREROUTING. Not sure why.
> 
To keep the chains short

> 
>># round-robin source ip's make visual log inspection easier for me
> 
> 
> But I don't see any logging anyway, are we missing something here?
Wrong choice of words.  Not logging, footprints for my benefit.

> 
> 
>>-A POSTROUTING -o WAN -j SNAT --to-source W.A.N.1-W.A.N.5
> 
> 
> And I don't understand the benefit in this. I'd use a single IP for the 
> SNAT'ed LAN clients and save the others for other uses.
> 
At some point I'd like to do IP based traffic shaping.  The different 
IPs are easier to spot in the tcpdump output.  Alot of what looks 
obscure is me trying to understand the different aspects of networking.

> 
>># DNAT maps
>>#  eg: -I GO_3 -p tcp --dport 80 -j DNAT --to-destination D.M.Z.100
>>#    would map http://W.A.N.3 to http://D.M.Z.100
> 
> 
> Okay, so it's a DNAT-style DMZ using RFC 1918 addresses for the DMZ? I 
> wouldn't do this. I'd use the "real" IP's in the DMZ. Use rules in 
> filter FORWARD to control access from the outside. Less need for 
> aspirin, and more likely to make it Just Work As Intended.
> 
> You have omitted the actual DNAT mapping rules? This is confusing. 
> Please don't obfuscate your issue beyond the ability to troubleshoot 
> it, if you want help with it.
> 
> 
>>-A GO_1 -j DROP
>>-A GO_2 -j DROP
>>-A GO_3 -j DROP
>>-A GO_4 -j DROP
>>-A GO_5 -j DROP
> 
> 
> But brother, practice what thou preacheth! You said you would not do 
> filtering in the nat table, and yet, you do! Why?
> 
Supposed to be RETURNs but haven't done the filter rules yet.

> You have left important parts out, but these DROP rules could be your 
> culprit.
> 
The nat part works well.  Didn't feel need to include all the mappings.

> 
>>COMMIT
>>#
>>*filter
>>
>>:INPUT   DROP [0:0]
>>:FORWARD DROP [0:0]
>>:OUTPUT ACCEPT [0:0]
>>
>># ok, so i'm an idiot. i like to talk to myself
>>-A INPUT -i lo -j ACCEPT
>># wan is shy
>>-A INPUT -i WAN -p icmp -j DROP
> 
> 
> Not a good idea to put this rule here. Some ICMP you will want to get, 
> even if you block certain types.
> 
Agreed.  Stopgap measure.  Want the basics to work before fleshing 
everything else out.

> 
>># but the rest of us aren't :)
>>-A INPUT -p icmp -j ACCEPT
>># allow router administration from lan
>>-A INPUT -s L.A.N.0/255.255.255.0 -d L.A.N.1 -p tcp -m tcp --dport 22
>>-j ACCEPT
> 
> 
> No --state RELATED,ESTABLISHED -j ACCEPT rule here? I use a "State" 
> chain with this rule, and jump to it from both INPUT and FORWARD, at 
> (or very near) the top of both chains. This would allow you to get the 
> ICMP replies as alluded above.
> 
I don't understand.  How would I get a NEW ssh connection then?

> 
>># let it route...
>>-A FORWARD -o DMZ -j ACCEPT
>># let it route...
>>-A FORWARD -o WAN -j ACCEPT
>># lan offers no services
>>-A FORWARD -o LAN -m state --state RELATED,ESTABLISHED -j ACCEPT
>>COMMIT
> 
> 
> I think if you trace what is happening to each connection you might 
> figure this out. But still, I'd recommend doing away with the DNAT DMZ 
> and using routed IP's instead.

Could you provide one example rule for routed IPs?  That might be enough 
to get me started.


FOLLOW-UP:
OK, I've found what may be causing my symptoms, but don't understand why 
it is happening.

CLIENT <---> LAN 192.168.0.1 <---> DMZ 10.0.0.1 <---> SERVERS

Sniffing with tcpdump at DMZ while telneting from CLIENT:

telnet 10.0.0.12 80 shows client.example.com.27642 > 10.0.0.12.http (OK)
telnet 10.0.0.11 80 shows dmz.example.com.57298 > 10.0.0.11.http (WRONG)

IOW, when telneting to 10.0.0.11.http the router gets the source address 
  wrong, but when telneting to 10.0.0.12.http the source address is correct.

What could cause that to happen?

Thanks again,
San Jose Mike

