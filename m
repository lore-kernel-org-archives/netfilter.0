From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Statefull??
Date: Sun, 4 Apr 2004 12:28:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404041228.25943.Antony@Soft-Solutions.co.uk>
References: <4070CB3E.3000603@scan-associates.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4070CB3E.3000603@scan-associates.net>
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

On Monday 05 April 2004 3:58 am, Wan Seman Bin Wan Ismail wrote:

> Dear all,
>
> I got a problem dealing with my current iptables rules
>
> here is my iptables rules:-
>
> $ipt -A FORWARD -i $EXT -o $DMZ -p tcp -m tcp -s 0/0 -d $WEB --dport 80
> - -j LOG --log-level info --log-prefix "[IN WEB] :"
> $ipt -A FORWARD -i $EXT -o $DMZ -p tcp -m tcp -s 0/0 -d $WEB --dport 80
> - -j ACCEPT
>
> $ipt -A FORWARD -i ! $EXT -m state --state NEW -j ACCEPT
> $ipt -A FORWARD -i $EXT -m state --state ESTABLISHED,RELATED -j LOG
> - --log-prefix "Established conn: "
> $ipt -A FORWARD -i $EXT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $ipt -A FORWARD -i $EXT -o $DMZ  -p tcp -m tcp ! --tcp-flags SYN,RST,ACK
> SYN -m state --state NEW -j LOG --log-prefix "NEW NOT SYN: "
> $ipt -A FORWARD -i $EXT -o $DMZ  -p tcp -m tcp ! --tcp-flags SYN,RST,ACK
> SYN -m state --state NEW -j DROP
>
> $ipt -A FORWARD -i $EXT -o $DMZ -p tcp -j LOG --log-level info
> - --log-prefix " EXT-DMZ TCP DROP "
> $ipt -A FORWARD -i $EXT -o $DMZ -p tcp -j REJECT
> $ipt -A FORWARD -i $DMZ -o $EXT -p tcp -j LOG --log-level info
> - --log-prefix " DMZ-EXT TCP DROP "
> $ipt -A FORWARD -i $DMZ -o $EXT -p tcp -j REJECT
> $ipt -A FORWARD -i $EXT -o $DMZ -p udp -j LOG --log-level info
> - --log-prefix " EXT-DMZ UDP DROP "
> $ipt -A FORWARD -i $EXT -o $DMZ -p udp -j REJECT
> $ipt -A FORWARD -i $DMZ -o $EXT -p udp -j LOG --log-level info
> - --log-prefix " DMZ-EXT UDP DROP "
> $ipt -A FORWARD -i $DMZ -o $EXT -p udp -j REJECT
>
>
> so my problem is why ppl outside can't browse my webpages?

Because you are REJECTing the reply packets from the server :)

Just take a look at the above rules, and think firstly about a SYN packet from 
the client (EXT) to the server (on the DMZ).

It will match the first and second rules, and therefore gets LOGged, and 
ACCEPTed.

Now think about the SYN ACK replly packet from the server (on the DMZ) to the 
client (EXT).

It will match the tenth and eleventh rules, and therefore gets LOGged and 
REJECTed.

Hope this explains the problem.

Regards,

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


