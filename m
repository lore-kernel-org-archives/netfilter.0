From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: Traversal of chains for muticast packets .
Date: Sun, 7 Mar 2010 12:04:03 +0530
Message-ID: <cfeab66d1003062234l691f50b2w68dc292b19031435@mail.gmail.com>
References: <cfeab66d1003042146p62c3904cncfaedbeca4f41c12@mail.gmail.com>
	 <cfeab66d1003050252n27fb7fa2s5ff92a30b0874566@mail.gmail.com>
	 <4B90E432.8080802@chello.at>
	 <cfeab66d1003050337l419ac95es15500603333b6e11@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Xwr/w0PBj8MpG9AvhffMNlaFVYFWCFMqEHjuPVusiKs=;
        b=AH8S7xPh/jqhJROCDMjvmExHPMqAyzOv+QXzzN8Pwa6A/UcU0qJcNcLfNVzelFCTNr
         mX0gH2icJI15ndQ6PeskukhRm+/AGALpX62X/Ncyzsa9rW6cZjtsBVFBBJ2l8Hx9Abar
         hTEyK5L3jdMuYWrp75m+LxszjAe7oj9f8g3mk=
In-Reply-To: <cfeab66d1003050337l419ac95es15500603333b6e11@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Fri, Mar 5, 2010 at 5:07 PM, ratheesh k <ratheesh.ksz@gmail.com> wro=
te:
> On Fri, Mar 5, 2010 at 4:30 PM, Mart Frauenlob <mart.frauenlob@chello=
=2Eat> wrote:
>> On 05.03.2010 11:53, netfilter-owner@vger.kernel.org wrote:
>>> My gateway machine has two interfaces , eth0 is connected to wan an=
d
>>> eth1 is connected to lan side .
>>>
>>>
>>> iptable -A =A0 =A0INPUT =A0 -i eth0 =A0-p igmp -d 224.0.0.1 -j ACCE=
PT
>>> iptables -A =A0INPUT =A0 -i eth0 =A0-p igmp -d 224.0.0.2 =A0-j ACCE=
PT
>>> iptables =A0-A INPUT =A0-i eth0 =A0-j =A0 DROP
>>> iptables =A0-A INPUT -i eth1 -j ACCEPT
>>>
>>>
>>> iptables -A FORWARD -i eth0 -o eth1 -p udp -d =A0mutlicast-address =
-j ACCEPT
>>>
>>> I have above rules , but =A0i cannot see mutlicast packets in my la=
n
>>> client . But if i have
>>> below rules , it is working . Why i need all rules to be called bot=
h
>>> in forward and input chain ?
>>> Am i missing something ?
>>>
>>>
>>> iptables -A =A0igmp-rule -i eth0 -p igmp -d 224.0.0.1 -j ACCEPT
>>> iptables -A igmp-rule -i eth0 -p igmp -d 224.0.0.2 =A0-j ACCEPT
>>> iptables -A igmp-rule -i eth0 -o eth1 -p udp -d =A0mutlicast-addres=
s -j ACCEPT
>>>
>>> iptables -A INPUT -j igmp-rule
>>> iptables -A FORWARD -j igmp-rule
>>>
>>>
>>>
>>>
>>>
>>>
>>> On Fri, Mar 5, 2010 at 11:16 AM, ratheesh k <ratheesh.ksz@gmail.com=
> wrote:
>>>> Hi,
>>>>
>>>> =A0 =A0 "packets those are forwarded traverse thru =A0 "NAT prerou=
ting ->
>>>> Filter Forward -> NAT post Routing chains ."
>>>>
>>>> =A0 =A0 =A0But in case of =A0multicast packets , i can see packets=
 flowing
>>>> thru =A0"NAT prerouting -> Filter INPUT -> Filtert =A0Forward -> N=
AT post
>>>> routing chains . why it is so ? =A0.
>>>>
>>>> =A0 =A0 =A0Note - > I am running igmpproxy for for multicast proxy=
 .
>>>>
>>>>
>>>> Thanks,
>>>> Ratheesh.
>>>>
>>
>> Because you don't do any DNAT, it's your igmproxy which routes the
>> packets. Thus what was INPUT has become FORWARD.
>>
>> Best regards
>>
>> Mart
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
> Iif so , can =A0 we remove =A0following rules from FORWARD chain ?
>
> =A0 iptables -A FORWARD -p igmp -d 224.0.0.1 -j ACCEPT
> =A0 iptables -A FORWARD -p igmp -d 224.0.0.2 -j ACCEPT
>
> Thanks,
> Ratheesh
>

do we need to forward packets destined to 224.0.0.1 , 224.0.0.2 ????

thanks,
ratheesh
