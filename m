From: Harald Welte <laforge@netfilter.org>
Subject: Re: Looking for IPtables developers - Need help at core of iptables (not configuration)
Date: Tue, 3 Aug 2004 16:45:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040803144504.GF26969@sunbeam2>
References: <5.2.0.9.2.20040727115216.00aa0a30@pop.benesconsulting.com> <5.2.0.9.2.20040727115216.00aa0a30@pop.benesconsulting.com> <5.2.0.9.2.20040802161432.00aac218@pop.benesconsulting.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <5.2.0.9.2.20040802161432.00aac218@pop.benesconsulting.com>
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
Content-Transfer-Encoding: 7bit
To: Leon Bene <leon@benesconsulting.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>

On Tue, Aug 03, 2004 at 07:21:55AM -0700, Leon Bene wrote:
> Problem
>
> Using computer A and on the Internet or connected to another companies 
> network (via cisco VPN), the connection hangs for about 5 or 10 seconds 
> (the hang is seen on Computer A). No data is lost, just the whole 
> transaction waits intermittently for 5 to 10 seconds. Test example:
> Using Microsoft Excel I open a workbook on a remote server. Then start at 
> the top of a worksheet. Then I hold the down arrow key to scroll down the 
> worksheet. At row 49 the whole scrolling process stops, waits 5 seconds and 
> then starts scrolling again. If I use the page down key (seems like fewer 
> outbound packets) I can scroll down the whole worksheet without any pausing.

Sorry for being blunt, but what kind of crappy measurement method is
this?  Who does network latency testing by MS Excel?

Give me some real data like 'tcp session establishing took XXX seconds,
as indicated by the following tcpdump'  or 'ping shows extremely high
RTT'.

> Thanks
> Leon
-- 
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
============================================================================
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

