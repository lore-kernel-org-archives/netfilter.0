From: John Haxby <john.haxby@oracle.com>
Subject: Re: REDIRECT problem
Date: Mon, 06 Dec 2010 11:32:08 +0000
Message-ID: <4CFCC9B8.1000902@oracle.com>
References: <4C3ED61A.4050303@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C3ED61A.4050303@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 15/07/10 10:34, John Haxby wrote:
> Hello All,
>
> For some time now, I've been using REDIRECT (roughly) like this:
>
> $IPT -t nat -A PREROUTING -j proxyt
> $IPT -t nat -A proxyt -d <network> -p tcp -m tcp -k RETURN
>    (repeated lots of times for different networks)
> $IPT -t nat -A proxyt -p tcp -m tcp ! --dport 3128 -j REDIRECT 
> --to-ports 3128
>
> That works just fine: TCP connections to any network other than the 
> specific get directed to the process listening on port 3128 (which  
> then uses HTTP CONNECT on a proxy to connect to the Big Bad Internet).
>
> I use ebtables on a pair of machines running Xen to redirect traffic 
> to this machine:
>
>     +-------------+     +-------------+
>     | xen         |     |        xen  |
>     |       +---+ |     | +---+       |
>     | +---+ | P |=========| P'| +---+ |
>     | | A | +-+-+ |     | +---+ | B | |
>     | +---+   |   |     |       +---+ |
>     |         |   |     |             |
>     +---------|---+     +-------------+
>               |
>        Big Bad Internet
>
>
> Traffic from A is redirected (by ebtables) to P which has these rules 
> on it and that connection is just fine.  Traffic from B is directed to 
> P' which then forwards traffic to P over a private network and until 
> recently that worked just fine.
>
> Previously, P was running Fedora 11 with the 2.6.30.10-105.2.16.fc11 
> kernel; but now its running Fedora13 with the 2.6.33.6-147.fc13.
>
> So, previously on B I could connect to (say) google.com:80 and traffic 
> was redirect to the process listing on port 3128 via P' and the 
> private link and everything was fine.
>
> Now, unfortunately, the same connection from B is hits the REDIRECT 
> rule but the process listening on port 3128 doesn't come out of the 
> accept(2) syscall.  The same connection from A does work.  The only 
> visible difference is that traffic from A appears to come into P from 
> eth0 and traffic from B appears to come from eth1.   Inserting a LOG 
> target immediately before the REDIRECT rule shows the packet hitting 
> that REDIRECT (and one immediately after doesn't show anything so the 
> REDIRECT is definitely matching).
>
> Something seems to have changed between 2.6.30 and 2.6.33 and I'm at a 
> loss to know what.  I've looked around a bit, but so far haven't found 
> anything.
>
> Hopefully someone listening will be able to say "oh, you need to do 
> <some magic>" :-)  Or that this should never have worked in the first 
> place because of something horrible I was relying on.

In case anyone else comes looking this way, the problem commit was this one:

  commit c1cf8422f0512c2b14f0d66bce34abb0645c888a
Author: Stephen Hemminger <shemminger@vyatta.com>
Date:   Fri Feb 20 08:25:36 2009 +0000

     ip: add loose reverse path filtering

     Extend existing reverse path filter option to allow strict or loose
     filtering. (See http://en.wikipedia.org/wiki/Reverse_path_filtering).

     For compatibility with existing usage, the value 1 is chosen for 
strict mode
     and 2 for loose mode.

     Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
     Signed-off-by: David S. Miller <davem@davemloft.net>


The routing issue that I was having was that packets coming in on the 
private link, having been redirected by ebtables on the second machine, 
would be routed out on the normal connection (not shown in the diagram) 
and so they we're being dropped before the REDIRECT rule even saw them.

The required magic was to set net.ipv4.conf.default.rp_filter=2

I suspect that this is going to bite quite a few people upgrading from 
RHEL5 to RHEL6 who have previously been relying on loose reverse path 
filtering with their asymmetric routing.

jch
