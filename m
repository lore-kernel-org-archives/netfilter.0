From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: RE: [ANNOUNCE] ipset-2.2.9 released
Date: Thu, 11 May 2006 15:35:28 -0700
Message-ID: <BAY106-F22C1E316E8ECC9F51B39CCD6AF0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>- 'limit' module parameter added to the kernel modules of the
>   iphash, ipporthash, nethash and iptree type of sets so that
>   the maximal number of elements can now be limited

By amazing coincidence, I was just looking into adding a "--limit" argument 
to ipset iphash, nethash, ipporthash, and iptree sets when I saw this 
announcement.

I have now applied the change I was working on on top of 2.2.9 and the 
results of my testing have been positive.  With my change, the user can 
specify what they want the limit to be per set at set creation time, with 
the maximum being whatever the "limit" argument of the module is defined to 
be.  Also, an ipset -L will now list the effective limit and the current 
count.

I would be very glad if my changes (or corrected/improved version thereof) 
were folded into the next ipset release.  Where should I post my changes 
(e.g. this list? the developers' list or...) and in what format (all of the 
affected source files as attachments or in a tar file or as patch files 
or...)?

Thanks,

- Andrew Kraslavsky

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


