From: Johan Ankarloo <johan.ankarloo@volvo.com>
Subject: Re: DNAT/SNAT and logging anyone?
Date: Tue, 20 Jan 2004 14:05:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074603900.7902.20.camel@ankarloo.got.volvo.net>
References: <E1AiuMS-0009Ke-AI@alf1.lmb.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1AiuMS-0009Ke-AI@alf1.lmb.internal>
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

The question then is if this is something that is missing in iptables or
that we just haven't found a way to do this kind of logging. Mayby i
should send this to the development list instead.

Is there anyone else who knows if this is possible to do?

Johan

On Tue, 2004-01-20 at 12:47, T. Horsnell (tsh) wrote:
> I'm in the same boat. In fact not only do I want to log that
> info when the NAT'ing takes place, I would also like to log
> when the connection is broken.
> 
> The only thing I can think of at the moment, is some process
> which continuously monitors /proc/net/ip_conntrack :(
> 
> Cheers,
> Terry.
> 
> 
> 
> 
> >Hi all. This is a repost. Thanks to Jeffrey for trying to help me.
> >
> >I need a way to log SNAT/DNAT packets. In the log i need all the
> >information about what have happend to the packet. Since the log target
> >is above the actually mangle line, the log target won't know how the
> >packet will be mangle. What i need in the log files are:
> >
> >Original Source 
> >Original SourcePort 
> >Original Destination 
> >Original DestinationPort
> >Translated Source 
> >Translated SourcePort 
> >Translated Destination 
> >Translated DestinationPort
> >
> >As an example, take a look at the documentaion about nat and look at the
> >examples below taken from
> >http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html
> >
> >---- SNIP ----
> >## Change destination addresses to 5.6.7.8, 5.6.7.9 or 5.6.7.10.
> ># iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 5.6.7.8-5.6.7.10
> >## Change source addresses to 1.2.3.4, 1.2.3.5 or 1.2.3.6
> ># iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4-1.2.3.6
> >---- SNIP ----
> >
> >Here you can se that you can do DNAT and SNAT to an range of ipadresse
> >so the question may be a bit clearer when i ask the question like this. 
> >How is it possible to log to wich ipadress the connection is translated
> >to?
> >
> >Regards
> >
> >Johan
> >
> >On Mon, 2004-01-19 at 20:17, Jeffrey Laramie wrote:
> >> Johan Ankarloo wrote:
> >> 
> >> >On Mon, 2004-01-19 at 17:24, Jeffrey Laramie wrote:
> >> >  
> >> >
> >> >>Johan Ankarloo wrote:
> >> >>
> >> >>    
> >> >>
> >> >>>On Mon, 2004-01-19 at 16:21, Jeffrey Laramie wrote:
> >> >>> 
> >> >>>
> >> >>>      
> >> >>>
> >> >>>>Johan Ankarloo wrote:
> >> >>>>
> >> >>>>   
> >> >>>>
> >> >>>>        
> >> >>>>
> >> >>>>>Hi
> >> >>>>>
> >> >>>>>Does anyone know how to log a DNAT/SNAT connection? When logging a NAT
> >> >>>>>connection you also want to know the origin source/destination/port of
> >> >>>>>that packet. Is that possible?
> >> >>>>>
> >> >>>>>
> >> >>>>>
> >> >>>>>     
> >> >>>>>
> >> >>>>>          
> >> >>>>>
> >> >>>>Sure. The easiest way to do it is to add a matching log rule just before 
> >> >>>>the nat rule:
> >> >>>>
> >> >>>>iptables -t nat -A POSTROUTING -o $Net_Interface -j LOG --log-prefix 
> >> >>>>"SNAT: "
> >> >>>>iptables -t nat -A POSTROUTING -o $Net_Interface -j SNAT --to $Net_IP
> >> >>>>
> >> >>>>Jeff
> >> >>>>   
> >> >>>>
> >> >>>>        
> >> >>>>
> >> >>>The problem is when doing this is that you doesn't get the original 
> >> >>>source/destination or the translating adress. If you look at the logs
> >> >>>you can't see all the information that you need to be able to debug any
> >> >>>problem or to be able to track that connection back to the user.
> >> >>> 
> >> >>>
> >> >>>      
> >> >>>
> >> >>I don't use DNAT so I can't tell you how it logs connections, but 
> >> >>logging a SNAT connection works fine. Here's the rules I used:
> >> >>
> >> >># Masquerade everything leaving the lan as the firewall IP.
> >> >>$iptables -t nat -A POSTROUTING -o $Net_Interface -j LOG --log-level 
> >> >>debug --log-prefix "SNAT: "
> >> >>$iptables -t nat -A POSTROUTING -o $Net_Interface -j SNAT --to $Net_IP
> >> >>
> >> >>And here's the log entry I got:
> >> >>
> >> >>Jan 19 11:14:21 NS1 kernel: SNAT: IN= OUT=eth1 SRC=192.168.0.4 
> >> >>DST=66.95.2.50 LEN=44 TOS=0x08 PREC=0x00 TTL=63 ID=17955 PROTO=TCP 
> >> >>SPT=1030 DPT=80 WINDOW=28672 RES=0x00 SYN URGP=0
> >> >>
> >> >>
> >> >>192.168.0.4 is the source host on the local private subnet
> >> >>66.95.2.50 is the IP of the remote host
> >> >>Sending port is 1030
> >> >>Dest port is 80
> >> >>
> >> >>And $Net_IP is IP the outside will see which is the IP of the firewall. 
> >> >>The SNATed ports will be the same as the original ones.
> >> >>
> >> >>Isn't this what you're looking for or did I misunderstand you?
> >> >>
> >> >>Jeff
> >> >>    
> >> >>
> >> >
> >> >No, i don't see all the information in your example above. Look at the 
> >> >following examples taken from the examples at
> >> >http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html
> >> >
> >> >---- SNIP ----
> >> >## Change destination addresses to 5.6.7.8, 5.6.7.9 or 5.6.7.10.
> >> ># iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 5.6.7.8-5.6.7.10
> >> >
> >> >## Change source addresses to 1.2.3.4, 1.2.3.5 or 1.2.3.6
> >> ># iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4-1.2.3.6
> >> >---- SNIP ----
> >> >
> >> >Here you can se that you can do DNAT and SNAT to an range of ipadresse
> >> >so the question may be a bit clearer when i ask the question like this. 
> >> >How is it possible to log to wich ipadress the connection is translated
> >> >to?
> >> >  
> >> >
> >> 
> >> Ahh, I see what the issue is. You 'know' the translated IP because you 
> >> explicitly set it within the NAT rule, not because it's in the log. In 
> >> the case of a target range there is no way for a prior logging rule to 
> >> tell which of the range addresses will be assigned by the NAT rule. I 
> >> think you'll need to use a tool like snort to get that kind of detail. 
> >> Maybe someone else knows another way, sorry I couldn't help you.
> >> 
> >> Jeff
> >
> >
> >
> >
-- 
Mvh
 
Johan Ankarloo
Volvo IT
Network & Security Engineer
Tel: +46 31 32 70949
 
====================================================================
This message may contain confidential and/or proprietary information,
and is intended only for the person/entity to whom it was originally
addressed. The content of this message may contain private views and
opinions which do not constitute a formal disclosure or commitment
unless specifically stated.


