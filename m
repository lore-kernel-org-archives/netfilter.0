From: Jason Opperisano <opie@817west.com>
Subject: Re: ram and processor cycles for a firewall machine
Date: Fri, 01 Oct 2004 09:37:13 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096637833.22962.36.camel@wolfpack.ljm.dom>
References: <a0f69e504093023354ec7c59e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e504093023354ec7c59e@mail.gmail.com>
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

On Fri, 2004-10-01 at 02:35, Askar wrote:
> hi all,
> im in the process of changing my fw machine for that atm im simulating
> and testing. I got a very fair question
> 1) How much RAM and and processor would be best for moderate firewall box?
> Unfortunatly currently my company running the fw on a P-III 500MHz
> with 128MB of RAM.
> I am wondering if I change to default DROP things (atm its default
> ACCEPT) aren't these specification kinda makes problem?
> 
> right now 75 users online the /proc/net/ip_conntrack shows 
> 
> egrep 'ESTABLISHED|ASSURED' /proc/net/ip_conntrack | wc -l
>    4888
> cat /proc/net/ip_conntrack | wc -l
>    6511

(6511 * 360) / 1024 / 1024 = 2.235 MB

even if you need 5 times that number of conntrack entries at peak
load--you still would require about 11 MB of kernel memory for conntrack
entries.

if you machine has 128 MB RAM--the automatic setting for
ip_conntrack_max should be somewhere around 8192.  you could easily bump
that number up to 32768 or 65536.

keep in mind that this is *kernel* memory; and therefore, cannot be
paged.  if the machine needs to do "other things" (which is not a good
idea) you may want to bump up the memory just to be safe.

> well these number would probably little higher when 120 users online.
> Is my current fw machine specs adequate for such ip_conntrack load?

i would say so.  one thing that you might want to keep in mind is that
if going to a "default drop" is going to cause a huge amount of logging,
you might want to use the "-m limit" match in your "-j LOG" rules and
make the rotation of your log files more aggressive.

-j

-- 
Jason Opperisano <opie@817west.com>


