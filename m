From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: udp connection tracking
Date: Tue, 17 May 2005 14:50:09 -0500
Message-ID: <428A4AF1.2020605@riverviewtech.net>
References: <005b01c55af6$1db40980$3c01a8c0@ts.communitytrust.ca>	<428A2195.8090308@riverviewtech.net>
	<003301c55b13$eae37a90$3c01a8c0@ts.communitytrust.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003301c55b13$eae37a90$3c01a8c0@ts.communitytrust.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Firstly thank you for your reply!

You are welcome!

> Currently i have a rule in my firewall that DNATS to the client machine,
> I'm guessing that i will also need to DNAT that single packet but im not
> sure where to place the rule.
> could i use the two rules you gave me with this additional one:
> 
> iptables -t nat -A PREROUTING -i ${INet} -p udp -m recent --rcheck --seconds
> 60 --name WSWE8 -- source -j DNAT --to-destination $CLIENT_IP

Yes, you should be able to DNAT like you have suggested.  Heads up, you have "-- source" when it should be "--rsource" in your rule.  :)

> thank you again,

No problem.  This is what this list is for.

