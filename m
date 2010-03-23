From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: multicast packets
Date: Tue, 23 Mar 2010 16:57:49 +0530
Message-ID: <cfeab66d1003230427i624ebe5by7a711aaf077aef43@mail.gmail.com>
References: <cfeab66d1002240643s6c4b87dfl5c3069f1c91cecd8@mail.gmail.com>
	 <201002260741.43169.christoph.paasch@gmail.com>
	 <cfeab66d1002252250h46989089n2bd68be274123e71@mail.gmail.com>
	 <201002260820.06236.christoph.paasch@gmail.com>
	 <cfeab66d1002260122o2b0cca06u6bd759c440e00cdb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=4pV9d+Y38eJPM8bAYzk6FyQC07lIXi7dNgZHgv2W5Pw=;
        b=Kt+gtBdchpo4L+21GOPun93p89uOqr2DWhS0F/QnWJHr/TrOfDH131NdY3z9jFoFMD
         Ih2vZCxk5sShrGiCH2phTQ5722J0AjS8jeFQLbLW7/1+J7cYVrixOJVynPNtyjVF1u8e
         vURCjzIkiGiv7sZLsAFE54MsnW8U7hKSIo5vg=
In-Reply-To: <cfeab66d1002260122o2b0cca06u6bd759c440e00cdb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: christoph.paasch@gmail.com

>>> >> >> >> As long as there isn't any return-traffic (as it is the ca=
se for
>>> >> >> >> multicast- udp), udp doesn't go into the established state=
=2E

You are absolutely right .
 There is a packet processor running on the machine ,which offloads
the multicast stream . I was not aware of that . So you can add delete
iptables rules  ,which unaffects packet processor stream .

I think , below rules are enough for igmp v2 to work .Could you please
verify this ? eth0 is lan interface and eth1 is wan interface . I
don't know whether we need rule no 3 ( R3 ) .

R1 . iptables -A  INPUT -i eth1  -d  224.0.0.1 -j ACCEPT
R2 . iptables -A  INPUT -i eth1   -d 224.0.0.2 -j ACCEPT
R3.  iptables -A  INPUT  -i  eth1   -p udp -d
$muticast-destination-address -j ACCEPT
R4.  iptables -A -i eth1 -o eth0   -p udp -d
$muticast-destination-address  -j ACCEPT


I  have read tutorials which tells to add route for 224.0.0.0/4 . But
i have no route like this and still works . Is there any impact on
this .
Note :I am using igmpproxy .

Thanks,
Ratheesh

On Fri, Feb 26, 2010 at 2:52 PM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
>>>>>>>>>>>>>Looking a little bit in the source-code it seems that it i=
nstalls a route
>
> True . it installs multicast route =A0{ /prox/net/ip_mr_cache }.
> But route comes into play only at POSTROUTING hook . { after reaching
> box } .Since i dont have any rule in INPUT to accept those ,it should
> be rejected .
>
> You confirmed that IGMP wont go to ESTABLISHED state . I think , i
> have to debug more .
>
>
>
> On Fri, Feb 26, 2010 at 12:50 PM, Christoph Paasch
> <christoph.paasch@gmail.com> wrote:
>> I don't know the details about igmpproxy.
>> Looking a little bit in the source-code it seems that it installs a =
route
>> inside in the kernel for a certain multicast-stream.
>> Thus, multicast-udp will pass your gateway as they don't hit the INP=
UT chain.
>>
>> However for the igmp-control traffic I have no idea, why igmpproxy r=
eceives
>> these.
>>
>> Christoph
>>
>> On Fri 26 February 2010, ratheesh k wrote:
>>> I am running =A0igmp stream =A0client to stream igmp packets on mac=
hine A
>>> from internet .I can play files .
>>>
>>> note : Is igmpproxy running machine B has anything to do with this =
=A0?
>>>
>>>
>>>
>>> On Fri, Feb 26, 2010 at 12:11 PM, Christoph Paasch
>>>
>>> <christoph.paasch@gmail.com> wrote:
>>> > On Fri 26 February 2010, ratheesh k wrote:
>>> >> INPUT =A0policy is DROP
>>> >> FORWARD policy is DROP
>>> >> OUTPUT policy is accept
>>> >>
>>> >>
>>> >> INPUT chain
>>> >> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>> >> iptables -A INPUT =A0-i eth0 =A0-j ACCEPT
>>> >>
>>> >>
>>> >> FORWARD
>>> >> iptables -A FORWARD =A0-m state --state ESTABLISHED,RELATED -j A=
CCEPT
>>> >> iptables -A INPUT =A0-i eth0 =A0-o eth1 -j ACCEPT
>>> >
>>> > I imagine that this is a typo and that you meant the FORWARD chai=
n.
>>> >
>>> >> machine =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Gateway machine B
>>> >> =A0 =A0A -------------------->eth0 =A0 =A0 =A0 =A0 =A0 =A0 =A0et=
h1 -------------> internet
>>> >>
>>> >> I have a machine A . which is connected to a linux gateway machi=
ne .
>>> >> Ruleset and policy mentioned are for machine B . There is no ipt=
ables
>>> >> rules in machine A .
>>> >>
>>> >> >>>>>>>>>What do you want to achieve ?
>>> >>
>>> >> As per the current rule , no igmp packet should come to GATEWAY
>>> >> machine , since there is no firewall hole in input chain .
>>> >>
>>> >> >>>>>>>>>>what are you observing?
>>> >>
>>> >> But i can see , igmp packets flowing into machine B from interne=
t .
>>> >
>>> > Where can you see these igmp packets? With wireshark/tcpdump? If =
it is
>>> > one of those, than it is normal, because these capture the packet=
s
>>> > before the iptables filter.
>>> >
>>> > Seen your ruleset, the packets should not enter, if they are comi=
ng from
>>> > the internet.
>>> >
>>> > Regards,
>>> > Christoph
>>> >
>>> >> On Fri, Feb 26, 2010 at 4:46 AM, Christoph Paasch
>>> >>
>>> >> <christoph.paasch@gmail.com> wrote:
>>> >> > Please, provide more information about your setup.
>>> >> >
>>> >> > What are the policies of your chains? What is your ruleset?
>>> >> > What is your topology?
>>> >> > What do you want to achieve, and what are you observing?
>>> >> >
>>> >> > Christoph
>>> >> >
>>> >> > On Thu 25 February 2010 wrote ratheesh k:
>>> >> >> iptables -A INPUT -m state --state ESTABLISHED,RELATES -j ACC=
EPT .
>>> >> >>
>>> >> >> This is the only rule . No firewall hole for igmp packets .
>>> >> >>
>>> >> >> On Thu, Feb 25, 2010 at 12:08 PM, ratheesh k <ratheesh.ksz@gm=
ail.com>
>>> >
>>> > wrote:
>>> >> >> >>>>>>>>>>udp doesn't go into the established state.
>>> >> >> >
>>> >> >> > I am running "igmpproxy" on my gateway box . I didnot add a=
ny rule
>>> >> >> > in INPUT chain to accept igmp packets . But =A0i hve a rule=
 to
