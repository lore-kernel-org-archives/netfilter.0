From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: Re: tc and virtual interfaces
Date: Fri, 10 Jul 2009 07:22:27 -0600
Message-ID: <bf0e93a30907100622y6b8a620ek2c2330aaeb0bc472@mail.gmail.com>
References: <4A572D8C.7010703@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=uIKChG/Y4Ho/QaQ4TtdTnwC8ZDartCLwWErh67RRm80=;
        b=f5NYDOjseQcm3Z9n+t2so3+VbDwqjR/wr569oqu6dfujFoNugt7v7Ocv38Ncnph9ER
         mJxU0ftZGMQkZJddfV4CJajqyW43LVzEhPCWpsKnHB9UB5eR8ddd0xyZz2V6XM2XIuy/
         vSKVlwegtTE8W80nhuFv7JCVp/T1kN1MVa+4c=
In-Reply-To: <4A572D8C.7010703@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

Good morning,

AFAIK iptables does not allow rules applied to eth0:x, the rules must
be applied to the physical interface ( eth0 ).

My suggestion for you is apply traffic shapping to the physical
interface and create rules in table mangle of iptables to identify the
traffic.

By example, create a class with tc to limit the ipsec traffic going
through the ipsec interface and other class for the traffic going
through the tun devices.

Then, using filters created with tc or by rules in the mangle table,
you can identify the traffic, set the class.

The scenary will be a little bit more complicated if you want filter
traffic going through the tunnels both I think that can be acomplished
but this will be added unnecesary complexity to the environment.

Jorge D=E1vila.


On Fri, Jul 10, 2009 at 6:01 AM, Fabio Marcone<fabio.marcone@duet.it> w=
rote:
> Hi all,
> I need to add traffic shaping in a linux router (debian) and I need t=
o
> understand tc behaviour with virtual interfaces.
>
> Examples:
> I have eth0 and eth0:0, if I set a limit on eth0 datarate, is also et=
h0:0
> involved?
> ...or...
> If I have a tunnel OpenVPN (tun0) on eth0, how is managed data rate l=
imit?
>
> Thanks in advance,
> Fabio (I hope this post is not OT)
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Jorge Isaac D=E1vila L=F3pez
+505 8430 5462
jorgedavilalopez@gmail.com
---
Esta tierra es Linux. En las noches calladas puede escucharse a las
m=E1quinas Windows re-inici=E1ndose...
