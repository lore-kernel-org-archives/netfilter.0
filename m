From: Jason Opperisano <opie@817west.com>
Subject: Re: Transparent Remote Proxy Server
Date: Tue, 28 Sep 2004 09:44:41 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096379081.2330.17.camel@wolfpack.ljm.dom>
References: <666183F7-0DA7-11D9-99BA-000A95C71776@freezone.co.uk>
	<41546F23.2010601@pbl.ca>
	<9B51275E-10B2-11D9-9099-0003931DA24A@freezone.co.uk>
	<41586A3A.5060901@pbl.ca> <1096313839.16814.63.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096313839.16814.63.camel@wolfpack.ljm.dom>
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

On Mon, 2004-09-27 at 15:37, Jason Opperisano wrote:
> keep in mind that a side-effect of the REDIRECT "magic" is that the SYN
> does not go to; nor does the SYN-ACK come from, wum's IP address (as was
> evident from the tcpdump snippet provided).
> 
> with the REDIRECT target, wum will pretend to be the destination web
> server from the perspective of the client and tor.
> 
> all this being said--i couldn't tell from the OP why things weren't
> working.
> 
> tcpdump anywhere and everywhere and you'll find the culprit.
> 
> -j

hmmm...along those same lines--i just had a thought.  is it possible
that "rp_filter" on tor is blocking the packets from wum because "-j
REDIRECT" is making wum spoof the address of the destination web server?

on tor, check:

        sysctl -a | grep '\.rp_filter'
        sysctl -a | grep log_martians
        
try either (a) setting rp_filter=0 on the interface on tor that is
connected to wum, or (b) leave rp_filter=1 and set "log_martians=1" on
that interface on tor to see if rp_filter is; in fact, the culprit.

just a thought.

-j 

=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~
I'd horsewhip you if I had a horse. -- Groucho Marx
=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~


