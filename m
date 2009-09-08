From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: bridge tc fw filter
Date: Tue, 8 Sep 2009 21:18:21 +0530
Message-ID: <cfeab66d0909080848k6d7923acp99abec793a6fea7d@mail.gmail.com>
References: <cfeab66d0908200831r4148a9e8gc67647ba600c3850@mail.gmail.com>
	 <cfeab66d0908250439k158c0b13sc2106add5cdde386@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Uj18frTSn6XXGFyCtgvMrk948rMxMc+jopu08tdmDuk=;
        b=gTRISWkj5UFLdjehgdDiNdflx6B7XfDaxixL51vtERUEE72FpbJTyHVSL+MtFZnBX3
         O58WLSDuqx16HMC9G7C3veN7bTSy+DG96ZvNndVPyootoWEQ0Q6u6H+k1H4bwkiR/RAs
         zxhO2yRUTVoxUJQPXawRJx76x5+62AVB4gFXE=
In-Reply-To: <cfeab66d0908250439k158c0b13sc2106add5cdde386@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

i m a big idiot .....i made a big mistake .

i will explain in detail . i have a router like below . i will connect
my computers to lan side of router ( br0) and eth1 is connected to
internet .


 ->   br0 <------------------------> eth1
    ( eth0 , ap0)
      {  lan  }                         {wan}



there r two types of traffic .
 A. traffic from my computers that will go to br0 , then will route
and go to internet thru eth1
 B. traffic coming from eth1 will be routed to br0 , then to my compute=
r .


There are two types of qdisc in place . ingress and outgress .

pkts of type A will be processed  only at egress qdisc of eth1
pkts of type B will be processed only at egress qdisc of  br0 .


My mistakes was : i applied coloring at br0 and used fw filter on same
br0 ..This wont work .


dev_queue_xmit function will put pkts after routed into repective
device (eth0 or br0 ) qdisc  .


Suppose there are lan-to-lan traffic and wan-to-lan traffic , we
cannot prioritize any of this traffic using egress qdisc . Because
lan-to-lan traffic wont call dev_queue_xmit .  You can use ingress
queue to do policing . I am not very much sure about this .

netif_recieve_skb() function is called for all pkts coming in . Try
ingress qdisc .


Thanks,
Rat

On Tue, Aug 25, 2009 at 5:09 PM, ratheesh k<ratheesh.ksz@gmail.com> wro=
te:
> i can see this bug in 2.6.22.18 but not in 2.6.26.8 ....any clue is
> greatly appreciated ///
>
> On Thu, Aug 20, 2009 at 9:01 PM, ratheesh k<ratheesh.ksz@gmail.com> w=
rote:
>> I have two interfaces , eth0 and ap0 bridged together to form br0 .
>> And another interfaces eth1 on wan side .
>>
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0br0 <------------------------> et=
h1
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0( eth0 , ap0)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{ =A0lan =A0} =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 {wan}
>>
>> packets from lan side are nated =A0to eth1 . =A0i have qos rules on =
both
>> br0 and eth1 . =A0when i googled i found that "mangling packets on b=
r0
>> and using fw filters wont work on linux bridge ".. Is this true ?? C=
an
>> you tell me why ??
>>
>> But the funny thing is i colored packets =A0in prerouting chain =A0o=
nly
>> specifying protocol ( not specifying interface )
>>
>> =A0iptables =A0-t mangle -A PREROTUING -p icmp -j MARK --set-mark 2 =
=A0 and
>> i have filter rule to put =A0packets tat are fw marked as 2 to put i=
nto
>> some flow . This works fine , when i send an icmp packet from lan to
>> wan side !!!!!!! ??????????
>>
>> But if =A0try any of below rules =A0intsead of above , =A0it wont wo=
rk
>>
>> iptables =A0-t mangle -A PREROTUING -p icmp -i br0 -j MARK --set-mar=
k 2
>> iptables =A0-t mangle -A PREROTUING -p icmp =A0-s 192.168.1.0/24 =A0=
-d !
>> 192.168.1.0/24 -j MARK --set-mark 2
>> iptables =A0-t mangle -A FORWARD =A0-p icmp =A0-i br0 -o eth1 -j MAR=
K --set-mark 2
>>
>> i dont know y ????????
>>
>> in linux kernel =A0, in =A0net/sched/cls_fw.c =A0file =A0, fw_classi=
fy is
>> called every time =A0tc filter =A0is hit .
>> skb->mark is =A0zero when u use rules like
>>
>> iptables =A0-t mangle -A PREROTUING -p icmp -i br0 -j MARK --set-mar=
k 2
>> iptables =A0-t mangle -A PREROTUING -p icmp =A0-s 192.168.1.0/24 =A0=
-d !
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 192.168.1.0/24 -j MARK --set-mark 2
>> iptables =A0-t mangle -A FORWARD =A0-p icmp =A0-i br0 -o eth1 -j MAR=
K --set-mark 2
>>
>> But if u use
>> iptables =A0-t mangle -A PREROTUING -p icmp -j MARK --set-mark 2
>>
>> the skb->mark is 2 =A0, correct value .
>>
>> This problem happens only with bridge . when i tried with one of the
>> interface it works perfectly .
>>
>> Thanks,
>> Ratheesh
>>
>
