From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Problem setting up nftables dnat : dport set to 0 instead of
 requested value (22)
Date: Wed, 10 Dec 2014 21:29:58 +0100
Message-ID: <CAOkSjBgiXs3b1zrQ8vKgnnf=sDBVFQbbH7zfP+PAbnhhQzvQSg@mail.gmail.com>
References: <54885B08.1010700@c-s.fr> <20141210182244.GA5622@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=dk/YngOpK+NESTzSqAXNS+8fzgymdt7GbGw2jRlrw4M=;
        b=BYN8A6jrerBXwTsWghMGq04kkwDsslmnUym4yyyLO7rLLULTG0GLps9j+1WQVlNR3d
         i8Vec+8VjGJe08O9cyvQa99CwZkslK3xgXtG1qZix5UiwOG3+S1oJqPrr9lkuUt+Z8Xm
         dW/Eg9/6QBaUMFu1tUY+xRJal4CF6jnv9R0W3nqwkeGAXf730ov/4Fk87XPM0LEiEkPS
         Ve4PPFM/x9BInYqween/4P6KbBncZCToUmhAl502OJEAdmXe47xwZtrlGbXmHV16/U1u
         Z6jpMnLPAvlUPRFzIUhawUVBc3prbJYrSHppQc1lvh75RaOIlywMGAPeg/HaraeR7LGD
         aI/A==
In-Reply-To: <20141210182244.GA5622@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: leroy christophe <christophe.leroy@c-s.fr>, Netfilter Users Mailing list <netfilter@vger.kernel.org>, GUITTON Alex <alex.guitton@c-s.fr>

On 10 December 2014 at 19:22, Pablo Neira Ayuso <pablo@netfilter.org> w=
rote:
>
> @Arturo: Could you add documentation for your 'redirect' support to ?
>

Done:

http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Add=
ress_Translation_(NAT)#Redirect

regards.

--=20
Arturo Borrero Gonz=C3=A1lez
