From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: two negatived parameters
Date: Mon, 6 Sep 2004 04:49:01 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409060449.02415.Alistair@nerdnet.ca>
References: <7421.1094459312@www2.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7421.1094459312@www2.gmx.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On September 6, 2004 04:28 am, Akolinare@gmx.net wrote:
> Hi,
>
> I have a little question with two negatived parameters in one rule.
>
> I create a rule, which should only match if source and destination are not
> the given. I think that it is easy and try the following rule:
>
> iptables -A FORWARD -s ! host1 -d ! host2 -j ACCEPT
>
> But with this rule pakets from host1 to host3 (or from host2 to host3) were
> not affected. It seems like the logical combination is OR and not AND
> unlike the not negatived rule.
> I think that the rule is logical right. Is it a little bug or have I
> misunderstood something?
>
> I used the version 1.2.11 with kernel 2.4.26.
>
>   Markus

	I take it to mean that packets from host2 to host 3 were NOT accepted by this 
rule? ... What do the counters for the rule say? ( iptables -L -n -v -x  ).

	What other rules exist that might affect said packets? -- I note the above is  
an ADD.  Could rules farther up the FORWARD chain have already 
accepted/denied the said packets?

	FYI -- I just tested this by inserting a double negative rule in my firewall 

	iptables -I tcp_packets -p tcp -s ! {internal_lan} -d ! {internal lan ip} 
--dport 25 -j allowed 

	and sending myself an email from outside.  The packet counter incremented 
appropriately.

	2.6.7 linux iptables 1.2.11

	and now that rule is gone.

	Alistair

