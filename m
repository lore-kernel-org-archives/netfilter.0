From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: multicast packets
Date: Fri, 26 Feb 2010 14:52:23 +0530
Message-ID: <cfeab66d1002260122o2b0cca06u6bd759c440e00cdb@mail.gmail.com>
References: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com>
	 <201002260741.43169.christoph.paasch@gmail.com>
	 <cfeab66d1002252250h46989089n2bd68be274123e71@mail.gmail.com>
	 <201002260820.06236.christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=sDJp5TQS2bQMXC0QaKBvzwJYW+pZiwFVQLW8DHvuykg=;
        b=ddFeHSDVRtaW50XudmAnyAIgXH+1aYKa+DdrN3QGUxEmDuz82H2Qm3AwEdA3t5rOch
         7jD9UQb8ZZp8SLJmN4O25ULe8UOQggZmuI4zM9Z5Z1WjKVRQWncgiSx497uLy9xLpS7a
         n0Wv9mu87xNDlmcpHFMMX5q8zvkG+qK6RgW8I=
In-Reply-To: <201002260820.06236.christoph.paasch@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

>>>>>>>>>>>>Looking a little bit in the source-code it seems that it in=
stalls a route

True . it installs multicast route  { /prox/net/ip_mr_cache }.
But route comes into play only at POSTROUTING hook . { after reaching
box } .Since i dont have any rule in INPUT to accept those ,it should
be rejected .

You confirmed that IGMP wont go to ESTABLISHED state . I think , i
have to debug more .



On Fri, Feb 26, 2010 at 12:50 PM, Christoph Paasch
<christoph.paasch@gmail.com> wrote:
> I don't know the details about igmpproxy.
> Looking a little bit in the source-code it seems that it installs a r=
oute
> inside in the kernel for a certain multicast-stream.
> Thus, multicast-udp will pass your gateway as they don't hit the INPU=
T chain.
>
> However for the igmp-control traffic I have no idea, why igmpproxy re=
ceives
> these.
>
> Christoph
>
> On Fri 26 February 2010, ratheesh k wrote:
>> I am running =A0igmp stream =A0client to stream igmp packets on mach=
ine A
>> from internet .I can play files .
>>
>> note : Is igmpproxy running machine B has anything to do with this =A0=
?
>>
>>
>>
>> On Fri, Feb 26, 2010 at 12:11 PM, Christoph Paasch
>>
>> <christoph.paasch@gmail.com> wrote:
>> > On Fri 26 February 2010, ratheesh k wrote:
>> >> INPUT =A0policy is DROP
>> >> FORWARD policy is DROP
>> >> OUTPUT policy is accept
>> >>
>> >>
>> >> INPUT chain
>> >> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> >> iptables -A INPUT =A0-i eth0 =A0-j ACCEPT
>> >>
>> >>
>> >> FORWARD
>> >> iptables -A FORWARD =A0-m state --state ESTABLISHED,RELATED -j AC=
CEPT
>> >> iptables -A INPUT =A0-i eth0 =A0-o eth1 -j ACCEPT
>> >
>> > I imagine that this is a typo and that you meant the FORWARD chain=
=2E
>> >
>> >> machine =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Gateway machine B
>> >> =A0 =A0A -------------------->eth0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eth=
1 -------------> internet
>> >>
>> >> I have a machine A . which is connected to a linux gateway machin=
e .
>> >> Ruleset and policy mentioned are for machine B . There is no ipta=
bles
>> >> rules in machine A .
>> >>
>> >> >>>>>>>>>What do you want to achieve ?
>> >>
>> >> As per the current rule , no igmp packet should come to GATEWAY
>> >> machine , since there is no firewall hole in input chain .
>> >>
>> >> >>>>>>>>>>what are you observing?
>> >>
>> >> But i can see , igmp packets flowing into machine B from internet=
 .
