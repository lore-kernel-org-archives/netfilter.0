From: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Subject: Re: VoIP conntrack issue
Date: Wed, 14 Nov 2012 13:35:50 +1100
Message-ID: <CABY2qi8BmP4t1=4gj4iW1niTJWNagTbeVu=C+t6S2WvfyRttBg@mail.gmail.com>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com>
 <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com>
 <alpine.LNX.2.01.1211140225280.4653@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=nxXiLWFuG4VbOKreLhfHKucB1KSFuKvqF8Oxm0QTo48=;
        b=DCnkWepM9wPhZ+/qPIaV7tahQC2KJ9d2DNrIYnHZbDyXSkFdN8pDz53wvgMkxRCXnl
         04BEwANk+Jfj0WrpxDXiN+PFMdrOQzMKTB+UYCJfjpE8EUmsNwfafAdazA295I1+HLeL
         Wp66EWj0xRFVBswgzm7spgW9eT+LVobXyYX32tWyP5Ox6Ua9Pnh87LmXM3bPP0soAWqV
         sNFWt+2wvwatF2XjXO9fM9E2j6BbHNO0/MCUfZ8mfWT03cnCX2M5CZLhAmokdQVOBgqp
         SWaWOp/RnPm44ziM7POfCYgi5wiJqx3t+viYyHvqfvlGPC6K9+9/Vvy3HuUb/VsURDdU
         I32A==
In-Reply-To: <alpine.LNX.2.01.1211140225280.4653@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter <netfilter@vger.kernel.org>

Yes, see and that's the point!

Why is there only one port mapping?
That is a very simple NAT. We should have a port mapping by external
IP AND Port.

As an example:
I have internal host A and B and external host C and D

Case 1)
A:1000 -> router:1000 -> C
B:1000 -> router:1000 -> D

Case 2)
A:1000 -> router:1000 -> C
A:1000 -> router:1000 -> D

Case 3)
What doesn't work for obvious reasons is:
A:1000 -> router:1000 -> C
B:1000 -> router:1000 -> C

So can someone please confirm that linux doesn't do Case 1 and Case 2?
And at the same time can someone please give me the email address of
the developer who is responsible for this (incomplete) code?
There are plenty of firewalls/Nat's out there which can cover Case 1&2
and I think it's pretty sad that linux (with it's highly developed
networking stack) is incapable of handling these cases, as this is not
a special case, from my point of view it looks like laziness from the
developer in not supporting this...

Thanks Jan, for the explanation, I was guessing that, but I wasn't
sure as this seems to be missing functionality...
and to be honest I am pretty sure, that there are switches, with which
you can enable that functionality, you just have to know where it
is....


On Wed, Nov 14, 2012 at 12:47 PM, Jan Engelhardt <jengelh@inai.de> wrot=
e:
> On Tuesday 2012-11-13 04:20, J=C3=B6rn Krebs wrote:
>
>>Not really, as I use the devices behind the firewall, in many
>>networks, so I need one setup that works.
>>
>>But to be honest, I don't like to start this discussion:
>>My question is, why can netfilter not reuse the same port?
>
> Because the port is still "in use" - in this case, the STUN from earl=
ier
>
>>smartbyte:~ # conntrack -E
>># Here is the STUN-Part
>>[NEW] udp      17 60 src=3D192.168.1.38 dst=3D216.93.246.14
>>                     sport=3D44608 dport=3D3478 [UNREPLIED]
>>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>>                     sport=3D3478 dport=3D44608
>>[NEW] udp      17 60 src=3D192.168.1.38 dst=3D216.93.246.14
>>                     sport=3D57890 dport=3D3478 [UNREPLIED]
>>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>>                     sport=3D3478 dport=3D57890
>>[UPDATE] udp   17 59 src=3D192.168.1.38 dst=3D216.93.246.14
>>                     sport=3D44608 dport=3D3478
>>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>>                     sport=3D3478 dport=3D44608
>>[UPDATE] udp   17 59 src=3D192.168.1.38 dst=3D216.93.246.14
>>                     sport=3D57890 dport=3D3478
>>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>>                     sport=3D3478 dport=3D57890
>
> 2x2 STUN probes sent
>
>>[UPDATE] udp  17 600 src=3D192.168.1.38 dst=3D216.93.246.14
>>                     sport=3D44608 dport=3D3478
>>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>>                     sport=3D3478 dport=3D44608 [ASSURED]
>>[UPDATE] udp  17 600 src=3D192.168.1.38 dst=3D216.93.246.14
>>                     sport=3D57890 dport=3D3478
>>                     src=3D216.93.246.14 dst=3D114.XX.234.123
>>                     sport=3D3478 dport=3D57890 [ASSURED]
>
> STUN replies. Note how the timeout for the CT entry is raised to 600
> seconds.
>
>># STUN ended - Two connections assureds, ports: 44608 and 57890
>
> NFCT cannot know that. For NFCT, the STUN UDP pseudo-connection
> is still (considered) active for another 600 seconds.
> However that does not seem to be the issue; more precisely:
>
>
>># Now we try to connect to the VoIP Server source port 44608 and 5789=
0
>>[NEW] udp      17 60 src=3D122.XX.115.203 dst=3D114.XX.234.123
>>                     sport=3D10020 dport=3D44608 [UNREPLIED]
>>                     src=3D114.XX.234.123 dst=3D122.XX.115.203
>>                     sport=3D44608 dport=3D10020
>
> Host 122 contacts 114:44608, and there is no mapping done on
> this CT. Therefore,
> <122.XX.115.203:10020 -- 114.XX.234.123:44608> is now in use.
>
>>[NEW] udp      17 60 src=3D192.168.1.38 dst=3D122.XX.115.203
>>                     sport=3D57890 dport=3D10021 [UNREPLIED]
>>                     src=3D122.XX.115.203 dst=3D114.XX.234.123
>>                     sport=3D10021 dport=3D57890
>>[NEW] udp      17 60 src=3D192.168.1.38 dst=3D122.XX.115.203
>>                     sport=3D44608 dport=3D10020 [UNREPLIED]
>>                     src=3D122.XX.115.203 dst=3D114.XX.234.123
>>                     sport=3D10020 dport=3D1030
>
> <192.168.1.38:44608 -- 122.XX.115.203:10020> would normally be mapped
> to <114.XX.234.123:44608 -- 122.XX.115.203:10020> because of your
> MASQUERADE rule. However, <114 -- 122> is already taken (see above).
>
> So far that I can see at this time of day.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Bye Bye, J=C3=B6rn Krebs
--------------------------------------------
64 Queen St., Blackstone 4304
Phone: +61731363381
Mobile: +61431068955
Telefon: +495516345347
