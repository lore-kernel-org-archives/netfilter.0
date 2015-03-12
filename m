From: Stuart Shelton <srcshelton@gmail.com>
Subject: Re: ebtables: ebtables-restore segfaults when 'among' list has many items
Date: Thu, 12 Mar 2015 12:02:43 +0000
Message-ID: <6800B1DC-416A-42CA-9716-B436D589CC69@gmail.com>
References: <2B1BE39E-516E-4C80-8137-553E21E5803C@gmail.com> <ED3912FE-6C60-4638-B38D-B68D600C7317@gmail.com> <CAOkSjBgFfHSY8NmGfockjs-5FSni-69eMzFR2r0JY1Gr0UnuSQ@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=UqOr+lkKmsuZTSJgc9O83E5GW6N8T/ui6ANufwO6QqQ=;
        b=sil9IJnOVad/TnvrZOD4WFzTbvLcc7hLbkyn5BtQGtT6GuiU7pO3qKz/4TJWNS35rv
         mbAyI72tnuBTouinUaCK6EDsMG4jxhTkz/Lh9R42MBIJvrF9cfCUCtvWpMc+uZpVfeNS
         VNcnrZqUzUvNqBSM4zGuCThlJQEKg3uVcxwgs+YJdiqvqDuohUDkHIuVw5Q6K9jM0J1P
         1uOu2lOXXUAoieB+UQGNKTw86ZOjnXrp49RKTG/IK7Z9lp8QBUKngkSi7HtsX/jaHavq
         rXMLmAzltyQ/rm1UUetwjT0okBHeIUAHjxdkVa4PmWJwyRgtt9Senm9tqhQLJusCvpFb
         T5qQ==
In-Reply-To: <CAOkSjBgFfHSY8NmGfockjs-5FSni-69eMzFR2r0JY1Gr0UnuSQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>


> On 12 Mar 2015, at 11:24, Arturo Borrero Gonzalez <arturo.borrero.gle=
z@gmail.com> wrote:
>=20
>> On 12 March 2015 at 01:11, Stuart Shelton <srcshelton@gmail.com> wro=
te:
>>=20
>> Right - I think I=E2=80=99ve fixed all of these=E2=80=A6
>=20
> (Unrelated)
>=20
> Would give a try to nftables? It would be interesting for us to see
> how could you emulate the ebtables among extension with native
> nftables mechanisms.

Good point - I want to be able to filter on both source and destination=
 MAC addresses (for outbound and inbound traffic - and iptables can onl=
y handle source filtering), and using ebtables does require that I crea=
te single-interface bridges in order for it to take effect.

nftables could be a much better solution, so long as its capabilities e=
xtend beyond what iptables offers.  I'll look into it!

Cheers,

Stuart