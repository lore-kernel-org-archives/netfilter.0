From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: irc dcc incoming transfers truncated after a while
Date: Tue, 5 Apr 2005 17:59:50 -0400
Message-ID: <200504051759.50574.Alistair@nerdnet.ca>
References: <1112267638.21083.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1112267638.21083.14.camel@localhost.localdomain>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On March 31, 2005 06:13 am, Andrea Ratto wrote:
> Hello List!
> I am running a SuSE based router and NAT gateway. It uses the
> SuSEFirewall iptables based script, which saved me a lot of tweaking.
> Everything works great except irc dcc file transfers. I am not talking
> about uploads from internal network (those works because I use forwarded
> ports) but about downloads. After a minute or so the firewall blocks
> some packages killing the transfer.
	
	Are you absolutely certain that your firewall is doing the blocking? -- LOG 
the packets please and let us see.... 

	When you loaded the ip_conntrack_irc module did you set the server ports you 
would be connecting to?  --> modinfo ip_conntrack_irc for the details, you 
need to have the IRC server ports you are connecting to in there.

> Of course i have modprobed ip_nat_irc and ip_conntrack_irc that SuSE
> didn't load by default, but the problem remains. So I was wondering if
> there is something I still need to do (some iptables command to make use
> of the modules?). I haven't found any doc so I am asking the list.
> Thank very much. Bye


	P.S. I've had problems with users on RR getting dcc transfers started, but 
the  connection dies .. I'm not sure where the problem lies -- but its 
something I've seen.
	
	Alistair

