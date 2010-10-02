From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sat, 2 Oct 2010 22:40:10 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010022229480.13529@obet.zrqbmnf.qr>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
 <4CA79133.3070608@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CA79133.3070608@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org


On Saturday 2010-10-02 22:08, Mr Dash Four wrote:
>>
>>It's absolutely up to you: currently ipset can be installed alone,
>>or as a part of xtables-addons. Jan updates xtables-addons quite
>>reqularly.
>
>I just taken the latest git from xtables-addons and it is not there.

Well give me a little leeway. It hasn't even been 24 hours since 4.4.

>>>2. I used to get the xtables .src.rpm from which to compile the
>>>code and make an installation rpm. I don't seem to be able to do
>>>that any longer as all fedora repos are too slow to update the
>>>latest changes. Do you have a link from which I could get the
>>>latest changes in ipset/xtables in src.rpm.

What is sad too is that Fedora has had so far no interest (or perhaps
just no maintainer) to take it up into the distro.

>>No, I'm not aware of the source rpm for ipset. That's bad if there's one
>>out there without refreshed.   
>
>This is a major headache for me for 2 reasons:
>
>1. I use 'rpmbuild' to compile from source as it allows me to build
>rpms for different architectures (I compile on x86_64 for i686 with
>'rpmbuild --target=xxx'). If I use 'ordinary' make there is no way
>(at least I don't know of any) I could compile for different
>architecture.

>Even if I solve problem No 2 (i.e. by tar-ing the necessary modules and
>executables) I can't see a way to get past compiling for a different
>architecture (and resolve all the dependencies)! Any ideas?

You could use the openSUSE Build Service to produce packages for
various distributions (including Fedora) and the two archs. It should
be possible to include Fedora-specific blocks in the preexisting
xtables-addons.spec too.

>2. rpmbuild also allow me to pack the necessary binaries
>(executables & modules/.ko files) for the target architecture to be
>transferred to the target machine - conveniently in rpm which could
>be installed (together with the necessary dependencies) as part of
>the target image building process.

Yeah but rpmbuild is often run in a jailed environment (for various
definitions of "jail"; ranging from simple chroot to Xen or KVM
instances), and network operations don't exactly contribute to the
idempotency of the build process that is sought.

But that should not really matter, because after a repo is done
building, you can use the regular system tools (zypper, yum) to
update, so that rpmbuild itself needs no network activity.

