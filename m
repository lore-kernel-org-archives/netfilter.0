From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: symmetric NAT and ICMP
Date: Wed, 5 May 2010 17:11:30 +0530
Message-ID: <AANLkTiln6wQNP2MnQRSmBV9a-xV1hnINp5D0Q3EClq-p@mail.gmail.com>
References: <AANLkTinm_rvGHEZQ_RpBqfvERQgI1JXNlBjn00owut6o@mail.gmail.com>
	 <4BE156A3.2010204@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=6eZ/vBveGWDrKhq3SzCw4pqFKeVC76gfQzq38qpHylY=;
        b=vVWfSOiHoUebC5qhw06uJuQ4zjEEO/MA0pWe2PP28Y2SuPKTPgyjk0UjhJZSdC+eRz
         6Fx6yHCribDdEa/zM0S0vW87SQlEY1OoDX1zcro9Z/p1OBPLsX2v8x1TzP53IUMUFS7f
         6C8wDSesH6gX1M0RT6d1kch+jpdptSuqgrtV4=
In-Reply-To: <4BE156A3.2010204@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

> Two different pings with the same source and destination but differen=
t
> identifiers create two separate conntrack entries.

Beautiful . Thanks a ton .



On Wed, May 5, 2010 at 4:59 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> ratheesh k a =E9crit :
>>
>> My understanding is : - NAT on Router R is =A0symmetric nat . I am a=
ble
>> to browse internet from both machine A =A0and B .
>>
>> My question is : Can Router R can support different types of NAT
>> simultaneously ( full cone nat =A0,address restricted nat ....etc ) =
?
>
> I don't think so. NAT behaviour is determined by how the connection
> tracking works.
>
>> IF only one type of nat is supported , how "ping =A0google.com " wor=
ks
>> from both machine ? icmp dont have any port information .Still
>> icmp-reply gets routed to correct machine ?
>
> ICMP request/reply types (echo, timestamp...) contain an identifier
> field that helps matching requests and replies (Cf. RFC 792). Conntra=
ck
> uses it, see /proc/net/ip_conntrack or /proc/net/nf_conntrack, e.g. :
>
> icmp =A0 =A0 1 27 src=3D192.168.0.1 dst=3D192.168.0.2 type=3D8 code=3D=
0 id=3D62027
> [UNREPLIED] src=3D192.168.0.2 dst=3D192.168.0.1 type=3D0 code=3D0 id=3D=
62027 use=3D2
> mark=3D0
> icmp =A0 =A0 1 14 src=3D192.168.0.1 dst=3D192.168.0.2 type=3D8 code=3D=
0 id=3D61259
> [UNREPLIED] src=3D192.168.0.2 dst=3D192.168.0.1 type=3D0 code=3D0 id=3D=
61259 use=3D1
> mark=3D0
>
> Two different pings with the same source and destination but differen=
t
> identifiers create two separate conntrack entries.
>
