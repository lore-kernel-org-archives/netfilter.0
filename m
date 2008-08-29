From: "Brian Mearns" <mearns.b@gmail.com>
Subject: Re: Is p-o-m still the correct thing to use?
Date: Fri, 29 Aug 2008 08:23:05 -0400
Message-ID: <4df3a1330808290523j1f2de25bmcee66202cd64eefe@mail.gmail.com>
References: <488A7D17.4070506@gmail.com>
	 <s7sl841gefisi4k0lreotlvqbmq9kfl99u@4ax.com>
	 <488EF032.5020000@gmail.com>
	 <alpine.LNX.1.10.0807290646260.21011@fbirervta.pbzchgretzou.qr>
	 <48B744CC.6080903@gmail.com>
	 <37034.89.107.243.1.1219995640.squirrel@www.arcoscom.com>
	 <48B7CF95.2080900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=BW2auBNheen4ztZHUZkfEAhJnfa8P3feUOeBqUQ/DcA=;
        b=L1KNcDQ3g8IaEjCGbU8igXQBLWNObzZiMxtEjocVN6yUBfPxw+vpm39wqUAY8oGo0Q
         N2tKk8cEp8RVbCG546dlskbgEg4PLDgtw/pnwKVuHpq0NBMhqsHBq9yQek1Hv/p7Gty/
         rZO4b6LF2Tr0SawQ04RIpwfi+ZOUXVehLaFLI=
In-Reply-To: <48B7CF95.2080900@gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org, linux@arcoscom.com

No, I don't have any TARPIT modules in either folder. Does that means
I have to patch the kernel? because I thought xtables didn't require
that. Or is there a way to just copy it in?

Thanks,
-Brian

ArcosCom Linux User wrote:
>
> Has you the kernel module for TARPIT (look for it into kernel modules=
,
> usually into /lib/modules/$(uname -r)/kernel/net/netfilter or
> .../net/ipv4/netfilter).
>
> Or perhaps the problem was that you have the "ipt" version and the "x=
t"
> version and there is a problem with them at the same time.
>
> Regards
>
> El Vie, 29 de Agosto de 2008, 2:37, Brian Mearns escribi=F3:
>>
>> Thanks for the help Jan and Andrew. I've got xtables (combined) and =
it
>> built and installed fine. When I run iptables --version, it matches
>> what's given in the versions file in the source distribution. My pro=
blem
>> is that the TARPIT target doesn't seem to be recognized. When I try =
to
>> add a rule with the TARPIT target, it says "iptables: No
>> chain/target/match by that name". I've tried using rules that work
>> otherwise, for instance, changing from DROP to TARPIT, and it still
>> doesn't work, so it's not the rest of the rule that is the problem.
>>
>> I found libxt_TARPIT.so in /usr/local/libexec/xtables/. Is it in the
>> wrong spot or something? Also, my service runs from /sbin/iptables, =
but
>> this is soft linked to /usr/local/sbin/iptables: could this be part =
of
>> the problem? I did this so my package manager doesn't overwrite it a=
ny
>> point, but maybe it was a bad idea?
>>
>> Any help would be great.
>>
>> Thanks,
>> -Brian
>>
>> Jan Engelhardt wrote:
>>>
>>> On Tuesday 2008-07-29 06:25, Brian Mearns wrote:
>>>
>>>> Thanks a lot for the help, Andrew. The iptables source I have
>>>> doesn't have a configure script...oh, but it does have an autogen
>>>> script. I guess I was probably supposed to use that first. But it'=
s
>>>> a moot point, apparently, because of xtables, so I will be
>>>> switching to that.
>>>
>>> Released tarballs should have configure; for autogen, you usually
>>> need (even more) developer tools than you do without, like
>>> autoconf, automake, and the other autowhatevers.
>>>
>>> No moot point; iptables still is, as of today, the name of the
>>> userspace package and control program.
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
