From: Bob McLaren <BobMcLaren@fssi-ca.com>
Subject: Re: Can't compile 1.2.11 because of dstlimit?
Date: Fri, 09 Jul 2004 12:03:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40EEEC1F.7090201@fssi-ca.com>
References: <40EB1C80.4050108@fssi-ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40EB1C80.4050108@fssi-ca.com>
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
To: netfilter@lists.netfilter.org

Bob McLaren wrote:

> ...
> I have successfully recompiled my kernel.  But now, when I attempt to 
> compile iptables, I get an error regarding "dstlimit".
> ...
>
Well, I'm closer to figuring it out...

I noticed that the ipt_dstlimit.h in my iptables source tree did not 
match the ipt_dstlimit.h in my kernel source tree.
The one in my kernel source tree does not define a "cfg" struct.  Which 
would explain the error I'm getting, but I still don't understand what I 
need to do to resolve this.

Why would both source trees have ipt_dstlimit.h files?
Why would my 2.4.20 kernel source tree have an outdated ipt_dstlimit.h file?
Can I just move my RedHat 7.3 box from 2.4.20 -> 2.6.7 without worry of 
bugs/issues?  I don't know how stable that new kernel is.




