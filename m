From: Pascal Vilarem <pvilarem-ml@9online.fr>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Sat, 18 Sep 2004 15:25:47 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <414C375B.8080305@9online.fr>
References: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>
	<20040917114613.GP452@metastasis.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Cc: pvilarem-ml@9online.fr

my 2 cts :

Nick Drage wrote:

>On Thu, Sep 16, 2004 at 09:33:03AM -0700, Hudson Delbert J Contr 61 CS/SCBN wrote:
>  
>
>>why do this ?
>>    
>>
>
>There's a good set of reasons on:
>
>http://ip-to-country.webhosting.info/
>
>  
>
good set of reasons... but none of these is a good reason :-)

>>seems a bit nasty in nature.
>>    
>>
>
>Depends how you use the information.  And to be honest considering the
>reputation of some sources of traffic, such as Korea and South America,
>which might be unlikely to have legitimate connections to your site, it
>would be handy to block them all.
>
>  
>
let me disagree... youre gonna drop eberybody from one country... most 
of them are innofensive...
and more : the really bad guys will just have to hack a good looking 
computer in a "good" country.
And then they will bypass this miraculous system...

You will just FEEL safe but you wont be at all... and you'll just hit 
everybody but your "target" :-\

It IS ab bit nasty... and more : it is blind ineffective.

>>we dont even do this sort of thing? see email addy...
>>    
>>
>
>But you're a worldwide organisation, and I think there's much more that
>you can do with this than just block.  For example, has anything figured
>out a way to tie this into logging rules, it would great to see which
>countries I'm being attacked from.
>
>  
>
If you're dealing with "bad guys" you'd better invest in a Intrusion 
prevention system...
start on a snort or prelude basis for example... then you'd be able to 
adapt dynamically netfilter.

if you have to protect some data, authenticate your users/customers no 
matter from which country they are.

grtx.


