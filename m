From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Fri, 17 Sep 2004 12:46:13 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040917114613.GP452@metastasis.org.uk>
References: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>
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

On Thu, Sep 16, 2004 at 09:33:03AM -0700, Hudson Delbert J Contr 61 CS/SCBN wrote:
> 
> why do this ?

There's a good set of reasons on:

http://ip-to-country.webhosting.info/

> seems a bit nasty in nature.

Depends how you use the information.  And to be honest considering the
reputation of some sources of traffic, such as Korea and South America,
which might be unlikely to have legitimate connections to your site, it
would be handy to block them all.

> we dont even do this sort of thing? see email addy...

But you're a worldwide organisation, and I think there's much more that
you can do with this than just block.  For example, has anything figured
out a way to tie this into logging rules, it would great to see which
countries I'm being attacked from.

-- 
mors omnia vincit

