From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Wrapper script for ipset listing
Date: Thu, 10 Jan 2013 16:19:06 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1301101605260.11492@blackhole.kfki.hu>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr> <50E8F495.40307@airpost.net> <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr> <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu> <50ED13BC.6010005@airpost.net>
 <20130109115232.GA19321@1984> <50EEB9DC.7070902@airpost.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50EEB9DC.7070902@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Born Without <blackhole@airpost.net>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jan Engelhardt <jengelh@inai.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 10 Jan 2013, Born Without wrote:

> On 09.01.2013 12:52, Pablo Neira Ayuso wrote:
> [...]
> 
> > Suggestion: Some explicit header with licensing terms of your script
> > is a good idea if you want to share things, otherwise the law in most
> > countries defaults to "all right reserved".
> > 
> > And if you use the same license than ipset, it may help Jozsef to
> > consider adding that to some contrib directory. Or you can just
> > publish it in your personal website.
> 
> Thank you for the suggestion.
> I wasn't even thinking of license stuff...
> This is just a simple helper script. Anybody can use it freely.
> But no problem, I'll add some license :)
> Don't know much about them.
> But I guess GPL 3 will do?

GPL 2 or 3 will do, whichever you prefer.

> Also for Jozsef, if he would consider adding it to contrib?

Yes, of course.

> One thing still is missing, to make it more foolproof, there's no checking for
> supported ipset versions (i.e v2.x) in the script.
> I only have 6.16.1 installed.
> I don't know if the -v|--version option is persistent through ipset versions.

Yes, assuming the 6.x branch. But 4.x is not developed anymore and 5.x was 
a very short lived branch. Please assume 6.x or above in your script.

In the ipset version string the first number always corresponds to the 
protocol version. The second number indicates the release number and 
sometimes there's a third number when a quick release with a very minor 
change is required. 

> I don't know if the format of the version output is persistent through ipset
> versions.

It may change partially, from this

ipset v6.14, protocol version: 6

to

ipset v7.Y, protocol versions: 6-7

> I don't know from what version the \`list' action is valid (before it was -L i
> think?).

Starting from 6.0 both syntax is valid.

> I don't know if the plain listing output (header - members) is persistent
> through ipset versions.

Yes, with the conditions I wrote previously, i.e. which prepares the 
script to accept new header lines inserted before Members or new values 
appended.
 
Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
