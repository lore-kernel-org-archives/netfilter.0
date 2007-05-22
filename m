From: Petr Pisar <xpisar@fi.muni.cz>
Subject: Re: Bridge Transparent Proxy
Date: Tue, 22 May 2007 21:39:58 +0000 (UTC)
Message-ID: <slrnf56ope.emr.xpisar@album.ics.muni.cz>
References: <C2787F66.1C272%robert@leblancnet.us>
	<465336C4.5060600@riverviewtech.net>
	<46533842.9080404@plouf.fr.eu.org>
	<46533B98.9030706@riverviewtech.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 2007-05-22, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 05/22/07 13:36, Pascal Hambourg wrote:
>> I'm curious : why is a bridge needed for this ? Doesn't a simple router 
>> do the job as well ?
>
> No.
>
> Let me re-layout the network including IP addresses.
>
> (INet [A.B.C.Z]) --- (BRouter [A.B.C.D]) --- ([A.B.C.E] Server(s)
>                         [192.168.144.254] --- ([192.168.144.1-100])
>
> Here you can see that you have the same subnet of A.B.C.x on both sides 
> of the bridging router.  There is no good (read easy) way to have the 
> same subnet on multiple sides of a router short of double natting which 
> in and of its self is not easy to do on a singular box.
>
> So what you do is bridge the A.B.C.x traffic to both networks and route 
> the other subnet(s) as needed.
>
Or you switch on arp proxy on the public interface of router ;)

-- Petr


