From: Jason Opperisano <opie@817west.com>
Subject: Re: weird message in logs
Date: Tue, 19 Oct 2004 16:25:45 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041019202545.GA3913@bender.817west.com>
References: <116401c4b5fc$0485cc40$49caa8c0@caris.priv>
	<20041019184419.GA3363@bender.817west.com>
	<11cb01c4b615$52ba8360$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <11cb01c4b615$52ba8360$49caa8c0@caris.priv>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

On Tue, Oct 19, 2004 at 04:53:37PM -0300, Peter Marshall wrote:
> Is it a problem that it is dropping these ?  I tried option a .. it did not
> seem to change anything.

i may have specified the wrong place the execute the command.  it looks
like you need to disable sending redirects on eth0 of the internal
firewall, but i may be misreading your diagram.

> |192.168.202.73| ---> |eth0 on internal firewall 192.168.200.1| ---> |eth0:1
> on internal firewal 10.90.0.1| ----> |eth1 on other firewall
> 10.90.0.2| ----> | eth0 on other firewall 192.168.90.1| --- >
> |192.168.90.10|
> 
> Basically, I was sshing to eth1 on the other firewall form 192.168.202.73
> ... I assume the redirect comes from the reply ?  technically, eth1 is on
> the same physical network as 192.168.200.0/21 ... so is that why it is doing
> the redirect ?

yes.

>  Is not logging these messages solving the problem ?  Or is
> there a prolem at all ?  Thank you very much for your reply.

the redirects are a symptom of your network topology--there's nothing
technically wrong with sending them, just as there is nothing
technically wrong with ignoring them.  if they bother you--use sysctl to
disable them from being sent on the machine that is sending them (or
disable them on all interfaces on both firewalls, if that's easier).

-j

-- 
Jason Opperisano <opie@817west.com>

