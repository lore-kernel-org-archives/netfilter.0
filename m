From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: ebtables & VLAN redirect
Date: Tue, 29 Jun 2010 21:15:49 +0300
Message-ID: <AANLkTindtJ35xk2AgQxS_Fkac86s-n1riksh7D2oD34o@mail.gmail.com>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>
	<4C262DA2.1040103@riverviewtech.net>
	<AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>
	<4C2805A3.4070801@riverviewtech.net>
	<AANLkTikeVKxFv4jTp2vLTh80BOQW1nAQxmCc8M7EsPJ1@mail.gmail.com>
	<4C2909D9.8010506@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=HLaX2o8DH3zTx+qcJmKON5omcsQcTgZ7bFvTSVwdlC4=;
        b=BVDN25FngaaxcNiurvWRachpZ+JS8Hg+DNdRTadE9BDh8d463la0EOgDLjGVQz5y4A
         77OLrbsypYB9+p06JrKScX6R5wVqJRe9+lAHOhVl4x5d1h3MzH5X0hw/QjVaytRnuspQ
         oEB1uNgZtJ5xh2EU8DWdmsNa5tkB58D0o8Mes=
In-Reply-To: <4C2909D9.8010506@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2010/6/28 Grant Taylor <gtaylor@riverviewtech.net>:
>> 3. Mirroring specific sessions to VLAN 9 - and I can postpone this t=
ask
>> for the future.
>
> Please clarify what you are meaning by "mirroring specific sessions".

Session may be not fully correct word - more precisely it should
understand as IP traffic flows specified by address:port pairs to dump
the traffic.

>> Bridging is a good idea, but its current implementation lacks some
>> features important to me - as impossibility to limit traffic directi=
ons
>> between bridge devices and the fact that a network device can belong=
 to one
>> bridge only.
>
> Please clarify "impossibility to limit traffic direction between brid=
ge
> devices".
>
> It is trivial to allow bridging one way while blocking it the other w=
ay.
>
> I.e. set an EBTables policy to DROP and only allow bridging the direc=
tion
> you want.
>
> VID:100 --> VID:9
> VID:101 --> VID:9
> VID:102 --> VID:9
> ...
> VID:199 --> VID:9
>
> Bridging does not have to be by-directional. =A0You can easily make E=
BTables
> not bridge the traffic.

Your explanation is correct BUT in current bridging model there would
be a hundred attempts to flood ALL broadcast/multicast traffic
received from every bridge port. Yes, I can filter them out by using
ebtables rules, but this unnecessary attempts will waste CPU time.
Writing "to limit traffic direction between bridge devices" I meant
there is no support to exclude attempts of flood to ALL ports by
limiting a direction of flooding in the description of a bridge
device.

> It may be my mis-understanding, but I'm still not seeing why you can'=
t do
> this in EBTables using bridging.
>
> If you bridge all your VLANs together and configure EBTables to filte=
r the
> traffic, I don't see what the problem will be.
>
> All your layer 3 traffic will behave as if it is on one large network=
,
> passing through the bridge with out the need for modification. =A0Gra=
nted, you
> can modify the traffic if you /want/ to, but I don't see the /need/ f=
or it.
> =A0At least based on my (mis)understanding.

OK bridging will work, but I am afraid to meet performance issues
afterwards as I stated above.

> Let me ask you this:
>
> Do you want your different user VLANs to be able to communicate with =
each
> other? =A0(Inter user VLAN communications)
>
> How would this scenario work for you:
>
> =A0- Bridge all the user VLANs and the VLAN 9 together.
> =A0- Configure the bridge to drop the frames by default.
> =A0- Configure the bridge to selectively bridge the frames that you w=
ant to.
> =A0- Optionally alter the bridged frames if you want to.
>
> I think I did something similar to what you are wanting to do a numbe=
r of
> years ago. =A0I bridged about 40 different VLANs (sharing one IP subn=
et)
> together and configured them so that they could not talk with each ot=
her
> (preventing the spread of virus / worms) but so that they could talk =
to the
> router that was on a different VLAN that was part of the bridge. =A0I=
n the
> process I had to modify the MAC address of traffic b/c the switch tha=
t was
> being used had a flaw where it could not see the same MAC address on =
more
> than one VLAN. =A0This has been in place and working just fine for a =
number of
> years. =A0Originally it started out on a P-II 233 MHz system with 128=
 MB of
> memory and it was able to do it with out any problems. =A0The only re=
ason we
> replaced the box was because it was physically old and we did not wan=
t the
> hardware to dye on us. =A0I ended up copying the EBTables scripts fro=
m the old
> system to the new system and made very minor modifications to get eve=
rything
> to work (essentially as it was) with out any problems.

Very interesting.
Thank you for your advise, It worth to employ ebtables in solving my ta=
sks.
And I have met the same problem with MACs in other project and I had
to generate different source MACs for different VLANs and eventually I
had to replace the switch to cope with the problem of matching
destination MACs for different VLANs.

--=20
Best regards
Anatoly Muliarski
