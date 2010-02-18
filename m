From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: Re: Transparent http filtering VLAN traffic without being a member of 
	tagged VLANs
Date: Thu, 18 Feb 2010 13:20:55 +0200
Message-ID: <c4ada2161002180320i373a4931waf29dd22acc5e4db@mail.gmail.com>
References: <c4ada2161002171216v202474a0obd2ca5c1f22511f1@mail.gmail.com>
	 <20100217215518.2944595e@catlap>
	 <c4ada2161002172323r477f2b23g3b5ed981275d11ca@mail.gmail.com>
	 <20100218113636.6bddb735@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=sCTZnyeZT4LnLAK9mhjveRefoD4pY/lp+oVUOCg1AKk=;
        b=Byr0TqQ4n55RW2OYZzeBPinboA/Hxysa9ciuPRwKTFFLTVZeOs7BzaYSNYOCEJ3uA4
         iNRo5YdOj6bT5mfzsTQUz8VB5PwYXEAdw0/oj94uTML5AMzVySHAUVtwv/hkUlBOHOtB
         oqIpR75p1AIY3T+cMHmaAA5Q8VyZjFKjx4fiU=
In-Reply-To: <20100218113636.6bddb735@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek Kierdelewicz <marek@piasta.pl>, netfilter@vger.kernel.org

# ifconfig br0
br0       Link encap:Ethernet  HWaddr 00:0E:0C:C4:AA:E7
          inet addr:SOMEIP  Bcast:SOMEBCAST  Mask:255.255.255.252
          inet6 addr: fe80::20e:cff:fec4:aae7/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:88539199 errors:0 dropped:0 overruns:0 frame:0
          TX packets:422429 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:457848874 (436.6 MiB)  TX bytes:53152547 (50.6 MiB)


br0.206   Link encap:Ethernet  HWaddr 00:0E:0C:C4:AA:E7
          inet6 addr: fe80::20e:cff:fec4:aae7/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:901504 errors:0 dropped:0 overruns:0 frame:0
          TX packets:6 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:545628196 (520.3 MiB)  TX bytes:492 (492.0 b)


# ip link set up dev br0.206

# ip link show | grep br0.206
27: br0.206@br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noque=
ue

# route add -net 91.93.179.88 netmask 255.255.255.248 dev br0.206
SIOCADDRT: No such device

# ip ro add 91.93.179.88/29 dev br0.206
RTNETLINK answers: No such device

# ip ro sh dev br0.206
NO OUTPUT


Kernel is Linux 2.6.18 Centos EL5 Kernel.



On Thu, Feb 18, 2010 at 12:36 PM, Marek Kierdelewicz <marek@piasta.pl> =
wrote:
> Hello,
>
>>This may be our problem. However ip route add returns
>>"SIOCADDRT: No such device"
>>while I see br0.26 in ifconfig output.
>
> Strange. It should work. Tested on debian lenny:
>
> rt1:/# brctl addbr br0
> rt1:/# ip link set up dev br0
> rt1:/# vconfig add br0 26
> Added VLAN with VID =3D=3D 26 to IF -:br0:-
> rt1:/# ip link set up dev br0.26
> rt1:/# ip ro add 10.100.0.0/30 dev br0.26
> rt1:/# ip ro sh dev br0.26
> 10.100.0.0/30 =A0scope link =A0 =A0<- route is there!
>
> Post output of your "ip addr sh" and "ip ro show" and steps you take =
to
> set things up.
>
>>What about routing into not "dev br0.26" but to "dev br0"?
>
> In case of routing on br0 and not br0.26 AFAIK bridge would be sendin=
g
> replies untagged on native vlan. Maybe there are some ebtables hacks
> I don't know about.
>
> Best regards,
> Marek Kierdelewicz
>
