From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: droping in forward/postrouting
Date: Sat, 31 Jul 2004 08:48:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407310848.28840.Antony@Soft-Solutions.co.uk>
References: <OF314C1F3E.9AD1008B-ON80256EE0.005745C8@start-global.com> <a0f69e504072913084fc39ee8@mail.gmail.com> <a0f69e504072923151d18afa3@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e504072923151d18afa3@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Friday 30 July 2004 7:15 am, Askar Ali Khan wrote:

> hi
> I duno but filter table "FORWARD" not blocking/dropping any of these
> site actaully these are spywares a gift from windowz and why i want to
> drop these dirty shits coz they consume lot of my precious bandwidth
> "dialup" ;)
>
> iptables -I FORWARD -s 0/0 -d 66.35.229.0/24 -j DROP
> iptables -I FORWARD -s 0/0 -d  212.4.208.105 -j DROP
> iptables -I FORWARD -s 0/0 -d 66.35.229.185 -j DROP
> iptables -I FORWARD -s 0/0 -d  64.152.73.0/24 -j DROP
> iptables -I FORWARD -s 0/0 -d  66.35.229.236 -j DROP
>
> However PREROUTING do working and dropping it :)
>
> iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.0/24 -j DROP
> iptables -t nat -I PREROUTING -s 0/0 -d  212.4.208.105 -j DROP
> iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.185 -j DROP
> iptables -t nat -I PREROUTING -s 0/0 -d  64.152.73.0/24 -j DROP
> iptables -t nat -I PREROUTING -s 0/0 -d  66.35.229.236 -j DROP

Do you have both these sets of rules in your ruleset at the same time?

If so, then packets which are DROPped in the PREROUTING chain will never make 
it to the FORWARD chain (because they've been DROPped), therefore the FORWARD 
rules will never see anything to DROP.

Try changing both targets from DROP to LOG, and see if the packets go through 
both chains as expected.

Also, of the five rules you've listed, two are pointless, as the addresses 
66.35.229.185 and 66.35.229.236 both fall within the first /24 range 
specified and will therefore be caught by the first rule.

If, on the other hand, you're saying that putting the rules above into 
PREROUTING does DROP the packets, but removing them from PREROUTING and 
putting them into FORWARD instead does not DROP the packets, then show us the 
rest of your PREROUTING ruleset, as you may be changing the destination 
address before the packets reach FORWARD?

Regards,

Antony.

-- 
I think, therefore I am.
I'm pink, therefore I'm Spam.
I drink, therefore I think I am.

                                                     Please reply to the list;
                                                           please don't CC me.


