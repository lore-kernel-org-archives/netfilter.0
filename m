From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: REDIRECT,DNAT,SNAT in C
Date: 29 Jan 2003 17:33:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043858013.592.5.camel@ranjeet-linux-1>
References: <F170govcke7m99L3U600000494d@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F170govcke7m99L3U600000494d@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Thu, 2003-01-30 at 01:32, PAUL FABRICIO VILLACRESES LEON wrote:
> 
> I use libiptc for put rules in the chain FORWARD but i can't put in the 
> chain PREROUTING because, libiptc accept this target : ACCEPT, DROP, RETURN 
> and QUEUE but not DNAT ,SNAT and REDIRECT
> 
> How i can put rules programming in c for DNAT , SNAT and REDIRECT
> 

If you can give us some details about what you WANT to do, and also what
function calls you are making, then we might be able to help you.

As a starter, ACCEPT, DROP, RETURN and QUEUE are termed "built-in"
targets while DNAT, SNAT and REDIRECT target support has been added via
extensions. It may be that the functions calls you are making are
limited to the built-in targets, which are hard-coded values for some
libiptc calls. This may explain your failure.

If you can give us an outline of what you want to do, and also include
the ipt function calls you are making, I am sure someone can point out
the correct calls or the correct sequence of calls to make.

hope that helps.

-- 
Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye2 at Zultys dot com
http://www.zultys.com/

The views, opinions, and judgements expressed in this message are solely
those of
the author. The message contents have not been reviewed or approved by
Zultys.


