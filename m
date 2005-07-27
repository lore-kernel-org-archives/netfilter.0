From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Netfilter and IPSec interaction
Date: Wed, 27 Jul 2005 00:18:32 -0500
Message-ID: <42E71928.7000803@riverviewtech.net>
References: <20050714122109.bl71ded9gkkoc0c4@www.milivojevic.org>
	<20050716173403.GA16509@pog.tecnopolis.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050716173403.GA16509@pog.tecnopolis.ca>
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


>(Grant, are you for sure saying you got the patches to go into 2.6.12 and 
>compile?)
>

Sorry for not getting back to you sooner, I've had a VERY busy time.

I do not recall if I compiled or not for sure because I was doing *SO* 
much to the kernel in question and trying *SO* many different versions.  
Namely I was testing to see which patches out of the IPTables 
Patch-o-Matic would apply in what combination to a few different kernel 
sources.  I had also had to apply a different patch to my kernel source 
b/c I was running it on a Cobalt RaQ 4i and had to fix the shutdown / 
restart issue with the watchdog.  As such I do not remember for sure 
that I _did_ compile the kernel.  Sorry.

What I DO know for sure is that I DID successfully apply the IPSec 
patches 1 - 4 after I went in to the info files and removed dependencies 
on previously patches.  I was not able to apply patch #1 b/c it was 
looking for a specific patch (the name eludes me at the moment).  I 
found the patch in question on the net in a mail list archive from the 
original author of the patches.  When I got to looking the (missing) 
patch was already in the mainstream kernel and thus was not available 
for patching.  So I removed the dependency on it for the IPSec-01 
patch.  Once I had removed the dependency I tested the IPSec-01 patch 
and it did apply cleanly.  Once the IPSec-01 patch was in place patches 
IPSec-02 and IPSec-03 applied cleanly.  The IPSec-04 patch did not want 
to apply stating that it was dependent on the IPSec-03 patch.  Having 
just applied the patch that IPSec-04 wanted I knew that it was there so 
I removed the dependency in the info file and was able to apply the 
IPSec-04 patch with out any problems at all.  The only thing that I 
could find wrong with the four IPSec patches was the dependency tree 
checking.  Not being a real programmer (I just hack things together when 
I have to) I don't know how to fix what is wrong, that is for others to do.



Grant. . . .

