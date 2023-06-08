From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: IPv4 Evil Bit
Date: Thu, 8 Jun 2023 05:56:51 -0400
Message-ID: <CAPJdpdDmefpLPymDWfcetponZCht06ABBQUa9V-W-pm8ysWgWw@mail.gmail.com>
References: <20230607131743.309d5aff@parrot> <CAPJdpdCeuST=ac0K5oQQq=THOPZqnXESQivLqMK0yDRfq3ZeoA@mail.gmail.com>
 <20230608095839.076d212d@parrot>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686218222; x=1688810222;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1MgDK5UR0V68Uu79BbiEWsbNJVdd9vL3lquawcdsw4=;
        b=Xl01S1WsEr+ZfA6kCegZ6iiORO09zkqahWOvihMsjhukXX56+FAV+PVv5Mw7UN82zy
         0vu7AgX9aTlCbmO0GAOX0HoRE6OVd7FJTjyIeC6lI83o21QyvNByRVp43ArCZh6p8zX/
         70CS5m3l1rk4NlCDaD4JVKH7Gdp2gWlumgHy3gjqN9M9djgJKUEHJwsAmP4a4smICGDb
         9sTAK9wLPZr3tKp1Kt1hEAUzbW6aeoWVcdNsst724x94KwQuKWJuPjxdsj2Ys6qLLxOq
         i+3zalk69q4XM+8RUYNsbAv4eChdeVMvrMmD2wq6ZuoOVuNiEegxskwVX0ABcOITzyU6
         Ne5g==
In-Reply-To: <20230608095839.076d212d@parrot>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Thu, Jun 8, 2023 at 3:57=E2=80=AFAM Marek K=C3=BCthe <m-k-mailling-list@=
mk16.de> wrote:
>
> On Wed, 7 Jun 2023 10:38:23 -0400
> Paul Robert Marino <prmarino1@gmail.com> wrote:
>
> > Answering the first question i think you may be looking for sets
> > https://wiki.nftables.org/wiki-nftables/index.php/Sets
>
> Thanks for the answer. Is there a possibility to combine sets (i.e. to
> perform a kind of merge)?
> iifname @dnet_interfaces oifname {
> @client_interfaces, @dnet_interfaces } goto dnet_forward;
>
> >
> > As for the second one RFC3514 implementing that is a bad idea for a
> > number of reasons which is why as far as I know nothing implements it,
> > it's too easy for a bad actor to take advantage of. In fact it was
> > actually an april fools joke RFC. There are a lot of those and some
> > people confuse them as being legitimate but they are not. if you see
> > an RFC with a publish date of April 1st any year don't take it
> > seriously.
> > AGAIN I CAN NOT STRESS THIS POINT ENOUGH THAT RFC (RFC3514 ) WAS
> > WRITTEN AS AN APRIL FOOLS JOKE!!!!!.
>
> I know this RFC is intended as an April Fool's joke. However, I would
> like to see how many requests I get with the Evil Bit. And how many
> requests I forward for the dn42 with the Evil Bit.
>
> How could a malicious actor have the advantage if I log this bit? Or do
> you mean that I shouldn't rely on malicious requests having that bit?
>
> "Inspired" me to this idea was
> https://blog.benjojo.co.uk/post/evil-bit-RFC3514-real-world-usage.

Yes I read this Blog too right after your first email, but I
interpreted it very differently.
He points out that yes you could actually implement it and he makes an
argument on how in theory you could implement it to prevent scanners
from scanning a port but it's a flawed argument.
A better argument he missed is if you know the upstream firewall
supports it a network sniffer or security endpoint software could flip
it to inform the firewall to block it, but this too is a flawed
argument.
I interpreted he was making a related joke but, if not then I would
interpret it as he actually didn't fully get the joke in the RFC, and
or is too naive on the subject of how port scanners actually work to
know why his theory is mostly pointless. What he actually pointed out
in the blog page is a large number of companies that have a huge
vulnerability, and he probably should have tried to submit some bug
bounties.

Here are a few reasons why implementing this bit for any reason other
than logging is a bad idea.
1) It will only work if the firewall the sender is going through
blocks on this bit on outbound and or established connections which is
a huge unlikely if. I can tell you from  pentesting experience this
wouldn't stop any of the tools I've used from picking up the port. An
nmap xmas scan is legitimately evil and won't care if you set the evil
bit to true https://nmap.org/book/scan-methods-null-fin-xmas-scan.html

2) Any firewall that blocks based on the evil bit is a denial of
service liability because all someone would need to do is infect an
upstream switch, router, transceiver, or firewall  with a worm or some
other malware that flips the bit on for all connections that pass
through it and your firewall will deny service and it will be very
difficult to figure out especially since standard tools like wireshark
ignore it.

3) Malware or an office prankster on windows could change a registry
entry to turn the bit on on all outbound connections, and it's not
much harder to do on Linux, BSD or MacOS either, so from a customer or
users perspective you would be blocking them and others wouldn't be.
Try explaining that to your largest customer or your CEO, etc. that
your firewall is denying them service because it complies with an
April fools joke and let me know how it goes lol.

The truth is I never thought to test for this but if i'm ever
conducting a pentest of a company again and I find their firewall
implements this April fools joke I will fail them on it, that said
logging if you see it is not a bad idea as it may indicate something
wrong with a client or piece of network equipment so i wouldn't fail
them for logging when they see it, but blocking on it is a potential
business continuity issue because the eas of which it can be exploited
and the difficulty to detect if it were exploited.
