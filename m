From: Jim Laurino <JimLaur@acm.org>
Subject: Re: icmp messages to spoofed address accepted by -m conntrack --ctstate ESTABLISHED,RELATED (nfcan: addressed to exclusive sender for this address)
Date: Fri, 19 Mar 2004 15:33:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040319203341.GA3280@salty>
References: <20040318223551.GA1128@salty>
Reply-To: JimLaur@acm.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040318223551.GA1128@salty> (from +nfcan+jimlaur+ca3dcad0c0.nfcan.x.jimlaur#dfgh.net@spamgourmet.com on Thu, Mar 18, 2004 at 17:35:51 -0500)
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

