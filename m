From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Statefull??
Date: Sun, 4 Apr 2004 17:12:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404041712.04997.Antony@Soft-Solutions.co.uk>
References: <4070CB3E.3000603@scan-associates.net> <200404041345.16938.Antony@Soft-Solutions.co.uk> <40711048.8070706@scan-associates.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40711048.8070706@scan-associates.net>
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

On Monday 05 April 2004 8:52 am, Wan Seman Bin Wan Ismail wrote:

> already did that and it's work.. thanks.. but somehow i would like to
> allow my web for updating security patches from xxxx server,

What TCP/UDP port/s does that require?

> but the fw have rejected the req.
>
> here is my rules:-
>
> $ipt -A SCAN -i $EXT -o $DMZ -p tcp -m tcp -s 0/0 -d $WEB --dport 80 -j
> LOG --log-level info --log-prefix "[IN WEB] :"
> $ipt -A SCAN -i $EXT -o $DMZ -p tcp -m tcp -s 0/0 -d $WEB --dport 80 -j
> ACCEPT
>
> $ipt -A SCAN -i $EXT -m state --state ESTABLISHED,RELATED -j LOG
> - --log-prefix "Established conn: "
> $ipt -A SCAN -i $EXT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $ipt -A SCAN -i $EXT -o $DMZ  -p tcp -m tcp ! --tcp-flags SYN,RST,ACK
> SYN -m state --state NEW -j LOG --log-prefix "NEW NOT SYN: "
> $ipt -A SCAN -i $EXT -o $DMZ  -p tcp -m tcp ! --tcp-flags SYN,RST,ACK
> SYN -m state --state NEW -j DROP
>
> $ipt -A FORWARD -i $DMZ -p tcp -m state --state NEW -s $WEB -d xxxx
> - --dport 80 -j LOG --log-level info --log-prefix "OUT DNS :"

1. You appear to have a spare '-' in the above rule (also the one below)
2. DNS operates on TCP and UDP ports 53, not TCP port 80

> $ipt -A FORWARD -i $DMZ -p tcp -m state --state NEW -s $WEB -d xxxx
> - --dport 80 -j ACCEPT
> $ipt -A FORWARD -i $DMZ -o $EXT -p tcp -m tcp -m state --state NEW -j
> LOG --log-level info --log-prefix "[Init DMZ] "
> $ipt -A FORWARD -i $DMZ -o $EXT -p tcp -m tcp -m state --state NEW  -j
> REJECT

By the way, you have some very good LOGging rules in this ruleset - make use 
of them.   If you find that some service is not working, look at what sort of 
packet is being LOGged, and then add an ACCEPT rule to allow that type of 
packet.   That will allow you to get your ruleset allowing the traffic you 
want without necessarily having to look up too much detail about what the 
traffic is in advance (such as the security update feature I asked about 
above - I don't know what that uses, so if you don't either, just run it, see 
what packet type gets LOGged before being DROPped, and then ACCEPT that sort 
of packet).

Regards,

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


