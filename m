From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Sun, 19 Sep 2004 12:09:53 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a0409190209416c12b9@mail.gmail.com>
References: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>
	<20040917114613.GP452@metastasis.org.uk>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040917114613.GP452@metastasis.org.uk>
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

On Fri, 17 Sep 2004 12:46:13 +0100, Nick Drage <nickd@metastasis.org.uk> wrote:
> On Thu, Sep 16, 2004 at 09:33:03AM -0700, Hudson Delbert J Contr 61 CS/SCBN wrote:
> >
> > why do this ?
> 
> There's a good set of reasons on:
> 
> http://ip-to-country.webhosting.info/
> 
> > seems a bit nasty in nature.
> 
> Depends how you use the information.  And to be honest considering the
> reputation of some sources of traffic, such as Korea and South America,
> which might be unlikely to have legitimate connections to your site, it
> would be handy to block them all.
> 

I don't like this reason at all, but let me agree with you temporarily.
What if a client with good reputation "ie, from your country :-)" is
spending his vacation in South America, and wanted to check something
in your website ??

> > we dont even do this sort of thing? see email addy...
> 
> But you're a worldwide organisation, and I think there's much more that
> you can do with this than just block.  For example, has anything figured
> out a way to tie this into logging rules, it would great to see which
> countries I'm being attacked from.
> 
> --
> mors omnia vincit
> 
> 



-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

