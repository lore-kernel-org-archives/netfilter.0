From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: icmp messages to spoofed address acceptedby -m conntrack --ctstate ESTABLISHED,RELATED
Date: Fri, 19 Mar 2004 15:41:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040319204142.GA3294@salty>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter list <netfilter@lists.netfilter.org>

On 2004.03.18 17:35, Jim Laurino  - nfcan.x.jimlaur@dfgh. 
net wrote:
> I added a rule with this matching pattern to
> the iptables firewall on my machine.
> 
> -m conntrack --ctstate ESTABLISHED,RELATED
> 
> It is matching icmp packets about an
> unreachable destination that are sent here
> because someone is spoofing my IP address.
> 
> I do not see in /proc/net/ip_conntrack
> any entry that I think should match these packets.
> 
> I have come here to try to find out if this
> match is the expected behavior of this rule,
> or if this match is a misuse of the conntrack
> module by me, or if this is a bug in connection tracking.
> 
> Regards,
> 
> Jim Laurino
> 
> 

