From: Laine Stump <laine@laine.org>
Subject: Re: [libvirt] [PATCH v3] nwfilter: probe for inverted ctdir
Date: Thu, 28 Mar 2013 10:36:29 -0400
Message-ID: <5154556D.5050008@laine.org>
References: <514CC114.8090508@linux.vnet.ibm.com> <51518DB3.7070505@linux.vnet.ibm.com>	<51531EB2.4070102@laine.org> <515333F3.4020001@redhat.com> <51539861.1000209@linux.vnet.ibm.com> <51542545.2050301@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=/MemPLOkttpsakPmeQDC80ptjUlZncaMe9rL+H0qiKY=;
        b=LqZgpeRSDjcQLl1NcsjMnxGETgbyGPy3qjMJON9xXIQhgdlsQXd3TrAUe9Cpk2/1io
         To3WmTsrgQ5kw94lwqTqGyqRe88guLIHxtB8Y0DSpa+pSecHxNCLrOxB9ZBrUld8B2Vr
         fSRxaUeT8cw7zkjuHLVg/HEdDPPpXSzekggldDvG33ZrbXJN0rfpHUNul0SQh7voSjij
         tAJyqMFfC5SowI/Y5tQKhJ/C7k7ywiCpMKVQu50qGLPEzUA94hhzI2gBf71Fz+x0Wi6Q
         BJJsvQAyeqw5dBt6hJr7BXWwaHlwE+2ObrKjs1zwOOsVkY6NKVynKoHIHedBLxX4qxtg
         LHVg==
In-Reply-To: <51542545.2050301@linux.vnet.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: Eric Blake <eblake@redhat.com>, libvirt <libvir-list@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

For reference of people new to this thread, here is the start of the thread:

  https://www.redhat.com/archives/libvir-list/2013-March/msg01403.html

This concerns changes to libvirt to cope with the newly discovered (by
us :-) difference in interpretation of ctdir by different versions of
netfilter.

On 03/28/2013 07:11 AM, Stefan Berger wrote:
> On 03/27/2013 09:09 PM, Stefan Berger wrote:
>> On 03/27/2013 02:01 PM, Eric Blake wrote:
>>> On 03/27/2013 10:30 AM, Laine Stump wrote:
>>>> My opinion is that the patch we should apply should be a simple patch
>>>> that just removes use of --ctdir. According to the netfilter developer
>>>> who responded to the thread on libvirt-users, it doesn't add any extra
>>>> security not already provided by conntrack:
>>>>
>>>> https://www.redhat.com/archives/libvirt-users/2013-March/msg00121.html
>>>> https://www.redhat.com/archives/libvirt-users/2013-March/msg00128.html
>>>>
>>>> Not being an expert on netfilter internals, I can't dispute his claim.
>>>>
>>>> Does anyone else have an opinion?
>>> What filters specifically caused the use of --ctdir, and are they
>>> broken
>>> if we omit the use of --ctdir?
>>
>> It depends on how you write the filters that the --ctdir is being used.
>>
>> iirc: The effect of the --ctdir usage is that if one has an incoming
>> rule and and outgoing rule with the same IP address on the 'other'
>> side the check for an ESTABLISHED state is not enough to ACCEPT the
>> traffic, if one was to remove one of the rules while communication in
>> both directions was occurring and an immediate cut of the traffic in
>> one way was expected. The effect so far was that if the rule for the
>> incoming rule was removed it would cut the incoming traffic
>> immediately while the traffic in outgoing direction was
>> uninterrupted. I think that if we remove this now the traffic in both
>> directions will continue. I will verify tomorrow.
>
> Verified. I have a ping running from the VM to destination 'A' and
> from 'A' to the VM. The --ctdir enforces the direction of the traffic
> and if one of the following rules is removed, the ping is immediately
> cut.
>
>   <rule action='accept' direction='out' priority='500'>
>     <icmp/>
>   </rule>
>   <rule action='accept' direction='in' priority='500'>
>     <icmp/>
>   </rule>
>
> The ping is not cut anymore upon removal of one of the above rules if
> --ctdir was to be removed entirely.

Okay, as I understand from your description, the difference is that when
a ping in one direction is already in action, and you remove the rule
allowing that ping, that existing ping "session" will continue to be
allowed *if* there is still a rule allowing pings in the other
direction. Is that correct? I'm guessing that *new* attempts to ping in
that direction will no longer be allowed though, is that also correct?

For the benefit of Pablo and the other netfilter developers, can you
paste the iptables commands that are generated for the two rules above?
Possibly they can suggest alternative rules that have the desired effect.

If they have no alternatives, then I do now agree that we shouldn't just
scrap --ctdir. Then we have two choices:

1) take your patch, which hopefully will successfully guess the polarity
of --ctdir correctly in all cases.

2) switch unconditionally to the new "correct" polarity of --ctdir,
release-note the heck out of it, and require that any distro with a
kernel old enough to have the old style --ctdir backport at least the
one patch to netfilter to change that.

My comments about (1): while I'll again say that the patch truly is
poetic in its ability to overcome obstacles, it's really a workaround
for a bug, and as time goes on will become less and less relevant (and
more and more difficult to explain/rationalize). I really think I would
prefer to be broken on very old distros rather than have that patch in
the tree (although others may have a different opinion, and I would
gracefully withdraw my objection in that case).

About (2): Fedora at least as far back as F16 has a new enough
kernel/iptables (iptables-1.4.12) that it uses the new polarity for
--ctdir, and no older Fedora is supported. RHEL6 and CentOS6 still have
iptables-1.4.7, so they have the old polarity. I'd be willing to bet
that RHEL6 would take the netfilter patch to change --ctdir; of course
that would leave us with temporary brokenness for anybody who upgraded
their kernel without upgrading libvirt, or vice-versa.

(That temporary breakage has me a bit concerned, actually, and may
mandate a patch like yours, at least applied downstream-only for
RHEL/CentOS builds of libvirt.)

Can maintainers for other distros comment on the version of iptables
their distros have in all releases still being supported? It would be
good to know just who would be broken by changing this (and who would be
fixed, of course)

