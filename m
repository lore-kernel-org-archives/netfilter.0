From: "Rohit Neupane" <bikrant@wlink.com.np>
Subject: Re: Problem with TCP
Date: Wed, 1 Sep 2004 20:13:09 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <004701c49032$042c6780$630910ac@wlink.com.np>
References: <002401c4902a$74caf220$630910ac@wlink.com.np>
	<20040901141738.GF7483@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


----- Original Message ----- 
From: "Nick Drage" <nickd@metastasis.org.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, September 01, 2004 7:47 PM
Subject: Re: Problem with TCP


> On Wed, Sep 01, 2004 at 07:19:05PM +0530, Rohit Neupane wrote:
>
> <snip>
>
> > I have around 350-400 wireless clients with over 10Mbps traffic at peak
> > hours.
> > These days I have observed some abnormal behavior.
>
> <snip>
>
> > The problem is:
> > Everything works fine for about 5-10 mins then all of a suddent TCP
> > services are not accessable.  For some reason TCP times out. However
> > at the same time ping,tracerout and dns trace works without any
> > problem.
>
> I suspect you've reached some kind of maximum session count; either in
> Linux or in netfilter.  I expect you can alter this using sysctl, or
> writing directly to /proc, but unhelpfully I can't see where this is
> specifically set.
>
Yes, indeed it seems I have reached some kind of max session count. But I
don't know what it is? TCP stack/memory? I don't know.

> It might help others solve your problem if you post the result of
>
> iptstate -s -t | head
>
> here.  Or try
>
> wc -l /proc/net/ip_conntrack
I am not using conntrack at all.

>
> if "iptstate" isn't installed.  Though I'm not *that* familiar with the
> contents of ip_conntrack, someone may way to advise on a filter that
> will only show the relevant connections.
>
> -- 
> mors omnia vincit
>

Rohit

>


