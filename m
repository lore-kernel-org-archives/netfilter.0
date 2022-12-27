From: "ad^2" <adsquaired@gmail.com>
Subject: Re: nftables tutorial for dummies?
Date: Tue, 27 Dec 2022 08:41:36 -0500
Message-ID: <CAPdGaa3ktU_XHJFS9cUOr8G7hNzpzp0r8xbmrbRvxE-vDVrEjg@mail.gmail.com>
References: <47d2afb3-7911-a903-d36b-6b231b4524a2@zoho.com>
 <c22a1be1-c761-d5fe-13d9-9896c9e79fbd@gmx.com> <5b6be8b3-341e-f8ec-dd65-6cd235f8de4f@zoho.com>
 <DM8PR06MB7717024A696385FE163875FCF9E99@DM8PR06MB7717.namprd06.prod.outlook.com>
 <c3debeb6-d12f-cbde-c32d-7862496d388c@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYa5W357Nge22LDOTpL26OlGLekCFhbp1ABzFYp/o4c=;
        b=O2peYKtxYnYEbv7IJjUV8SDbF/XF4IR3rrkcJxZxSsurPuYq5JTw3X/XLo2OZhZapu
         0iC5e8qzUzw6H7VT75KkkfI0N7GdZj1lxEIEtEcvQLMEdZ3pkkfpnCtZ3SRc7SicMpGi
         bdHvBlSFgihNtp8Dh4tZBb3vjY3KDigE2A2Vvp2zkTct9oUr6dkCQn8OqCchU3/bLJGq
         j5k7QehwF+wofXZZBbKcybKI9uiXpcM5TOeedRLyjrR0Cf3t3QkDcdNfzNuLIjol/WpD
         3kGjUiKT3AyyN7XGkoDUarMvZt7uYzvxx933IUsx/nYp8DG1IRzBxLC5GAHFi0qXP18A
         7/8w==
In-Reply-To: <c3debeb6-d12f-cbde-c32d-7862496d388c@zoho.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ToddAndMargo <ToddAndMargo@zoho.com>
Cc: "Atkins, Brian" <Brian.Atkins@netapp.com>, =?UTF-8?B?TGFycyBOb29kw6lu?= <lars.nooden@gmx.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I would be willing to create / contribute to "dummies" documentation
if we had a place to host it. Unless the wiki has been updated in the
past year, I feel it could use more detailed instructions for common
scenarios. I admit when first getting started with nftables it was a
little time consuming trying to figure out rules for things I wanted
to do. Even with experience using iptables. A little more hand holding
could be helpful for newcomers and people making the transition. If
there was a direct comparison between iptables rules and nftables
rules in the help the transition process would be faster and smoother
IMO. Of course, there are many scenarios and applications but we could
start off with the basics and build from there. I'm by no means an
expert (more like a beginner) but I have migrated from iptables to
nftables in production using maps, prerouting and postrouting chains.
I'm just looking to provide help in my spare time.

Thanks in advance.




On Fri, Dec 23, 2022 at 10:05 PM ToddAndMargo <ToddAndMargo@zoho.com> wrote=
:
>
> On 12/23/22 09:02, Atkins, Brian wrote:
> > I found one of the best ways to understand what's happening is to use t=
racing (https://wiki.nftables.org/wiki-nftables/index.php/Ruleset_debug/tra=
cing) .  You can see the traffic move through the chains and rules and get =
a better understanding of how your matching is or isn't working.  I often j=
ust set it on my input chain, or on another chain where I want to focus; yo=
u don't have to use a pre-routing chain unless you need to catch the traffi=
c earlier.
>
> Thank you!
>
