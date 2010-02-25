From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: tcp dump and DROP
Date: Thu, 25 Feb 2010 09:46:28 +0000
Message-ID: <56378e321002250146s638dd7c9y6c3d9c6b909bb0f6@mail.gmail.com>
References: <cfeab66d1002250143q162340b7w8b36094d77bfca35@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=zuohNqFoort7lUCmVIapIuh5wZroJ6GkPGZtue9f+ok=;
        b=FCjcK+R1zyrKh6FmmRhJUzsiP+AriUAzYvSovmtGjxGV4Baa1onoKd7xCyV5uFGyyY
         ZwJHsjduaEMHILA1Ep2XB3JcUckZoAeEYZk7KoUHWx0fvSxyI9zT2cyV3vZ1LjFqG0R2
         bdC86oYGqlYWI7puvoykjwrXElM84DeLbUn44=
In-Reply-To: <cfeab66d1002250143q162340b7w8b36094d77bfca35@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On 25 February 2010 09:43, ratheesh k <ratheesh.ksz@gmail.com> wrote:
>
> if i drop a packet using
>
> =A0 =A0 =A0 =A0 =A0 =A0 iptables -A INPUT -i eth0 -j DROP
>
> Can i see those packets using =A0 =A0tcpdump -i eth0 =A0?
>
> IF =A0i drop packets in FORWARD chain
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0iptables -A FORWARD -i etho -o eth=
1 -j DROP
>
> can i see those packets in =A0tcpdump -i eth0 ?
>
> Thanks,
> Ratheesh


Yes.

--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
