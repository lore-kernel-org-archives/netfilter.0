From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: multiple ISP routing/firewall
Date: Sat, 24 Jul 2004 15:48:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241548.20108.Antony@Soft-Solutions.co.uk>
References: <20040723102011.88D9E3959@sitemail.everyone.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040723102011.88D9E3959@sitemail.everyone.net>
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

On Friday 23 July 2004 11:20 am, Alok Nath Upadhyay wrote:

> hi all,
> i am in a not so common situation and i have tried to figure out the
> solution without luck. i have 3 leased lines from three different vendors.
> i want to distribute outbound traffic from my lan on these three differnet
> links.

Sounds like a fairly simple configuration requirement for iproute2.

> i have some degree of success i.e. i can route the traffic but
> internet access speed is very slow. i guess that this is due to differnet
> DNS servers of these vendors.

I do not understand your reasoning here - what are you saying about the ISPs' 
DNS servers, and how would they cause your Internet access to be slow?

> moreover if i have the unristricted access to
> internet, i am fine. but not with the restrictions on services and ports.
> after this all internet access is denied. This is my firewalling script for
> ur debugging and any remedial measures.

The main observation I would make is that you are using the random match to 
determine what MARK to put on the packets - what happens in the cases where 
none of the random matches match?

eg: if you have three rules in sequence, each of which matches 33% of the 
packets going through it, the first rule will match 33% of the packets, the 
second rule will match 33% of the remaining 67% (ie: 22% of the original 
packets), and the final rule will match 33% of the 45% (100-33-22) which get 
that far (ie: 15% of the original packets).   This still leaves 30% of the 
original packets unmatched by any rule.

I know you have not set all the rules to 33%, but I think you have not taken 
account of the packets which will not match any of the probabilistic rules?

My approach (if I wanted equal numbers of packets to match all three rules) 
would be to set the first rule to match 33%, the second rule 50% (ie: half 
the ones which didn't match the first rule), and then the third rule to match 
100% (ie: all the packets which didn't match the first or second rules).   
Obviously you can adjust the 33% and 50% in this example if you want the 
three rules to match unequal quantities of packets.

Hope this helps,

Regards,

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


