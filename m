From: "Darrell A. Escola" <darrell-iptables@descola.net>
Subject: Re: portforward of port 80 not working
Date: Sat, 1 Feb 2003 17:37:43 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030202013743.GA29181@descola.net>
References: <5.1.0.14.2.20030201201121.02dcdeb0@linda.kadnet.dom> <200302011545.31115.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200302011545.31115.netfilter@newkirk.us>
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
Content-Transfer-Encoding: 7bit
To: Joel Newkirk <netfilter@newkirk.us>
Cc: netfilter@lists.netfilter.org

If you are adding these lines to a script that removes your current rules,
then re-applies your rules, the PREROUTING and 2 FORWARD rules should work.

If you are inserting the new rules from the command line:

iptables -A ............ appends to the end of the chain
iptables -I ............ inserts at the beginning of the chain

Hope this helps,

-- 
Darrell A. Escola, CCNA(R), MCSE(R), A+(R), Linux+(R)

On Sat, Feb 01, 2003 at 03:45:31PM -0500, Joel Newkirk wrote:
> On Saturday 01 February 2003 02:23 pm, Rasmus Reinholdt Nielsen wrote:
> > Hi
> >
> > I have a problem forwarding port 80. I can forward any ofter port,
> > like 81 or 8080. I juse
> > iptables -t nat -A PREROUTING -p tcp -i eth2 -s 0/0 --dport 80 -j DNAT
> > --to 172.16.1.7:80
> >
............
> >
> > iptables -A INPUT -j ACCEPT
> > iptables -A FORWARD -j ACCEPT
> > iptables -t nat -A POSTROUTING -j MASQUERADE
> > iptables -t nat -A PREROUTING -p tcp -i eth2 -s 0/0 --dport 80 -j DNAT
> > --to 172.16.1.7:80
> >
> > just to try it - and that too didn't work.
> >
> > I am running kernel 2.4.19-pre9 and iptabels 1.2.7 on a redhat 7.3
> >
> > Hope somebody have an idea, and thanks in advance.
> >
> > /Rasmus
> 
> If you are /really/ using 1.2.7, update it now.  1.2.7 is considered 
> "broken" by the Netfilter team, and is supposed to be replaced with 
> 1.2.7a in all installations.
> 
> That said, and updated if necessary, try:
> 
> iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 80 -j   \
> 	DNAT --to 172.16.1.7
> iptables -t nat -A POSTROUTING -d 172.16.1.7 -j SNAT --t ?.?.?.?
> iptables -A FORWARD -d 172.16.1.7 -j ACCEPT
> iptables -A FORWARD -s 172.16.1.7 -j ACCEPT
> 
> These four should do it, provided another rule is not diverting or 
> blocking the traffic.  If Apache logs show it arriving, then that is not 
> likely to be the case.  The ?.?.?.? in the SNAT needs to be the static 
> IP of the interface the traffic between the firewall and the server will 
> flow through.  If it is a dynamic IP, then you would need the MASQUERADE 
> target as you tried above, but you must also have 
> "echo 1 > /proc/sys/net/ipv4/ip_dynaddr" to allow the MASQ target to 
> track the IP of the interface, otherwise the target won't work.
> 
> The two forward rules are just generalizations that allow ANY traffic to 
> and from the server.  In a 'real' situation you'd want to tighten this 
> up, probably with port 80 allowed to the server, and ESTABLISHED and 
> RELATED allowed each direction.
> 
> j
> 
> 


