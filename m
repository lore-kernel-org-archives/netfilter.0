From: cees-bart <ceesb@cs.kun.nl>
Subject: Re: "iptables: Invalid argument" with kernel 2.4.20
Date: Tue, 17 Dec 2002 10:55:33 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0212171053280.17546-100000@flex.cs.kun.nl>
References: <200212161435.06101.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212161435.06101.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, 16 Dec 2002, Joel Newkirk wrote:

> On Monday 16 December 2002 11:25 am, cees-bart wrote:
> > hi all,
> 
> > -A OUTPUT -d MYMACHINE -p udp -m udp --dport 27960 -j DNAT \
> >                            --to-destination OTHERMACHINE:30000
> 
> > this setup works fine on kernel 2.4.19 with iptables 1.2.6a.
> >
> > BUT, the last rule (OUTPUT) fails with message "iptables: Invalid
> > argument" when running under 2.4.20.
> 
> Have you tried manually creating the rule, or are you restoring from a 
> save made with the earlier version?  

i tried both, and i found my mistake:

i forgot to enable CONFIG_IP_NF_NAT_LOCAL in the kernel.
sorry for the trouble.

bye,
cees-bart


