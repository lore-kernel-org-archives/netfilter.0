From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Forwarding help
Date: Thu, 27 Nov 2003 11:34:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311271134.06406.Antony@Soft-Solutions.co.uk>
References: <000701c3b469$17203ba0$14d36c50@anonymous> <200311262230.31909.Antony@Soft-Solutions.co.uk> <002901c3b4d6$ab0bbca0$14d36c50@anonymous>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002901c3b4d6$ab0bbca0$14d36c50@anonymous>
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

On Thursday 27 November 2003 11:07 am, sc2@gmx.at wrote:

> Thx for answer antony
> here the complet rules list, sorry for this xx.xx.xx it was stupid from me
> (full range)...
> Ip : xx.xxx.24.51 , should be fw to ip: xx.xxx.24.58
> (only for 1 port)
> thank you
>
> echo "1" > /proc/sys/net/ipv4/ip_forward
> iptables -F FORWARD
> iptables -t nat -F
> iptables -A FORWARD -j LOG
> iptables -A FORWARD -p udp -d xx.xxx.24.58 --dport xxx21 -j ACCEPT
> iptables -t nat -A PREROUTING -p udp -d xx.xxx.24.51 --dport xxx21 -j
> DNAT --to xx.xxx.24.58:xx021
>
> iptables -A FORWARD -p tcp -d xx.xxx.24.58 --dport xxx21 -j ACCEPT
> iptables -t nat -A PREROUTING -p tcp -d xx.xxx.24.51 --dport xxx21 -j
> DNAT --to xx.xxx.xx.58:xxx21

The only thing I can see missing here is a rule to allow the replies back 
through the Firewall in the other direction (the FORWARD rules you have shown 
only allow the first packet of the initial connection).

So "iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT" might 
be a good idea.

However, the fact that the original address, and the translated address, are 
both in the same network range, makes me ask "is the client which is trying 
to access xx.xxx.25.51 on the other side of the Firewall (ie the client must 
not be on the same subnet as the server xx.xxx.25.58)?"

My final question is: what is the actual port number (or alternatively, what 
is the service you are trying to NAT)?   Are you sure it is a protocol which 
doesn't mind being NATted (some do, some don't, some need helpers)?

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


