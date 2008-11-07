From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Altering firewall rules to enable NAT Reflection
Date: Fri, 07 Nov 2008 13:00:48 -0600
Message-ID: <49149060.70100@riverviewtech.net>
References: <5bdb1aa70811061525h36988a9cr3db531232e4422d5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5bdb1aa70811061525h36988a9cr3db531232e4422d5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/06/08 17:25, Simon wrote:
> Sorry if IPCOP is a bad word here :) but i could do with some 
> assistance OR a better suggestion!

IMHO this list is a fine place to ask IPTables related questions.  As 
long as the questions boil down to IPTables questions, and not something 
specific to the IPTables wrapper I don't see a problem.

> We currently have a linksys ADSL modem with a fixed IP address on the 
> internet side and 192.168.1.0 on the internal side. We port forward 
> various ports to various ips on the internal network, including port 
> 443 to our MS Exchange server. This all runs nice as the linksys does 
> "NAT Reflection" (is that the correct term?) so internal clients can 
> just connect to the external IP to get services from internal 
> servers.

I've not heard the phrase "NAT Reflection" per say, but if I understand 
what you are wanting to do correctly, I don't see a problem with said 
phrase.  (See below for more details.)

> Now we have upgraded to VDSL (40Mbit, up from 5Mbit on ADSL) and the 
> router they have supplied does not do this. Well thats OK.. i can 
> setup the internal DNS so the external address points to internal IPs 
> - All well and good... until:
> 
> Iphones. According to Apple: The iphones push email setup does not 
> work if "your Exchange ActiveSync server has a different IP address 
> for intranet and Internet clients" (see 
> http://support.apple.com/kb/TS1868). And i can state that this is 
> correct.

Dough!

> So the first thing i thought, putting on my nubie hat, was to install 
> some sort of linux-based firewall so we can alter the firewall rules 
> to achieve the same. IPCOP is what i have used in the past, but no 
> one on the IPCOP forum or list can seem to be able to (or want to) 
> help me with this issue (no disrepect intended).

I think I can help.  I also think you might be running in to a 
restriction of IPCOP, which in my opinion is a ""wrapper to IPTables. 
I've found that a lot of ""wrappers can't truly provide an easy way to 
do what really can be done.

In short what you want to do from an IPTables point of view is to cause 
any internal client that initiates a connection to the external IP to 
really and unknowingly be connecting to the internal IP.  Sort of 
/reflected/ off the firewall.  (This is why I don't have a problem with 
the phrase "NAT Reflection".)

You will have the obvious rules for any inbound traffic (coming in to 
the external interface) that is destined to the IP and / or port of the 
service DNATed over to the internal IP / port.  I.e.

    iptables -t nat -A PREROUTING -i eth0 -d $PUBLIC_IP -p tcp --dport 
443 -j DNAT --to-destination $PRIVATE_IP

What you want to do is have a very similar rule to DNAT any outbound 
traffic (coming in the internal interface to go out the external 
interface) that is destined to the IP and / or port of the service 
DNATed over to the internal IP / port as well.  I.e.

    iptables -t nat -A PREROUTING -i eth1 -d $PUBLIC_IP -p tcp --dport 
443 -j DNAT --to-destination $PRIVATE_IP

Now to prevent what I call a "TCP Triangle" you will need to SNAT the 
internal traffic that is being redirected back to the $PRIVATE_IP so 
that replies pass back through the router and back to the original 
client rather than the $PRIVATE_IP replying directly to the original 
client.  (See 'Julian's TCP Triangle' page 
"http://jengelh.medozas.de/images/dnat-mistake.png" for a diagram.)

    iptables -t nat -A POSTROUTING -o eth1 -s $PRIVATE_LAN/$NM -d 
$PRIVATE_IP -j MASQUERADE

Note:  You can use either the MASQUERADE or SNAT target depending on 
your preferences or what ever is compiled in to your kernel.  I chose 
MASQUERADE so I did not have to take your routers internal IP in to 
account in the rule(s) above.

> Any assistance in getting it sorted OR a better suggestion would be 
> very appeciated (please dont tell me to get new phones!)

Try the above and see if things work.

> Thanks

*nod*



Grant. . . .
