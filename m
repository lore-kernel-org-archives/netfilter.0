From: Felipe W Damasio <felipewd@gmail.com>
Subject: Re: ebtables broute DROP problem in production environment
Date: Tue, 29 Dec 2009 20:18:44 -0200
Message-ID: <8a87046f0912291418x11b37daen604665a94108f128@mail.gmail.com>
References: <8a87046f0912231019l76e69a9eg52a529023d02237b@mail.gmail.com>
	 <8a87046f0912231022g438141afpfaa647ac0d01cdda@mail.gmail.com>
	 <8a87046f0912240513m4c3cd0f2u565ef8e8b849f58@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Grn6x0qjS+1uHnPaOcpmU4E7FfwU8bRPGKM+OmtS6kE=;
        b=TeUee/k7zLXCYecunqZK6rGBH4vJ+worueI5MSGtbUm5vPlYP5rNUpTDjDIP1RkCuH
         TQT1gauPRwRvxcc7WGFRVRtLRJMm1tVwqr6s3Mo7qI2BICEac6E2bJmDvRZHxDTke2Y6
         7umjSBw654/ncRnsHlBfZbd0jGyVm/rSEBzt8=
In-Reply-To: <8a87046f0912240513m4c3cd0f2u565ef8e8b849f58@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Bruno Gustavo Wallauer <brunogw@gmail.com>, pascal.mail@plouf.fr.eu.org

  Hi All,

  Mr. Pascal, I'm sorry, I'm not subscribed to this list...so I just
saw your reply on the archives.

  The thing is, I narrowed down the problem:

  - The traffic is passing through the bridge just fine;
  - When I plug a single client everything works great;
  - When I plug in the CMTS (all the cable modem clients, then),
everything stops.

  So, first I thought that the CMTS must be doing something to the net
to upset ebtables.

  But I added a rule:

iptables -A INPUT -p tcp --dport 80 -j LOG --log-level 1 --log-prefix
"iptables "

  And I got _a lot_ of these:

Dec 29 20:05:16 hyper kernel: iptables IN=3Deth0 OUT=3D
MAC=3D00:ea:01:02:7b:a2:00:21:a0:ce:9d:24:08:00 SRC=3D200.250.249.216
DST=3D201.49.208.251 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D4008=
0 DF
PROTO=3DTCP SPT=3D2959 DPT=3D80 WINDOW=3D65535 RES=3D0x00 SYN URGP=3D0 =
MARK=3D0x1

  So it's not VLAN-related.

  So now I'm thinking: If squid isn't seeing anything, couldn't be
that when I plug all the clients (around 6000) some buffer overflows
(maybe a proc entry?) and ebtables/iptables stop routing?

  I still get the logs on /var/log/messages, but squid doesn't get anyt=
hing.

  Is there some proc entries I should check out?

  So far, the only one I changed to get the bridge up and running size-=
wise was:

echo 1000000 > /proc/sys/net/ipv4/netfilter/ip_conntrack_max

  Anything else is pretty much vanilla-default.

  If you guys could please CC me on the reply, I'd appreciate it.

  Thanks!

=46elipe Damasio

2009/12/24 Felipe W Damasio <felipewd@gmail.com>:
> =A0Hi,
>
> 2009/12/23 Felipe W Damasio <felipewd@gmail.com>:
>> =A0=A0But when I plug eth0 on the production environment network (wh=
ich
>> uses multiple VLANs, one for the users and another for the internet)=
,
>> http traffic stop working (ie. doesn't get routed to squid).
>
> =A0One other thing: I tried using --log-level debug --log-ip log--arp
> on the ebtables rules, and had several entries on my syslog such as
> this:
>
> Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC so=
urce
> =3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1a:a2:5d:70:8d proto =3D 0x0800=
 IP
> SRC=3D189.10.205.122 IP DST=3D189.73.192.220, IP tos=3D0x00, IP proto=
=3D6
> SPT=3D3774 DPT=3D80
> Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC so=
urce
> =3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1a:a2:5d:70:8d proto =3D 0x0800=
 IP
> SRC=3D189.10.204.12 IP DST=3D64.233.163.86, IP tos=3D0x00, IP proto=3D=
6
> SPT=3D1260 DPT=3D80
> Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC so=
urce
> =3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1d:71:b0:23:11 proto =3D 0x0800=
 IP
> SRC=3D189.58.246.156 IP DST=3D72.21.81.133, IP tos=3D0x00, IP proto=3D=
6
> SPT=3D2253 DPT=3D80
> Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC so=
urce
> =3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1d:71:b0:23:11 proto =3D 0x0800=
 IP
> SRC=3D189.58.247.99 IP DST=3D69.175.26.18, IP tos=3D0x00, IP proto=3D=
6
> SPT=3D49392 DPT=3D80
> Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC so=
urce
> =3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1a:a2:5d:70:8d proto =3D 0x0800=
 IP
> SRC=3D201.66.236.140 IP DST=3D174.140.128.6, IP tos=3D0x00, IP proto=3D=
6
> SPT=3D2060 DPT=3D80
>
> =A0I suppose it means that the ebtables rules are working. But why
> aren't they seen by the iptables rules?
>
> =A0Again, I tried using a single cross-cable connected machine and
> these rules worked (and got logged just the the above).
>
> =A0Could this be a kernel bug?
>
> =A0Cheers,
>
> Felipe Damasio
>
