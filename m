From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Having NAT problems
Date: Thu, 1 Apr 2004 21:19:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404012119.45564.Antony@Soft-Solutions.co.uk>
References: <20040401192505.3100.69461.Mailman@vishnu.netfilter.org> <200404012039.48071.Antony@Soft-Solutions.co.uk> <20040401200109.M82978@niesc.k12.in.us>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040401200109.M82978@niesc.k12.in.us>
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

On Thursday 01 April 2004 9:08 pm, Adam Kennedy wrote:

> The iptables -L -nvx output is QUITE lengthy, but I can post if someone
> really wants it. I'm a bit itchy over posting it due to wanna be system
> crackers.

We don't mind if you obscure the IP addresses (so long as we can still tell 
which is which...)

However, from what you have posted, I think the problem is that you have no 
FORWARD rule to allow the DNATed packets through your firewall?

Oh, dear me, no - that's not it - you have a default ACCEPT policy on your 
FORWARD chain (I'm not surprised you don't want to post your public IP 
address to the list...)

Okay, how's this then  - please post all the rules which you think are needed 
for this pcAnywhere setup to work (with suitable partial obscuring of IPs if 
you wish).   Then we'll tell you if we can see something missing?

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


