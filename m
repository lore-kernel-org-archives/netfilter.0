From: Michael <mutk@iprimus.com.au>
Subject: Re: forward is not forwarding
Date: Fri, 06 Sep 2002 19:09:30 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7870CA.4010803@iprimus.com.au>
References: <EF33C96B91C212479FA2B0B0A96868F80102C887@sydxch02.veritas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: IPtables Users <netfilter@lists.samba.org>

Abraham Kim wrote:

> Dear Stewart, Chris, Steve, and many others...
>  
> Thanks for giving me help on this.
> <snip>
>  
> I know it does not quite fit to this mailing list, but could anyone
> shout at me if you had similar experience and a tip together?

I'll bet it's the classic DNS problem in Linux.
Add the solaris machine's name to /etc/hosts on Linux.

Or if the machines you are connecting to are on DNS, make the Linux 
system can DNS the machines properly

Cheers,
Michael


