From: Jason Opperisano <opie@817west.com>
Subject: Re: where list of **reserved address**??? (IP addresses can *drop*)
Date: Tue, 26 Apr 2005 14:29:13 -0400
Message-ID: <20050426182913.GA18709@bender.817west.com>
References: <1114539542.3856.12.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1114539542.3856.12.camel@seberino.spawar.navy.mil>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Apr 26, 2005 at 11:19:03AM -0700, Christian Seberino wrote:
> where list of **reserved address**??? (IP address can *drop*)
> 
> I had a list but I keep having to remove IP addresses from 
> it....either list keeps changing or my list is crap....

the source is:

  http://www.iana.org/assignments/ipv4-address-space

and yes--it's a moving target; it actually was just updated on
12Apr2005...  allocated networks get returned, unallocated networks get
allocated--such is the ebb and flow of life.

RFC 3330 (http://www.faqs.org/rfcs/rfc3330.html) has more IP addresses
that are for "special use" (hint:  don't block those cable TV's, they've
gotten on the Internet in a big way somehow).

write an app to fetch/parse the list and update your "bogon list."
speaking of that term--google for it and you'll find some folks who've
done the work for you.

-j

--
"Stewie: Mark my words, your uppance shall come."
        --Family Guy