>>> >> >> > accept all ESTABLISHED state packets . It am able to stream=
 igmp
>>> >> >> > from my desktop .
>>> >> >> >
>>> >> >> > I really believe that " We dont need any rule in FORWARD ch=
ain " .
>>> >> >> > Because packets are flowing from node to node and routed . =
So only
>>> >> >> > INPUT and OUTPUT chains are involved .
>>> >> >> >
>>> >> >> > Thanks,
>>> >> >> > Ratheesh
>>> >> >> >
>>> >> >> >
>>> >> >> >
>>> >> >> > On Thu, Feb 25, 2010 at 12:03 AM, Christoph Paasch
>>> >> >> >
>>> >> >> > <christoph.paasch@gmail.com> wrote:
>>> >> >> >> As long as there isn't any return-traffic (as it is the ca=
se for
>>> >> >> >> multicast- udp), udp doesn't go into the established state=
=2E
>>> >> >> >>
>>> >> >> >> Regards,
>>> >> >> >> Christoph
>>> >> >> >>
>>> >> >> >> On Wed 24 February 2010 wrote ratheesh k:
>>> >> >> >>> multicast packets are udp packets . But its flowing only =
from
>>> >> >> >>> upstream to downstream . So packet state will be always "=
NEW" .
>>> >> >> >>> ??
>>> >> >> >>>
>>> >> >> >>> my question is : whether we can see multicast data packet=
s in
>>> >> >> >>> ESTABLISHED state ??
>>> >> >> >>>
>>> >> >> >>> Thanks,
>>> >> >> >>> Ratheesh
>>> >> >> >>> --
>>> >> >> >>> To unsubscribe from this list: send the line "unsubscribe
>>> >> >> >>> netfilter" in the body of a message to majordomo@vger.ker=
nel.org
>>> >> >> >>> More majordomo info at
>>> >> >> >>> =A0http://vger.kernel.org/majordomo-info.html
>>> >> >> >>
>>> >> >> >> --
>>> >> >> >> Christoph Paasch
>>> >> >> >>
>>> >> >> >> Alcatel-Lucent
>>> >> >> >> IP Development
>>> >> >> >>
>>> >> >> >> www.rollerbulls.be
>>> >> >> >> --
>>> >> >> >> --
>>> >> >> >> To unsubscribe from this list: send the line "unsubscribe
>>> >> >> >> netfilter" in the body of a message to majordomo@vger.kern=
el.org
>>> >> >> >> More majordomo info at =A0http://vger.kernel.org/majordomo=
-info.html
>>> >> >>
>>> >> >> --
>>> >> >> To unsubscribe from this list: send the line "unsubscribe net=
filter"
>>> >> >> in the body of a message to majordomo@vger.kernel.org
>>> >> >> More majordomo info at =A0http://vger.kernel.org/majordomo-in=
fo.html
>>> >> >
>>> >> > --
>>> >> > Christoph Paasch
>>> >> >
>>> >> > Alcatel-Lucent
>>> >> > IP Development
>>> >> >
>>> >> > www.rollerbulls.be
>>> >> > --
>>> >>
>>> >> --
>>> >> To unsubscribe from this list: send the line "unsubscribe netfil=
ter" in
>>> >> the body of a message to majordomo@vger.kernel.org
>>> >> More majordomo info at =A0http://vger.kernel.org/majordomo-info.=
html
>>> >
>>> > --
>>> > Christoph Paasch
>>> >
>>> > Alcatel-Lucent
>>> > IP Development
>>> >
>>> > www.rollerbulls.be
>>> > --
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
>> --
>> Christoph Paasch
>>
>> Alcatel-Lucent
>> IP Development
>>
>> www.rollerbulls.be
>> --
>>
>
