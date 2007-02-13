From: "Ross Cameron" <ross.cameron@linuxpro.co.za>
Subject: Re: Tor
Date: Tue, 13 Feb 2007 10:16:17 +0200
Message-ID: <35f70db10702130016q529de1e8g5e23c6e3e5e56eaa@mail.gmail.com>
References: <45D021A6.4050805@eccotours.co.za>
Reply-To: ross.cameron@linuxpro.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45D021A6.4050805@eccotours.co.za>
Content-Disposition: inline
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
To: Brent Clark <bclark@eccotours.co.za>
Cc: netfilter@lists.netfilter.org

On 12/02/07, Brent Clark <bclark@eccotours.co.za> wrote:
> Hi all
>
> After read the following article
>
> http://chronicle.com/temp/email2.php?id=zht45qPrsddjvvgfcjwWPjxhFwqxyfVX
>
> It lead to ask / wonder about and I wanted to ask.
>
> Firstly I would like to know, how would it have have possible for them to track that Tor was been used, and more
> importantly, how on earth did they know it was the the gentleman in question.

Logging the use of TOR inside you're own network is easy, TOR only
protects you're anonymity from withing the bounds of the Internet not
a LAN.

And as for how to locate him,... a simple packet sniffing utility
could pick up TOR's signatures on the network.

>
> Other question is, how do we stop Tor from been used. Although Im for all for securing your traffic / activity etc, but
> for a corporate network, that unfortunately does not work, esp with some of the activities that the end user gets up too,

L7-filtering on IPtables should do it once you have an application
signature for TOR.

>
> Just something I was thinking.
>
> Kind Regards
> Brent Clark
>
>


-- 
________  ___ ________
  )_   ( '-,) )   _(
    )_  \_//_/  _(      Ross Cameron
      )___  ___(     	ross@goal.co.za
          ))
         ((          	http://www.goal.co.za
          ``-

