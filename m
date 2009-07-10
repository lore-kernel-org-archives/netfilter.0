From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: Re: tc and virtual interfaces
Date: Fri, 10 Jul 2009 07:56:03 -0600
Message-ID: <bf0e93a30907100656o7388cbdbw984f3e90786033d5@mail.gmail.com>
References: <4A572D8C.7010703@duet.it> <4A573D34.7080100@plouf.fr.eu.org>
	 <4A5747FC.1040509@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=z8v1LlExXMFF1uRwKXSDjK+13+mCxBhmCH62hT9OdNc=;
        b=C/bKyBt88xh+bhJr9HLY8GpImomkW9x6I/JcSRtbGLg4YMuFISQMRd29523Olg5Ihm
         nQSQN5Q/RjkuUicj7cM9aq+pZK0rxqteR2qHvUdvyfYFOZMg+ZLNSPlbjvZZaHKlkIHO
         Z9RTXZyFZkzSJJUuyTuUGQNcTeUAygPc2P3a4=
In-Reply-To: <4A5747FC.1040509@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

The traffic shapping must be applied to the physical interface ( eth0
in this case).

Jorge D=E1vila.

On Fri, Jul 10, 2009 at 7:54 AM, Fabio Marcone<fabio.marcone@duet.it> w=
rote:
> thanks for your reply,
>>
>> eth0:0 is not an interface, it is an IPv4 alias on eth0. The real an=
d only
>> interface here is eth0.
>
> ok, so I can't set up a queue on it, isn't it?
>
>>
>> tun0 is an interface on its own. However, if encapsulating traffic h=
appens
>> to go through eth0, it will be affected by traffic shaping just as a=
ny other
>> traffic going through eth0.
>
> ok, and I can limit datarate on tun0 and on eth0 ? the first is appli=
ed only
> on vpn packets and the last on all eth0 outgoinig traffic I think...
>
>
> thanks,
> Fabio
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
