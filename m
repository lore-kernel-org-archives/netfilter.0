From: Sergio Basurto Juarez <sbasurtoj@yahoo.com>
Subject: Re: Doubt about forwarding. Please, Help me!
Date: Thu, 14 Jul 2005 12:50:26 -0700 (PDT)
Message-ID: <20050714195026.4628.qmail@web33004.mail.mud.yahoo.com>
References: <20050714184051.CE18E6F027@ws1-5.us4.outblaze.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050714184051.CE18E6F027@ws1-5.us4.outblaze.com>
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



--- Morales Carlos <cmmorales@mail.com> wrote:

> Hello. I have a firewall blocking all the traffic
> from the Internet to my local network, but I need to
> let an external host (extHOST) to access the port
> 8888 (for example) of an internal host (intHOST). Is
> this correct? The external lan adapter is eth1.
> 
>  /sbin/iptables -t nat -A PORTFW -p tcp -i eth1 -s
> extHOST --dport 8888 -j DNAT --to-destination
> intHOST:8888
> 
> Thaks, please email me to cmmorales@mail.com 
> Carlos
> 

Your iptables is good, if you are new to iptables may
be is better instert your rule in the chain PREROUTING
so the rule comes like:

iptables -t nat -A PREROUTING -p tcp -i eth1 -s
extHOST --dport 8888 -j DNAT --to intHOST:8888

Also remember to enable ip_forwarding with
echo "1" /proc/sys/net/ipv4/ip_forward

Besides you must have a couple of rules in the FORWARD
chain like:
# Letting go the traffic from your net to any where
iptables -I FORWARD -s $INTNET -d $UNIVERSE -j ACCEPT

# Now just letting in only the related traffic to a 
# connection that begins from your net.
iptables -A FORWARD -s $UNIVERSE -d $INTNET -m state \
--state ESTABLISHED,RELATED -j ACCEPT

# Finally deny anything else.
iptables -A FORWARD -j DROP

I don't think you must have to DNATTED the output
traffic.

I hope this help.

Regards.

-- 
Sergio Basurto J.

If I have seen further it is by standing on the 
shoulders of giants. (Isaac Newton)
--

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

