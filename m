From: Jason Opperisano <opie@817west.com>
Subject: Re: Second shot at IPTables script
Date: Fri, 17 Dec 2004 19:19:09 -0500
Message-ID: <1103329148.3262.66.camel@hubcap.ljm.dom>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<1103319685.3262.34.camel@hubcap.ljm.dom>
	<6.1.2.0.0.20041217153701.02477400@corpmail.courtesymortgage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.1.2.0.0.20041217153701.02477400@corpmail.courtesymortgage.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2004-12-17 at 18:40, Jason Williams wrote:
> At 01:41 PM 12/17/2004, Jason Opperisano wrote:
> > > $IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
> >
> >you really want to allow unlimited access to your firewall from your
> >internal network?
> 
> Just thought about this. What if I wanted to give just one box SSH access 
> to the firewall (maintenance lets say).
> 
> It would be something like this:
> 
> $IPTABLES -A INPUT -p tcp -i $LAN_IFACE -s 192.168.1.90 -dport 22 -j ACCEPT

you're missing a '-' right................................^ here, but
yeah--that's the concept.  for what it's worth, i always like to specify
"--syn" as well:

  iptables -A INPUT -p tcp --syn -i $LAN_IFACE -s 192.168.1.90 \
    --dport 22 -j ACCEPT

since the rest of the connection will be handled by your "-m state
--state ESTABLISHED,RELATED" rule at the top.  even more restrictive
options would be to specify and unprivileged source port, and the proper
destination IP, giving us:

  iptables -A INPUT -p tcp --syn -i $LAN_IFACE \
    -s 192.168.1.90 --sport 1024:65535 -d $LAN_IP --dport 22 -j ACCEPT

yeah--that looks pretty good to me.

-j

--
"Ooh, they used nylon rope this time. It feels smooth against my skin,
 almost sensuous."
	--The Simpsons


