From: "Dhyanesh Ramaiya" <dhyanesh@intafrica.com>
Subject: RE: Port forwarding
Date: Fri, 6 Jun 2003 13:23:29 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NEBBLMKCGKOKDLMNJILLAEEIKKAA.dhyanesh@intafrica.com>
References: <3EE04D8E.7040306@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EE04D8E.7040306@snapgear.com>
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

Thank you all for your responses. I had in mind to update the /etc/hosts
file (as was suggested by George), but didn't want to do it straight away
without knowing the reasons. Will try to put the NAT rules in the output
chain to solve this problem.

Dhyanesh Ramaiya

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Philip Craig
Sent: Friday, June 06, 2003 11:15 AM
To: Dhyanesh Ramaiya
Cc: netfilter@lists.netfilter.org
Subject: Re: Port forwarding


Dhyanesh Ramaiya wrote:
> iptables -t nat -A PREROUTING -j DNAT -p tcp -d <public_ip> --dport
110 --to
> <private_ip>:110
> iptables -t nat -A PREROUTING -j DNAT -p tcp -d <public_ip> --dport
25 --to
> <private_ip>:25
>
> What happens, is that when I try to telnet port 25 or 110 from the router
> itself, it doesn't connect and gives the error "Connection refused".
> However, from any other machine on the network it connects. Thinking that
> some firewall rules might be blocking the connection, the default policy
of
> all chains is set to accept.

Packets from the router itself do not go through the PREROUTING
chain, so they aren't being NATed.  You'll need to add similar
NAT rules in the OUTPUT chain.

--
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


