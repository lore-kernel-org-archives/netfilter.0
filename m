From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: droping in forward/postrouting
Date: Sat, 31 Jul 2004 17:27:13 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e504073105276e10d9d3@mail.gmail.com>
References: <OF314C1F3E.9AD1008B-ON80256EE0.005745C8@start-global.com> <a0f69e504072913084fc39ee8@mail.gmail.com> <a0f69e504072923151d18afa3@mail.gmail.com> <200407310848.28840.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407310848.28840.Antony@Soft-Solutions.co.uk>
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

On Sat, 31 Jul 2004 08:48:28 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> On Friday 30 July 2004 7:15 am, Askar Ali Khan wrote:
> 
> > hi
> > I duno but filter table "FORWARD" not blocking/dropping any of these
> > site actaully these are spywares a gift from windowz and why i want to
> > drop these dirty shits coz they consume lot of my precious bandwidth
> > "dialup" ;)
> >
> > iptables -I FORWARD -s 0/0 -d 66.35.229.0/24 -j DROP
> > iptables -I FORWARD -s 0/0 -d  212.4.208.105 -j DROP
> > iptables -I FORWARD -s 0/0 -d 66.35.229.185 -j DROP
> > iptables -I FORWARD -s 0/0 -d  64.152.73.0/24 -j DROP
> > iptables -I FORWARD -s 0/0 -d  66.35.229.236 -j DROP
> >
> > However PREROUTING do working and dropping it :)
> >
> > iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.0/24 -j DROP
> > iptables -t nat -I PREROUTING -s 0/0 -d  212.4.208.105 -j DROP
> > iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.185 -j DROP
> > iptables -t nat -I PREROUTING -s 0/0 -d  64.152.73.0/24 -j DROP
> > iptables -t nat -I PREROUTING -s 0/0 -d  66.35.229.236 -j DROP
> 
> Do you have both these sets of rules in your ruleset at the same time?
No one at a time I hash (#) the appreporate rules
> 
> If so, then packets which are DROPped in the PREROUTING chain will never make
> it to the FORWARD chain (because they've been DROPped), therefore the FORWARD
> rules will never see anything to DROP.
> 
> Try changing both targets from DROP to LOG, and see if the packets go through
> both chains as expected.
> 
> Also, of the five rules you've listed, two are pointless, as the addresses
> 66.35.229.185 and 66.35.229.236 both fall within the first /24 range
> specified and will therefore be caught by the first rule.
> 
> If, on the other hand, you're saying that putting the rules above into
> PREROUTING does DROP the packets, but removing them from PREROUTING and
> putting them into FORWARD instead does not DROP the packets, then show us the
> rest of your PREROUTING ruleset, as you may be changing the destination
> address before the packets reach FORWARD?
Yeah its Drops the packets in PREROUTING, however not Dropping the
same while tries with FOWARD.
here are my PREROUTING rules (1st one is of POSTROUTING)

> 
> Regards,
iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.0.0/24 -d 0/0  -j MASQUERADE

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
--to-port 3128

######## USING filter table chain FORWARD ########### not working :D
#iptables -I FORWARD -s 0/0 -d 66.35.229.0/24 -j DROP
#iptables -I FORWARD -s 0/0 -d  212.4.208.105 -j DROP
#iptables -I FORWARD -s 0/0 -d 66.35.229.185 -j DROP
#iptables -I FORWARD -s 0/0 -d  64.152.73.0/24 -j DROP
#iptables -I FORWARD -s 0/0 -d  66.35.229.236 -j DROP
#iptables -I FORWARD -s 0/0 -d  64.157.165.181 -j DROP
#iptables -I FORWARD -s 0/0 -d  66.35.229.153 -j DROP
#iptables -I FORWARD -s 0/0 -d 64.157.165.249 -j DROP
#iptables -I FORWARD -s 0/0 -d  66.35.229.175 -j DROP
##########
######### Using PREROUTING ############## working
iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.0/24 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  212.4.208.105 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.185 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  64.152.73.0/24 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  66.35.229.236 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d 64.152.73.174 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  64.157.165.181 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  66.35.229.153 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  64.152.73.207 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d 64.157.165.249 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d 64.152.73.185 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  66.35.229.175 -j DROP
###############
see I hashed the FORWARD rules coz it was not Droping packets.

> 
> Antony.
regards
Askar
> 
> --
> I think, therefore I am.
> I'm pink, therefore I'm Spam.
> I drink, therefore I think I am.
> 
>                                                     Please reply to the list;
>                                                           please don't CC me.
> 
>

