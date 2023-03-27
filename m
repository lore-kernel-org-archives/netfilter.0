From: Daniel <tech@tootai.net>
Subject: Re: Creating a map programmatically with libnftnl
Date: Mon, 27 Mar 2023 19:27:14 +0200
Message-ID: <f6576546-966c-8e3a-804e-498227eec24e@tootai.net>
References: <CAOg40qgbgCoVZbv5UFhR9Gxp2MSYsAuBMs4nFeAyzj5imqSfCw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1679938035; bh=ptkoIKE0aauROCzcA8JAhnr+fJiimdZ9aL19PYlE/Ns=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=hwSvJ0HkFoRk86kEDtdvJvTRipgXNvauFbmH7t04dLrLHSOO8z6NPT4mYZy56rSYi
         TtH70SkErYTkNunO/w2R/t3o4JedUZVITPX26FrFP4kAcavrJXAbE0JjL/uScjoVAO
         6dUHFA4nWwTAB2ccvilXOyX2iv2j28V45+mu4CFM=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1679938034; bh=ptkoIKE0aauROCzcA8JAhnr+fJiimdZ9aL19PYlE/Ns=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=nNERdWpt+Ywzjn1cskLXvUxjk01IFtu9LwmuYtrsSgu6Hd4W4jU75QrDFM+NlBlIT
         s1nE/0APwihi2hFTgwoVtnyoK5XRtBJ2vCNjKiQs+IsXbmzsdPi3I9THzT6uH5oDFA
         mJhXVSokKvwrEkYCfjuQ/QK/6gerWwQyc82uQCkc=
Content-Language: fr-FR
In-Reply-To: <CAOg40qgbgCoVZbv5UFhR9Gxp2MSYsAuBMs4nFeAyzj5imqSfCw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello

Le 27/03/2023 à 19:22, Kiernan George a écrit :
> Hello,
>
> I asked this on 2022-06-30, but never received a response. Could you
> post an example using the libnftnl functions to create a map of the
> following type and insert elements:
>
> type ipv4_addr . inet_service : ipv4_addr
>
> I see an example for creating a set, but I can't figure out how to
> create a map and insert elements into it.

add map ip nat forward_tcp.lan { type ipv4_addr . inet_service : 
interval ipv4_addr . inet_service; flags interval; }

add element ip nat forward_tcp.lan { 192.168.10.24 . 58194-58198 : 
192.168.10.4 . 58194-58198  }

-- 
Daniel
