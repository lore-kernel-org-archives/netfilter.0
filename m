From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Packet chain traversals
Date: Wed, 30 Oct 2002 17:22:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210301722.g9UHMEe12082@vulcan.rissington.net>
References: <Pine.LNX.4.43.0210301001370.15387-100000@netmonster.pakint.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.43.0210301001370.15387-100000@netmonster.pakint.net>
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

On Wednesday 30 October 2002 4:11 pm, Matthew G. Marsh wrote:

> > The only thing I can think of is "which interface should this packet go
> > out of", however that's certainly not the same sort of "decision" as
> > there is between PREROUTING and INPUT or FORWARD, and I'm not even sure
> > it belongs quite where it is shown...
>
> It does exist between OUTPUT and NAT. But the decision structure is more
> along the lines of rule application. Thus you can issue rules such as:
>
> ip rule add from 10.1.1.1 dev lo table mytable prio 13000
>
> and any packet coming from the local machine (ie exiting OUTPUT) would
> then be acted upon by this rule. see?

Fair enough, but I still don't think this is any sort of decision which 
affects netfilter (which would be the only point of putting it into the 
diagram, I think).

The only decisions of interest to netfilter are "is the packet local ?" and 
if not "which interface is it going out of ?".   Both of those have already 
been decided in the first routing decision, between prerouting and input / 
forward.

I'm not convinced there's any purpose in having another routing decision 
shown between output and postrouting, especially in a document which is aimed 
at beginners.

Regards,

Anton.

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III

