From: "Nix N. Nix" <nix@go-nix.ca>
Subject: Re: A few questions
Date: 15 Nov 2002 14:21:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037388091.11133.6.camel@tux.go-nix.ca>
References: <200211150220.58430.iptables@linuxkungfu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211150220.58430.iptables@linuxkungfu.org>
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
To: grasshopper@linuxkungfu.org
Cc: netfilter@lists.samba.org

On Fri, 2002-11-15 at 03:20, Rocco Stanzione wrote:
> I have a few questions about iptables, and about some of the traffic I've seen 
> on this list.
> 
> 1) I've successfully set up DNAT so that I can, say, request port 81 on the 
> firewall/gateway box and hit the webserver on port 80 on a box behind the 
> gateway.  No problem.  But it doesn't work on the LAN.  I understand why, 
> after reading some docs, but I've been trying to find a way around it.  
> Problem is, I don't know what all iptables will auto-reverse for me and what 
> I need to specify.  For example, I suppose I could SNAT local connections 
> through the gateway --to-source $GATEWAYIP, but would returning packets be 
> taken care of, or must I come up with a rule for that?  I've tried both 
> without success.

AFAIK, DNAT and SNAT take care of entire connections, not just
individual packets. For example:

iptables -t nat --destination ${OUTSIDE_IP} --dport ${OUTSIDE_PORT} -j
DNAT --to-destination ${INSIDE_IP}:${INSIDE_PORT}

takes care of both packets of the form 

src:${OUTSIDE_IP}:${OUTSIDE_PORT}
dst:${INSIDE_IP}:${INSIDE_PORT}

as well as the return packets

src:${INSIDE_IP}:${INSIDE_PORT}
dst:${OUTSIDE_IP}:${OUTSIDE_PORT}

> 
> 2) Quite a few people are using my iptables script, and the most common 
> complaint I get is dcc failure.  ip_conntrack_irc (and everything else) is 
> compiled into my (monolithic) kernel.  Most people don't have this setup.  
> Dcc of course works for me.  I have the user modprobe ip_conntrack_irc, and 
> typically it still doesn't work for them.  Logs show it failing at a 
> catch-all rule, which tells me conntrack isn't working.  However if we add 
> ip_conntrack_irc to /etc/modules and reboot, all is well.  So, 2a) why is 
> this? and 2b) surely there's something less drastic than a reboot that will 
> put ip_conntrack_irc to work?

I think you need both ip_conntrack_irc.o and ip_nat_irc.o to get DCC
working.  I run a DCC fserve behind my firewall.

> 
> 3) I see quite a few messages on the list about people going to a great deal 
> of trouble to get a VPN connection to NAT through an iptables firewall.  I 
> have an always-on PPTP connection to the M$ VPN server at work, and I have 
> never had to do anything special to get it to work.  I have to assume, then, 
> that I have some liberal rule or policy that is likely insecure, and I wonder 
> what it could be.  I'm afraid I don't have a pasteable rule set, as it's 
> spread out across config files and such.  If anyone cares to pore over it, 
> it's at http://www.linuxkungfu.org/ipkungfu-0.2.0.tgz
> 
> Thanks!
> 
> Rocco