>> >
>> > Where can you see these igmp packets? With wireshark/tcpdump? If i=
t is
>> > one of those, than it is normal, because these capture the packets
>> > before the iptables filter.
>> >
>> > Seen your ruleset, the packets should not enter, if they are comin=
g from
>> > the internet.
>> >
>> > Regards,
>> > Christoph
>> >
>> >> On Fri, Feb 26, 2010 at 4:46 AM, Christoph Paasch
>> >>
>> >> <christoph.paasch@gmail.com> wrote:
>> >> > Please, provide more information about your setup.
>> >> >
>> >> > What are the policies of your chains? What is your ruleset?
>> >> > What is your topology?
>> >> > What do you want to achieve, and what are you observing?
>> >> >
>> >> > Christoph
>> >> >
>> >> > On Thu 25 February 2010 wrote ratheesh k:
>> >> >> iptables -A INPUT -m state --state ESTABLISHED,RELATES -j ACCE=
PT .
>> >> >>
>> >> >> This is the only rule . No firewall hole for igmp packets .
>> >> >>
>> >> >> On Thu, Feb 25, 2010 at 12:08 PM, ratheesh k <ratheesh.ksz@gma=
il.com>
>> >
>> > wrote:
>> >> >> >>>>>>>>>>udp doesn't go into the established state.
>> >> >> >
>> >> >> > I am running "igmpproxy" on my gateway box . I didnot add an=
y rule
>> >> >> > in INPUT chain to accept igmp packets . But =A0i hve a rule =
to
>> >> >> > accept all ESTABLISHED state packets . It am able to stream =
igmp
>> >> >> > from my desktop .
>> >> >> >
>> >> >> > I really believe that " We dont need any rule in FORWARD cha=
in " .
>> >> >> > Because packets are flowing from node to node and routed . S=
o only
>> >> >> > INPUT and OUTPUT chains are involved .
>> >> >> >
>> >> >> > Thanks,
>> >> >> > Ratheesh
>> >> >> >
>> >> >> >
>> >> >> >
>> >> >> > On Thu, Feb 25, 2010 at 12:03 AM, Christoph Paasch
>> >> >> >
>> >> >> > <christoph.paasch@gmail.com> wrote:
>> >> >> >> As long as there isn't any return-traffic (as it is the cas=
e for
>> >> >> >> multicast- udp), udp doesn't go into the established state.
>> >> >> >>
>> >> >> >> Regards,
>> >> >> >> Christoph
>> >> >> >>
>> >> >> >> On Wed 24 February 2010 wrote ratheesh k:
>> >> >> >>> multicast packets are udp packets . But its flowing only f=
rom
>> >> >> >>> upstream to downstream . So packet state will be always "N=
EW" .
>> >> >> >>> ??
>> >> >> >>>
>> >> >> >>> my question is : whether we can see multicast data packets=
 in
>> >> >> >>> ESTABLISHED state ??
>> >> >> >>>
>> >> >> >>> Thanks,
>> >> >> >>> Ratheesh
>> >> >> >>> --
>> >> >> >>> To unsubscribe from this list: send the line "unsubscribe
>> >> >> >>> netfilter" in the body of a message to majordomo@vger.kern=
el.org
>> >> >> >>> More majordomo info at
>> >> >> >>> =A0http://vger.kernel.org/majordomo-info.html
>> >> >> >>
>> >> >> >> --
>> >> >> >> Christoph Paasch
>> >> >> >>
>> >> >> >> Alcatel-Lucent
>> >> >> >> IP Development
>> >> >> >>
>> >> >> >> www.rollerbulls.be
>> >> >> >> --
>> >> >> >> --
>> >> >> >> To unsubscribe from this list: send the line "unsubscribe
>> >> >> >> netfilter" in the body of a message to majordomo@vger.kerne=
l.org
>> >> >> >> More majordomo info at =A0http://vger.kernel.org/majordomo-=
info.html
>> >> >>
>> >> >> --
>> >> >> To unsubscribe from this list: send the line "unsubscribe netf=
ilter"
>> >> >> in the body of a message to majordomo@vger.kernel.org
>> >> >> More majordomo info at =A0http://vger.kernel.org/majordomo-inf=
o.html
>> >> >
>> >> > --
>> >> > Christoph Paasch
>> >> >
>> >> > Alcatel-Lucent
>> >> > IP Development
>> >> >
>> >> > www.rollerbulls.be
>> >> > --
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
