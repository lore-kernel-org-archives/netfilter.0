From: James Cooke <lists@jcitc.com>
Subject: Re: Multiple client VPN - where to put conntrack?
Date: Wed, 10 Nov 2004 10:59:39 +0000
Message-ID: <4191F49B.9020702@jcitc.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F0197B7@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F0197B7@pxtvjoexd01.pxt.primeexalia.com>
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

Dear Gary and Tazo,

sorry, thought I'd replied to this already... I had planned to and then
it completely slipped my mind - it was all the excitement of getting the
VPN working with multiple clients! So many thanks, your advice was
really useful.

Tazo - thanks for the heads up on MTU, I shall keep an eye on it. As you
said, conntrack is not needed at the PPTP server end - based on this, we
tested from a new location yesterday and had a couple of connections
running from behind a hardware ADSL router doing NAT (and obviously
connection tracking the tunnels too).

Gary, thanks for the advice. I'm going to compile a fresh kernel for the
Debian router doing the NAT so that it can connection track the tunnels
and we can have multiple connections from the office too.

All the best and thanks again,

James


Gary W. Smith wrote:
> I replied to this yesterday.  You need to put pptp-conntrack (different
> from normal conntrack) into your kernel.  It can be found at the
> netfilter respository.
> 
> I did just this last month on RHEL3r3.  
> 
> Gary Wayne Smith
> 
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
> zping@founderbn.com
> Sent: Tuesday, November 09, 2004 4:00 PM
> To: netfilter@lists.netfilter.org
> Subject: Re:Multiple client VPN - where to put conntrack?
> 
> Hi there,
> 
> This may be a very stupid question, but I haven't found the information 
> anywhere, so here goes - I have a working VPN client-server set-up that 
> works through an iptables masquerading NAT configuration but only for 
> one client at a time - and I need to expand it. The VPN is:
> - Server - running PPTP (poptop) on Redhat 9 connected directly to the 
> internet via iptables.
> - Client(s) - A small network of workstations (Debian, win2k, mac OSX) 
> connected to the internet with ADSL via a Debian router running iptables
> 
> doing NAT. Currently, tunnels are created from the workstations to the 
> server through the router and internet successfully, but only one 
> machine can connect at a time and I would like to improve on this.
> 
> I understand that I need to install PPTP and GRE connection tracking on 
> the Debian router...(and here's the silly question...) will the RH9 PPTP
> 
> server need conntrack too?
> 
> One further question, the ADSL connection at the client end uses PPPoA 
> with LLC - would it be possible for this to stuff up the connection 
> tracking or unlikely? And what about PPPoE? Or is it all just completely
> 
> dependent on the ISP?
> 
> Thanks,
> 
> James
> 
> 
> I should update your ppp server 
> 
> 
> 
> 
> 
> 

