From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sat, 2 Oct 2010 23:06:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010022304210.17305@obet.zrqbmnf.qr>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
 <4CA79133.3070608@googlemail.com> <alpine.LNX.2.01.1010022229480.13529@obet.zrqbmnf.qr> <4CA79C0C.7080104@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CA79C0C.7080104@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org


On Saturday 2010-10-02 22:54, Mr Dash Four wrote:
>>Well give me a little leeway. It hasn't even been 24 hours since 4.4.
>
>Well, I know you are busy working on the latest nf_conntrack patches
>so... (-;

Am I?

>>What is sad too is that Fedora has had so far no interest (or
>>perhaps just no maintainer) to take it up into the distro.
>
>I won't miss it that as much if I could prepare the rpms myself from
>source (via make with dist-rpm target for example) - I can live with
>that.

Talk Fedora into it and become a maintainer :p

>>You could use the openSUSE Build Service to produce packages for
>>various distributions (including Fedora) and the two archs. It
>>should be possible to include Fedora-specific blocks in the
>>preexisting xtables-addons.spec too.
>
>I have a policy that I built all system-sensitive packages from
>source on one or two of my machines locally, so doing that
>externally isn't really an option for me.

You can put up a local BS instance. Of course, the same prerequisite
as for raw building applies - you need some x86_64 box to begin
building x86_64.
