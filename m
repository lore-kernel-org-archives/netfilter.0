From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Problem with TCP
Date: Wed, 1 Sep 2004 15:17:38 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040901141738.GF7483@metastasis.org.uk>
References: <002401c4902a$74caf220$630910ac@wlink.com.np>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002401c4902a$74caf220$630910ac@wlink.com.np>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Sep 01, 2004 at 07:19:05PM +0530, Rohit Neupane wrote:

<snip>

> I have around 350-400 wireless clients with over 10Mbps traffic at peak
> hours.
> These days I have observed some abnormal behavior.

<snip>

> The problem is:
> Everything works fine for about 5-10 mins then all of a suddent TCP
> services are not accessable.  For some reason TCP times out. However
> at the same time ping,tracerout and dns trace works without any
> problem.

I suspect you've reached some kind of maximum session count; either in
Linux or in netfilter.  I expect you can alter this using sysctl, or
writing directly to /proc, but unhelpfully I can't see where this is
specifically set.

It might help others solve your problem if you post the result of 

iptstate -s -t | head 

here.  Or try 

wc -l /proc/net/ip_conntrack

if "iptstate" isn't installed.  Though I'm not *that* familiar with the
contents of ip_conntrack, someone may way to advise on a filter that
will only show the relevant connections.

-- 
mors omnia vincit

