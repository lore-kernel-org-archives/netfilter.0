From: Ajay Lele <ajay.lele@gmail.com>
Subject: Re: Mark packets/Transfer data from iptables to QUEUE
Date: Sun, 23 May 2010 16:15:04 -0700
Message-ID: <AANLkTim3A02wX8Ssy4jurH5M6DNVVH1AhZRQrJfaZNNX@mail.gmail.com>
References: <AANLkTimSsbzA3pBz3QyjHN4-LnEwou7oaNRkEsaZ9QGs@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ld4C9h0AmUorA3tnM5r1PVg4K5Spjt6RUiu3P3BVbK0=;
        b=j1M7UEhUdzGtKtbn8waZCoTFR+M+CMN/nMp7hiFk2nQR9X1GsQjtUxRi3kUSKnvVqT
         +KbxNK2/ZIqc45bleEvUkYVlvu70ha2F5mj8GhbhkQPX9skaHeoBdmRPnBLBNq0DC3t7
         wPrsUX5HzcWr8P53nCiCOhNjdbvl+QyUFiWCs=
In-Reply-To: <AANLkTimSsbzA3pBz3QyjHN4-LnEwou7oaNRkEsaZ9QGs@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mistick Levi <gmistick@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Levi

On Sun, May 23, 2010 at 12:22 PM, Mistick Levi <gmistick@gmail.com> wro=
te:
> Hi,
> I'm using libnetfilter_queue, and i would like to treat packets from
> different rules differently, in the same queue.
> Example:
> rulematch: ipsrc: 123.132.123.232 ipdst =3D 1.2.3.4 udp port-12321 -J
> NFQUEUE --queue-num 2 =A0- "DANPACKET"
> rulematch ipsrc: 123.132.123.232 ipdst =3D 1.2.3.4 udp port-12221 -J
> NFQUEUE --queue-num 2 =A0 - "LaneyPacket"
>
> And when this messages get to userspace application, i want to be abl=
e
> to extract the comment and treat each packet by a different method...
> Any idea's?

You can set a different mark on the packets belonging to each stream
using iptables -j MARK --set-mark, and then call different method in
userspace based on the value of mark on the received packet

Regards
Ajay

>
> Kind regards
> Levi Yechiel
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
