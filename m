From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Sun, 19 Sep 2004 12:09:23 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040919110923.GB706@metastasis.org.uk>
References: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>
	<20040917114613.GP452@metastasis.org.uk>
	<414C375B.8080305@9online.fr>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <414C375B.8080305@9online.fr>
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

On Sat, Sep 18, 2004 at 03:25:47PM +0200, Pascal Vilarem wrote:
> my 2 cts :

> >Depends how you use the information.  And to be honest considering the
> >reputation of some sources of traffic, such as Korea and South America,
> >which might be unlikely to have legitimate connections to your site, it
> >would be handy to block them all.
> >
> let me disagree... youre gonna drop eberybody from one country... most 
> of them are innofensive...
> and more : the really bad guys will just have to hack a good looking 
> computer in a "good" country.
> And then they will bypass this miraculous system...

It is unlikely that blocking packets according to their source country
will be the only step in a security system, however it will filter out a
lot of the traffic that subsequent systems have to deal with.

> You will just FEEL safe but you wont be at all... and you'll just hit 
> everybody but your "target" :-\

That would be an error in the use of the system, not in the system
itself.  It's just a tool.

> It IS ab bit nasty... and more : it is blind ineffective.

No it isn't - say I've got a VPN gateway for my 1000 home users to
connect into the corporate network.  I know some of them are in Britain,
France and Germany, so I just want to permit connections from those
three countries because I know they're possibly legitimate.  I know my
employees don't live anywhere else, so I can filter out any traffic from
any other country, so reducing the attacks that the other software on
the VPN gateway has to deal with.

> >But you're a worldwide organisation, and I think there's much more that
> >you can do with this than just block.  For example, has anything figured
> >out a way to tie this into logging rules, it would great to see which
> >countries I'm being attacked from.
>
> If you're dealing with "bad guys" you'd better invest in a Intrusion
> prevention system...  start on a snort or prelude basis for example...
> then you'd be able to adapt dynamically netfilter.

That still wont' tell me which country I'm being attacked from, I'd be
interested to see if certain countries deserve the reputation they have.

As for dynamically adaprtive rules... does anyone here have experience
of using these?  Or easy or difficult is it to fake the source of an
attack and so block legitimate traffic?

> if you have to protect some data, authenticate your users/customers no 
> matter from which country they are.

Yes - this system certainly isn't a replacement for that, but then it
doesn't purport to be afaict.

Oh, and how far off-topic are we yet? ;)

-- 
mors omnia vincit

