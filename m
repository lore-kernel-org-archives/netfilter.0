From: Jeremy Audet <ichimonji10@gmail.com>
Subject: Re: Service names
Date: Thu, 21 Dec 2017 17:36:18 -0500
Message-ID: <CA+A7n+g2Yz2+FT5bDE8Wh5EtFjseRMUu+OScTE1pUb-5zdM4Ug@mail.gmail.com>
References: <CA+A7n+iG06Tp9oaYCWUDPsoqV=JN4BVQZHtPvxqA8ZTQhAfmqg@mail.gmail.com>
 <20171220222546.gw3wvgyq6z2brwt7@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=y+qUjzg8alT1k/eVxTgbmMxXpdnnPBHDsB6i4IZKKTU=;
        b=lL7XpoyRwkZbZ9luRLfPdfxBXzDzIYBpOKn18SQuiGhQ37Y/Qwzxbq0jVpafh0eCgw
         ZQEcQ9XUa8hNzKHuwtvEqNLk5kUTgag56lH1J24iuBZdIDSQ6ThNPKnmuTKZR/8Fpr3B
         bL7VQipiPNQwGSVItOWyMU240zpKJFO4qhIDvrwZEKKmmqwe0VEkEFPGQgjgvV9wOviy
         j2SIDegChf0eMAdVrWYM9TC37Lv7QHjcudzy1CVRcpOM7/7gj6q/Max9MkP9pUbh+kjz
         SUYqnbGuH4SBHG/0WzUAcigsu0TF5TSHkxAZwLp0yzEVAb+G3eOa94cu5SHYOcuDe9tZ
         bNPQ==
In-Reply-To: <20171220222546.gw3wvgyq6z2brwt7@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

>> * Is there some way to view the name-to-port mappings exposed by
>> inet_service, aside from digging around in source code?
>
> # nft describe tcp dport
> [...]

Perfect. Thanks!

>> * Is there some way to provide insert custom name-to-port mappings
>> into the inet_service lookup table? Or is this a terrible, horrible,
>> no-good idea?
>
> There is not, but probably you want to define a variable for this
> instead in your ruleset.

Variables are definitely a better way to handle things.

For the record, and in case someone else googles their way to this
archived conversation, I consulted with the nftables wiki scripting
page, [1] and wrote some variables like this:

    define ssh_srv1 = 30022
    define syncthing_core_user1 = 22000
    define syncthing_core_user2 = 22001
    define services_srv1 = {
        $ssh_srv1,
        $syncthing_core_user1,
        $syncthing_core_user2,
        http,
        https
    }

[1] https://wiki.nftables.org/wiki-nftables/index.php/Scripting
