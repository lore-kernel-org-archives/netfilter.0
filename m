From: Jari Laurila <jari.laurila@gmail.com>
Subject: Re: SNAT with ipsec => return packets not de-natted
Date: Thu, 5 Nov 2009 17:24:37 +0200
Message-ID: <a906663d0911050724t6411a20fy2f5530d04c18cafd@mail.gmail.com>
References: <a906663d0911011050w59ae675dmc70ee93132cf6990@mail.gmail.com>
	 <a906663d0911022254w6642c66aw17b9609624086a36@mail.gmail.com>
	 <a906663d0911031105g1f8a8a27o67cf77ab5fe73e54@mail.gmail.com>
	 <4AF17329.7010506@trash.net>
	 <a906663d0911042244x3faf2df4t55f3fe88e0fa2be6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=VomAoRP2nxX1FY7Eg46q2YgilRSInlCFpZfWwGFW4VQ=;
        b=b/kJm2LUrPvi7h/nf0xnbZY12yVKOJxjBOpIsAqLxRCFFqQaakohQKkM2by/6nYM4b
         okmyS+aAY7TCI8fRLedKp0bcs4CVsstzw/kNeueIvkRw5+MXPdDm8T6qSaQuMvcX/6WS
         C5xsP0aG+23GDiAVHV2Nb2iYA1SucFFvn8sdo=
In-Reply-To: <a906663d0911042244x3faf2df4t55f3fe88e0fa2be6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Thu, Nov 5, 2009 at 8:44 AM, Jari Laurila <jari.laurila@gmail.com> w=
rote:
> On Wed, Nov 4, 2009 at 2:27 PM, Patrick McHardy <kaber@trash.net> wro=
te:
>> Jari Laurila wrote:
>>> On Tue, Nov 3, 2009 at 8:54 AM, Jari Laurila <jari.laurila@gmail.co=
m> wrote:
>>>> Don't anyone have any clues for the problem I sent to the list on =
sunday?
>>>>
>>>> I find it really strange that decrypted packets coming from ipsec
>>>> tunnel with destination address xx.xx.xx.42 are sent through inter=
face
>>>> ext1 even though ip -s route get xx.xx.xx.42 says that packet shou=
ld
>>>> go through interface ext0b. Ipsec tunnel itself is going through
>>>> inteface ext1 but shouldn't packets get routed after they come fro=
m
>>>> tunnel? I even tried to look at kernel code to figure out why this
>>>> happens but I don't know enough about kernel and my c skills are a=
 bit
>>>> lacking, so I couldn't find the cause.
>>>>
>>>
>>> Update Netfilter sees packet at mangle table in PREROUTING chain (I
>>> added LOG rule), but nat table does not see the packet.
>>>
>>> I also have fwd policy defined for the connection in question:
>>>
>>> src srcip.srcip.srcip.secip/32 dst dstip.dstip.dstip.42/32
>>> =A0 =A0 =A0 =A0 dir fwd priority 0
>>> =A0 =A0 =A0 =A0 tmpl src gwip.gwip.gwip.gwip dst remgw.remgw.remgw.=
remgw
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 proto esp reqid 0 mode tunnel
>>
>> Try adding a TRACE rule to see how the packet traverses the netfilte=
r
>> hooks.
>>
> I did that. Here are the results:
>
> kernel: TRACE: raw:PREROUTING:policy:2 IN=3Dext1 OUT=3D MAC=3Dxxx
> SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
> PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WIN=
DOW=3D65535
> RES=3D0x00 ACK RST URGP=3D0
> kernel: TRACE: mangle:PREROUTING:rule:1 IN=3Dext1 OUT=3D MAC=3Dxxx
> SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
> PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WIN=
DOW=3D65535
> RES=3D0x00 ACK RST URGP=3D0
> kernel: TRACE: mangle:PREROUTING:rule:12 IN=3Dext1 OUT=3D MAC=3Dxxx
> SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
> PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WIN=
DOW=3D65535
> RES=3D0x00 ACK RST URGP=3D0
> kernel: TRACE: mangle:sanitychk_acl:return:38 IN=3Dext1 OUT=3D MAC=3D=
xxx
> SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
> PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WIN=
DOW=3D65535
> RES=3D0x00 ACK RST URGP=3D0
> kernel: TRACE: mangle:PREROUTING:policy:13 IN=3Dext1 OUT=3D MAC=3Dxxx
> SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
> PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WIN=
DOW=3D65535
> RES=3D0x00 ACK RST URGP=3D0
>
>
> Mangle chains policy is accept:
> # iptables -t mangle -vnL PREROUTING
> Chain PREROUTING (policy ACCEPT 46M packets, 21G bytes)
> ...
> Other rules
> ...
>
Gah.. I feel really stupid right now :|

My ipsec-tools.conf had typo I didn't notice until I read the confs
hundredth time:

I had lines
spdadd xx.xx.xx.42/32 aa.aa.aa.aa/32 any -P out ipsec
esp/tunnel/yy.yy.yy.yy-bb.bb.bb.bb/require;
spdadd aa.aa.aa.aa/32 xx.xx.xx.42/32 any -P in ipsec
esp/tunnel/yy.yy.yy.yy-bb.bb.bb.bb/require;

and the correct lines were
spdadd xx.xx.xx.42/32 aa.aa.aa.aa/32 any -P out ipsec
esp/tunnel/yy.yy.yy.yy-bb.bb.bb.bb/require;
spdadd aa.aa.aa.aa/32 xx.xx.xx.42/32 any -P in ipsec
esp/tunnel/bb.bb.bb.bb-yy.yy.yy.yy/require;

Still I think kernel should have better logging in situations like
these. I found absolutely nothing from logs when i investigated why my
setup failed...

Thanks anyway.. I hope I didn't waste too much of your time :)
