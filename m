From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: multicast packets
Date: Fri, 26 Feb 2010 12:20:57 +0530
Message-ID: <cfeab66d1002252250h46989089n2bd68be274123e71@mail.gmail.com>
References: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com>
	 <201002260016.03945.christoph.paasch@gmail.com>
	 <cfeab66d1002252117p3ecaba32l265f102d0e61a43b@mail.gmail.com>
	 <201002260741.43169.christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=2ootnfS9hBg1Fy+NLil2a3Aya81PVP9Km1w4rmGxa6M=;
        b=xcRqHQ+kwN5jwLtm+VpqYtEZWST93fD4n6/NuKI13e/wQilrxUAmJzFKczd+lKQJ/N
         hAZ6PMmCqP9FLZi95Xr7JcqogMlGi1tSregrm0s9PS2pFOgkswbS0G0rY71RJWEeDIsg
         ikCqZb2jQLsgSDnV0sD3rJV9vOBupOGrgA4jk=
In-Reply-To: <201002260741.43169.christoph.paasch@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I am running  igmp stream  client to stream igmp packets on machine A
from internet .I can play files .

note : Is igmpproxy running machine B has anything to do with this  ?



On Fri, Feb 26, 2010 at 12:11 PM, Christoph Paasch
<christoph.paasch@gmail.com> wrote:
>
> On Fri 26 February 2010, ratheesh k wrote:
>> INPUT =A0policy is DROP
>> FORWARD policy is DROP
>> OUTPUT policy is accept
>>
>>
>> INPUT chain
>> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> iptables -A INPUT =A0-i eth0 =A0-j ACCEPT
>>
>>
>> FORWARD
>> iptables -A FORWARD =A0-m state --state ESTABLISHED,RELATED -j ACCEP=
T
>> iptables -A INPUT =A0-i eth0 =A0-o eth1 -j ACCEPT
> I imagine that this is a typo and that you meant the FORWARD chain.
>
>>
>> machine =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Gateway machine B
>> =A0 =A0A -------------------->eth0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eth1 -=
------------> internet
>>
>> I have a machine A . which is connected to a linux gateway machine .
>> Ruleset and policy mentioned are for machine B . There is no iptable=
s
>> rules in machine A .
>>
>> >>>>>>>>>What do you want to achieve ?
>>
>> As per the current rule , no igmp packet should come to GATEWAY
>> machine , since there is no firewall hole in input chain .
>>
>> >>>>>>>>>>what are you observing?
>>
>> But i can see , igmp packets flowing into machine B from internet .
> Where can you see these igmp packets? With wireshark/tcpdump? If it i=
s one of
> those, than it is normal, because these capture the packets before th=
e
> iptables filter.
>
> Seen your ruleset, the packets should not enter, if they are coming f=
rom the
> internet.
>
> Regards,
> Christoph
>
>> On Fri, Feb 26, 2010 at 4:46 AM, Christoph Paasch
>>
>> <christoph.paasch@gmail.com> wrote:
>> > Please, provide more information about your setup.
>> >
>> > What are the policies of your chains? What is your ruleset?
>> > What is your topology?
>> > What do you want to achieve, and what are you observing?
>> >
>> > Christoph
>> >
>> > On Thu 25 February 2010 wrote ratheesh k:
>> >> iptables -A INPUT -m state --state ESTABLISHED,RELATES -j ACCEPT =
=2E
>> >>
>> >> This is the only rule . No firewall hole for igmp packets .
>> >>
>> >> On Thu, Feb 25, 2010 at 12:08 PM, ratheesh k <ratheesh.ksz@gmail.=
com>
> wrote:
>> >> >>>>>>>>>>udp doesn't go into the established state.
>> >> >
>> >> > I am running "igmpproxy" on my gateway box . I didnot add any r=
ule in
>> >> > INPUT chain to accept igmp packets . But =A0i hve a rule to acc=
ept all
>> >> > ESTABLISHED state packets . It am able to stream igmp from my d=
esktop
>> >> > .
>> >> >
>> >> > I really believe that " We dont need any rule in FORWARD chain =
" .
>> >> > Because packets are flowing from node to node and routed . So o=
nly
>> >> > INPUT and OUTPUT chains are involved .
>> >> >
>> >> > Thanks,
>> >> > Ratheesh
>> >> >
>> >> >
>> >> >
>> >> > On Thu, Feb 25, 2010 at 12:03 AM, Christoph Paasch
>> >> >
>> >> > <christoph.paasch@gmail.com> wrote:
>> >> >> As long as there isn't any return-traffic (as it is the case f=
or
>> >> >> multicast- udp), udp doesn't go into the established state.
>> >> >>
>> >> >> Regards,
>> >> >> Christoph
>> >> >>
>> >> >> On Wed 24 February 2010 wrote ratheesh k:
>> >> >>> multicast packets are udp packets . But its flowing only from
>> >> >>> upstream to downstream . So packet state will be always "NEW"=
 . ??
>> >> >>>
>> >> >>> my question is : whether we can see multicast data packets in
>> >> >>> ESTABLISHED state ??
>> >> >>>
>> >> >>> Thanks,
>> >> >>> Ratheesh
>> >> >>> --
>> >> >>> To unsubscribe from this list: send the line "unsubscribe net=
filter"
>> >> >>> in the body of a message to majordomo@vger.kernel.org
>> >> >>> More majordomo info at =A0http://vger.kernel.org/majordomo-in=
fo.html
>> >> >>
>> >> >> --
>> >> >> Christoph Paasch
>> >> >>
>> >> >> Alcatel-Lucent
>> >> >> IP Development
>> >> >>
>> >> >> www.rollerbulls.be
>> >> >> --
>> >> >> --
>> >> >> To unsubscribe from this list: send the line "unsubscribe netf=
ilter"
>> >> >> in the body of a message to majordomo@vger.kernel.org
>> >> >> More majordomo info at =A0http://vger.kernel.org/majordomo-inf=
o.html
>> >>
>> >> --
>> >> To unsubscribe from this list: send the line "unsubscribe netfilt=
er" in
>> >> the body of a message to majordomo@vger.kernel.org
>> >> More majordomo info at =A0http://vger.kernel.org/majordomo-info.h=
tml
>> >
>> > --
>> > Christoph Paasch
>> >
>> > Alcatel-Lucent
>> > IP Development
>> >
>> > www.rollerbulls.be
>> > --
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> --
> Christoph Paasch
>
> Alcatel-Lucent
> IP Development
>
> www.rollerbulls.be
> --
>
