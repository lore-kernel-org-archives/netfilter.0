From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sat, 02 Oct 2010 21:54:36 +0100
Message-ID: <4CA79C0C.7080104@googlemail.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu> <4CA79133.3070608@googlemail.com> <alpine.LNX.2.01.1010022229480.13529@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=mgC05rkVva25mc5MLaPcB1u51YJ7khg3szv63OMuVeU=;
        b=buibECrNZ1sD6AHsLyytM9LMxvk8Z2v50qWQ4oqBLkYiK29LjIy3y/ho02WcM359Uh
         05LK76ob2KlJiHWytWxw7Rj4ui3o1cyDeANS+TP3ejOyxFm62HuXG+IjDFzVxkscL8hl
         +mhBG4SB4Ezn3U9RBPLPc/HMiVKio4MQMtBYs=
In-Reply-To: <alpine.LNX.2.01.1010022229480.13529@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org


> Well give me a little leeway. It hasn't even been 24 hours since 4.4.
>   
Well, I know you are busy working on the latest nf_conntrack patches 
so... (-;


> What is sad too is that Fedora has had so far no interest (or perhaps
> just no maintainer) to take it up into the distro.
>   
I won't miss it that as much if I could prepare the rpms myself from 
source (via make with dist-rpm target for example) - I can live with that.


>> Even if I solve problem No 2 (i.e. by tar-ing the necessary modules and
>> executables) I can't see a way to get past compiling for a different
>> architecture (and resolve all the dependencies)! Any ideas?
>>     
>
> You could use the openSUSE Build Service to produce packages for
> various distributions (including Fedora) and the two archs. It should
> be possible to include Fedora-specific blocks in the preexisting
> xtables-addons.spec too.
>   
I have a policy that I built all system-sensitive packages from source 
on one or two of my machines locally, so doing that externally isn't 
really an option for me.


> But that should not really matter, because after a repo is done
> building, you can use the regular system tools (zypper, yum) to
> update, so that rpmbuild itself needs no network activity.
>   
If I could compile and, at least, build the binaries in one single 
package (be it rpm, tar.gz or similar) so that they can be installed 
during my kickstart I would be happy with that.

As a last option I could compile the source on i686 environment (for 
i686 machine to be installed on), but I definitely need a complete 
package (in rpm, tar.gz etc - as I already pointed out) so that I could 
transfer it for my kickstart to unpack and install when building the 
update image. That's my dilemma at present.

