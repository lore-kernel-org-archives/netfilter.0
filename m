From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Help with ICMP Ruls
Date: Thu, 15 Jul 2004 14:57:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F6E1A8.6060705@pbl.ca>
References: <20040715192110.11412.qmail@web40702.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040715192110.11412.qmail@web40702.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Real Cucumber <monkcucumber@yahoo.com>
Cc: netfilter@lists.netfilter.org

Real Cucumber wrote:
> That is why I'm not sure if I need ICMP supported on
> it or not, and not sure where do add the ICMP support
> (input, output, forward).

You need it in FORWARD, that's obvious.  You also need it in OUTPUT 
because ICMP packets can be generated on your forwarding machine too. 
For example, if it fails to pass the packet to the next hop, it will 
generate "no route to host/network" message back to originating host 
(this ICMP packet will have source address of forwarding machine, so it 
goes to OUTPUT chain).  More examples of ICMP packets generated on your 
forwarding machine (as result of receiving a packet that should be 
forwarded) would be traceroute (which works by exploiting TTL exceeded) 
and path MTU discovery (which works by exploiting don't fragment bit).

Note that removing match for RELATED from INPUT chain does not gain you 
much (other than one line less in rules).  If your machine only forwards 
packets, no ICMP that ends up in INPUT chain will ever be in RELATED 
state (it will be in either NEW or INVALID states).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

