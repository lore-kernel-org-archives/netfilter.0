From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Performance vs. Rule Set Size
Date: Tue, 27 Jul 2004 22:35:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090982111.2010.103.camel@grendel>
References: <1090980688.22783.8.camel@dchws.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090980688.22783.8.camel@dchws.tqmcube.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: NetFilter List <netfilter@lists.netfilter.org>

On Tue, 2004-07-27 at 22:11, David Cary Hart wrote:
>
> I realize that there are too many variables to answer this question with
> great precision so consider this a reality check.

So long as you understand what you are asking. ;-)

> Our server has been under very heavy attack over the last few weeks. I
> have been adding individual hosts who try to exploit either httpd or
> smtp. I now have an input rule set of several hundred lines. Does that
> seem terribly over-sized or is that fairly common?

I've run 400+ on old P-III hardware without a problem. I know others
have gone beyond even that.

One thing you might consider is leveraging custom chains. Something
like:

iptables -N http
iptables -A FORWARD -i eth0 -p tcp --tcp-flags SYN,ACK SYN -d
192.168.1.128/27 --dport 80 -j http

replacing "-i" with your external interface and "-d" with the IPs of
your Web servers. 

Now in the http chain you block all the nasty IPs. You can then either
permit access to your Web servers within that chain, or come back to the
forward chain and keep the rule there. What ever makes life easier for
you. 

Nice thing about the above is all non-http traffic no longer has to
traverse all your blocking rules. This should help speed up processing. 

HTH,
Chris
 


