From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: travelling the tables and chains...
Date: Sun, 03 Apr 2005 22:30:08 -0500
Message-ID: <4250B4C0.5050405@riverviewtech.net>
References: <4250A5A6.6040509@lorenzutti.com.ar>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4250A5A6.6040509@lorenzutti.com.ar>
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
To: Guido Lorenzutti <guido@lorenzutti.com.ar>
Cc: netfilter@lists.netfilter.org

If I understand you correctly, you are wanting traffic that is not DNATed to pass through your FORWARD_WAN_TO_LAN chain?  If that is the case you should try something like this:

iptables -A FORWARD -i $WAN -o $LAN -m state --state INVALID,NEW,UNTRACKED -j FORWARD_WAN_TO_LAN
iptables -A FORWARD -i $WAN -o $LAN -m state --state ESTABLISHED,RELATED -j ACCEPT

This should cause all traffic (if I understand correctly) that is not recognized by DNAT... (as I type this I'm thinking SNAT, but DNAT *may* behave the same way too) ...to be send to the FORWARD_WAN_TO_LAN and any traffic that is recognized by DNAT to be plainly ACCEPTED.

Does any one else have any comments on this?



Grant. . . .

Guido Lorenzutti wrote:
> Hi people, i would like to clean up my firewall script by creating new 
> chains in the filter table. Like this:
> 
> iptables -N FORWARD_WAN_TO_LAN
> 
> Then, call the traffic in the FORWARD chain:
> 
> iptables -A FORWARD -i $WAN -o $LAN -j FORWARD_WAN_TO_LAN
> 
> Now how can i discriminate the DNATed packets from that rule? It's OK if 
> i MARK them in the PREROUTING chain and create a rule BEFORE in the 
> FORWARD chain to check if the packet im MARKed then -j DNATED_WAN_TO_LAN?
> 
> Any better ideas?
> 

