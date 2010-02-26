From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: multicast packets
Date: Fri, 26 Feb 2010 10:47:24 +0530
Message-ID: <cfeab66d1002252117p3ecaba32l265f102d0e61a43b@mail.gmail.com>
References: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com>
	 <cfeab66d1002242238m3216eb64ice0ca627cb30fa39@mail.gmail.com>
	 <cfeab66d1002250952w58e1651dnd5c104ab10c626d1@mail.gmail.com>
	 <201002260016.03945.christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=wjzPA6R3MenbnF/B3+gOdn26yy+NzHRf/HUgbG+bbCI=;
        b=uoTNKnP5Gygrc7vkKWCzk8+COHC5dTycBlcdrYp+NJwVrjujzSiwb924wR/DmKhKO8
         NXeUbmH0pFJRhcz+ev0RrD4/AF82hNafVPu4ReL+gf3ODN0wblNXv4eqhDynvMeZFZLc
         qAH+hOlwdxqcqxZY4kmTfSDvShYHS17lD3jXA=
In-Reply-To: <201002260016.03945.christoph.paasch@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

> >>What are the policies of your chains?

INPUT  policy is DROP
=46ORWARD policy is DROP
OUTPUT policy is accept

>> What is your ruleset?

INPUT chain
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT  -i eth0  -j ACCEPT


=46ORWARD
iptables -A FORWARD  -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT  -i eth0  -o eth1 -j ACCEPT


>>>>>>>> What is your topology?

machine                    Gateway machine B
   A -------------------->eth0              eth1 -------------> interne=
t

I have a machine A . which is connected to a linux gateway machine .
Ruleset and policy mentioned are for machine B . There is no iptables
rules in machine A .

>>>>>>>>>What do you want to achieve ?

As per the current rule , no igmp packet should come to GATEWAY
machine , since there is no firewall hole in input chain .

>>>>>>>>>>what are you observing?

But i can see , igmp packets flowing into machine B from internet .


Thanks,
Ratheesh




On Fri, Feb 26, 2010 at 4:46 AM, Christoph Paasch
<christoph.paasch@gmail.com> wrote:
> Please, provide more information about your setup.
>
> What are the policies of your chains? What is your ruleset?
> What is your topology?
> What do you want to achieve, and what are you observing?
>
> Christoph
>
>
> On Thu 25 February 2010 wrote ratheesh k:
>> iptables -A INPUT -m state --state ESTABLISHED,RELATES -j ACCEPT .
>>
>> This is the only rule . No firewall hole for igmp packets .
>>
>> On Thu, Feb 25, 2010 at 12:08 PM, ratheesh k <ratheesh.ksz@gmail.com=
> wrote:
>> >>>>>>>>>>udp doesn't go into the established state.
>> >
>> > I am running "igmpproxy" on my gateway box . I didnot add any rule=
 in
>> > INPUT chain to accept igmp packets . But =A0i hve a rule to accept=
 all
>> > ESTABLISHED state packets . It am able to stream igmp from my desk=
top
>> > .
>> >
>> > I really believe that " We dont need any rule in FORWARD chain " .
>> > Because packets are flowing from node to node and routed . So only
>> > INPUT and OUTPUT chains are involved .
>> >
>> > Thanks,
>> > Ratheesh
>> >
>> >
>> >
>> > On Thu, Feb 25, 2010 at 12:03 AM, Christoph Paasch
>> >
>> > <christoph.paasch@gmail.com> wrote:
>> >> As long as there isn't any return-traffic (as it is the case for
>> >> multicast- udp), udp doesn't go into the established state.
>> >>
>> >> Regards,
>> >> Christoph
>> >>
>> >> On Wed 24 February 2010 wrote ratheesh k:
>> >>> multicast packets are udp packets . But its flowing only from
>> >>> upstream to downstream . So packet state will be always "NEW" . =
??
>> >>>
>> >>> my question is : whether we can see multicast data packets in
>> >>> ESTABLISHED state ??
>> >>>
>> >>> Thanks,
>> >>> Ratheesh
>> >>> --
>> >>> To unsubscribe from this list: send the line "unsubscribe netfil=
ter" in
>> >>> the body of a message to majordomo@vger.kernel.org
>> >>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.=
html
>> >>
>> >> --
>> >> Christoph Paasch
>> >>
>> >> Alcatel-Lucent
>> >> IP Development
>> >>
>> >> www.rollerbulls.be
>> >> --
>> >> --
>> >> To unsubscribe from this list: send the line "unsubscribe netfilt=
er" in
>> >> the body of a message to majordomo@vger.kernel.org
>> >> More majordomo info at =A0http://vger.kernel.org/majordomo-info.h=
tml
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
> --
> Christoph Paasch
>
> Alcatel-Lucent
> IP Development
>
> www.rollerbulls.be
> --
>
