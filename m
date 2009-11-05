From: Jari Laurila <jari.laurila@gmail.com>
Subject: Re: SNAT with ipsec => return packets not de-natted
Date: Thu, 5 Nov 2009 08:44:11 +0200
Message-ID: <a906663d0911042244x3faf2df4t55f3fe88e0fa2be6@mail.gmail.com>
References: <a906663d0911011050w59ae675dmc70ee93132cf6990@mail.gmail.com>
	 <a906663d0911022254w6642c66aw17b9609624086a36@mail.gmail.com>
	 <a906663d0911031105g1f8a8a27o67cf77ab5fe73e54@mail.gmail.com>
	 <4AF17329.7010506@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=tXHzsnbYRSfjqacJ09NS4MksX48hm2qvHpBbmFnZFuo=;
        b=XXawtpO+nfKBtDJEkpcp3/j/ePhr8eBdHo/mc9U2XuDsQocjsa8ZSmkK58PARV3kCr
         CatoMYCSFvA4R9vF9N4qY4EGl9FH6bLtdMvW75NkTAB5ir6GKZp6lWMu+T8DAPPcw4gT
         2hQRPaY1EEk2/W40vdcjOO1ZqBAF8Mbi8qGxw=
In-Reply-To: <4AF17329.7010506@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Wed, Nov 4, 2009 at 2:27 PM, Patrick McHardy <kaber@trash.net> wrote=
:
> Jari Laurila wrote:
>> On Tue, Nov 3, 2009 at 8:54 AM, Jari Laurila <jari.laurila@gmail.com=
> wrote:
>>> Don't anyone have any clues for the problem I sent to the list on s=
unday?
>>>
>>> I find it really strange that decrypted packets coming from ipsec
>>> tunnel with destination address xx.xx.xx.42 are sent through interf=
ace
>>> ext1 even though ip -s route get xx.xx.xx.42 says that packet shoul=
d
>>> go through interface ext0b. Ipsec tunnel itself is going through
>>> inteface ext1 but shouldn't packets get routed after they come from
>>> tunnel? I even tried to look at kernel code to figure out why this
>>> happens but I don't know enough about kernel and my c skills are a =
bit
>>> lacking, so I couldn't find the cause.
>>>
>>
>> Update Netfilter sees packet at mangle table in PREROUTING chain (I
>> added LOG rule), but nat table does not see the packet.
>>
>> I also have fwd policy defined for the connection in question:
>>
>> src srcip.srcip.srcip.secip/32 dst dstip.dstip.dstip.42/32
>> =A0 =A0 =A0 =A0 dir fwd priority 0
>> =A0 =A0 =A0 =A0 tmpl src gwip.gwip.gwip.gwip dst remgw.remgw.remgw.r=
emgw
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 proto esp reqid 0 mode tunnel
>
> Try adding a TRACE rule to see how the packet traverses the netfilter
> hooks.
>
I did that. Here are the results:

kernel: TRACE: raw:PREROUTING:policy:2 IN=3Dext1 OUT=3D MAC=3Dxxx
SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WINDO=
W=3D65535
RES=3D0x00 ACK RST URGP=3D0
kernel: TRACE: mangle:PREROUTING:rule:1 IN=3Dext1 OUT=3D MAC=3Dxxx
SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WINDO=
W=3D65535
RES=3D0x00 ACK RST URGP=3D0
kernel: TRACE: mangle:PREROUTING:rule:12 IN=3Dext1 OUT=3D MAC=3Dxxx
SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WINDO=
W=3D65535
RES=3D0x00 ACK RST URGP=3D0
kernel: TRACE: mangle:sanitychk_acl:return:38 IN=3Dext1 OUT=3D MAC=3Dxx=
x
SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WINDO=
W=3D65535
RES=3D0x00 ACK RST URGP=3D0
kernel: TRACE: mangle:PREROUTING:policy:13 IN=3Dext1 OUT=3D MAC=3Dxxx
SRC=3Dremote_server DST=3Dxxx.42 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D=
55 ID=3D43368
PROTO=3DTCP SPT=3D21 DPT=3D1261 SEQ=3D4137897325 ACK=3D3664330034 WINDO=
W=3D65535
RES=3D0x00 ACK RST URGP=3D0


Mangle chains policy is accept:
# iptables -t mangle -vnL PREROUTING
Chain PREROUTING (policy ACCEPT 46M packets, 21G bytes)
=2E..
Other rules
=2E..
