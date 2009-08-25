From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: bridge tc fw filter
Date: Tue, 25 Aug 2009 17:09:33 +0530
Message-ID: <cfeab66d0908250439k158c0b13sc2106add5cdde386@mail.gmail.com>
References: <cfeab66d0908200831r4148a9e8gc67647ba600c3850@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=K5qAjjqPAgPMgBkSMhu3zJiJ3iWBEeunYGQZVSBGfiA=;
        b=OIFCsQVSR0cRzSV+9ykmrYGNnGkp1rz90hRpTgFfCCiW7QKykAxl6E5JRT5MQxIjYd
         N9EiKoQ7An7+nyv9G+nDEbxIlVjnL/0dEJlPoB0AgSAFmaAdXYHptYa63SmlicBFZNsf
         CMxSIsSzmsZuvkZ19D4/R260a8I1kOP0YYhXU=
In-Reply-To: <cfeab66d0908200831r4148a9e8gc67647ba600c3850@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

i can see this bug in 2.6.22.18 but not in 2.6.26.8 ....any clue is
greatly appreciated ///

On Thu, Aug 20, 2009 at 9:01 PM, ratheesh k<ratheesh.ksz@gmail.com> wro=
te:
> I have two interfaces , eth0 and ap0 bridged together to form br0 .
> And another interfaces eth1 on wan side .
>
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0br0 <------------------------> eth=
1
> =A0 =A0 =A0 =A0 =A0 =A0 =A0( eth0 , ap0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{ =A0lan =A0} =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 {wan}
>
> packets from lan side are nated =A0to eth1 . =A0i have qos rules on b=
oth
> br0 and eth1 . =A0when i googled i found that "mangling packets on br=
0
> and using fw filters wont work on linux bridge ".. Is this true ?? Ca=
n
> you tell me why ??
>
> But the funny thing is i colored packets =A0in prerouting chain =A0on=
ly
> specifying protocol ( not specifying interface )
>
> =A0iptables =A0-t mangle -A PREROTUING -p icmp -j MARK --set-mark 2 =A0=
 and
> i have filter rule to put =A0packets tat are fw marked as 2 to put in=
to
> some flow . This works fine , when i send an icmp packet from lan to
> wan side !!!!!!! ??????????
>
> But if =A0try any of below rules =A0intsead of above , =A0it wont wor=
k
>
> iptables =A0-t mangle -A PREROTUING -p icmp -i br0 -j MARK --set-mark=
 2
> iptables =A0-t mangle -A PREROTUING -p icmp =A0-s 192.168.1.0/24 =A0-=
d !
> 192.168.1.0/24 -j MARK --set-mark 2
> iptables =A0-t mangle -A FORWARD =A0-p icmp =A0-i br0 -o eth1 -j MARK=
 --set-mark 2
>
> i dont know y ????????
>
> in linux kernel =A0, in =A0net/sched/cls_fw.c =A0file =A0, fw_classif=
y is
> called every time =A0tc filter =A0is hit .
> skb->mark is =A0zero when u use rules like
>
> iptables =A0-t mangle -A PREROTUING -p icmp -i br0 -j MARK --set-mark=
 2
> iptables =A0-t mangle -A PREROTUING -p icmp =A0-s 192.168.1.0/24 =A0-=
d !
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 192.168.1.0/24 -j MARK --set-mark 2
> iptables =A0-t mangle -A FORWARD =A0-p icmp =A0-i br0 -o eth1 -j MARK=
 --set-mark 2
>
> But if u use
> iptables =A0-t mangle -A PREROTUING -p icmp -j MARK --set-mark 2
>
> the skb->mark is 2 =A0, correct value .
>
> This problem happens only with bridge . when i tried with one of the
> interface it works perfectly .
>
> Thanks,
> Ratheesh
>
