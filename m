From: Johan Ankarloo <johan.ankarloo@volvo.com>
Subject: Re: DNAT/SNAT and logging
Date: Mon, 19 Jan 2004 19:32:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074537179.1629.8.camel@ankarloo.got.volvo.net>
References: <1074524662.2456.23.camel@ankarloo.got.volvo.net>
	 <400BF600.9060005@Loudoun-Fairfax.com>
	 <1074526637.2457.30.camel@ankarloo.got.volvo.net>
	 <400C04B1.2030601@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <400C04B1.2030601@Loudoun-Fairfax.com>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2004-01-19 at 17:24, Jeffrey Laramie wrote:
> Johan Ankarloo wrote:
> 
> >On Mon, 2004-01-19 at 16:21, Jeffrey Laramie wrote:
> >  
> >
> >>Johan Ankarloo wrote:
> >>
> >>    
> >>
> >>>Hi
> >>>
> >>>Does anyone know how to log a DNAT/SNAT connection? When logging a NAT
> >>>connection you also want to know the origin source/destination/port of
> >>>that packet. Is that possible?
> >>>
> >>> 
> >>>
> >>>      
> >>>
> >>Sure. The easiest way to do it is to add a matching log rule just before 
> >>the nat rule:
> >>
> >>iptables -t nat -A POSTROUTING -o $Net_Interface -j LOG --log-prefix 
> >>"SNAT: "
> >>iptables -t nat -A POSTROUTING -o $Net_Interface -j SNAT --to $Net_IP
> >>
> >>Jeff
> >>    
> >>
> >
> >The problem is when doing this is that you doesn't get the original 
> >source/destination or the translating adress. If you look at the logs
> >you can't see all the information that you need to be able to debug any
> >problem or to be able to track that connection back to the user.
> >  
> >
> I don't use DNAT so I can't tell you how it logs connections, but 
> logging a SNAT connection works fine. Here's the rules I used:
> 
> # Masquerade everything leaving the lan as the firewall IP.
> $iptables -t nat -A POSTROUTING -o $Net_Interface -j LOG --log-level 
> debug --log-prefix "SNAT: "
> $iptables -t nat -A POSTROUTING -o $Net_Interface -j SNAT --to $Net_IP
> 
> And here's the log entry I got:
> 
> Jan 19 11:14:21 NS1 kernel: SNAT: IN= OUT=eth1 SRC=192.168.0.4 
> DST=66.95.2.50 LEN=44 TOS=0x08 PREC=0x00 TTL=63 ID=17955 PROTO=TCP 
> SPT=1030 DPT=80 WINDOW=28672 RES=0x00 SYN URGP=0
> 
> 
> 192.168.0.4 is the source host on the local private subnet
> 66.95.2.50 is the IP of the remote host
> Sending port is 1030
> Dest port is 80
> 
> And $Net_IP is IP the outside will see which is the IP of the firewall. 
> The SNATed ports will be the same as the original ones.
> 
> Isn't this what you're looking for or did I misunderstand you?
> 
> Jeff

No, i don't see all the information in your example above. Look at the 
following examples taken from the examples at
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html

---- SNIP ----
## Change destination addresses to 5.6.7.8, 5.6.7.9 or 5.6.7.10.
# iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 5.6.7.8-5.6.7.10

## Change source addresses to 1.2.3.4, 1.2.3.5 or 1.2.3.6
# iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4-1.2.3.6
---- SNIP ----

Here you can se that you can do DNAT and SNAT to an range of ipadresse
so the question may be a bit clearer when i ask the question like this. 
How is it possible to log to wich ipadress the connection is translated
to?
That is why i need the following information in the log file.
Original Source 
Original SourcePort 
Original Destination 
Original DestinationPort
Translated Source 
Translated SourcePort 
Translated Destination 
Translated DestinationPort

Regards

Johan


