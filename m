From: Christian Pernegger <pernegger@gmail.com>
Subject: Re: Extremely slow upload (and more) from behind NAT
Date: Fri, 12 Aug 2011 18:45:19 +0200
Message-ID: <CAKbQEqG5kBPrqBqdMpyufWpioeE6A0_zpXgEPnYeCuPk3JmpxA@mail.gmail.com>
References: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com>
 <4E4555A2.4090705@tolaris.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=I/VPZnwC7MnxWUvz8JzrLEYozlXyz2qAO7wmlLjT+54=;
        b=MfykOExZDmVwMtmP5qeMz8k6RErwO3DaYG99DzC3hN6/OI9xR/44uYn5n62KXi7zti
         5/GqXbXF6/UYaOF+MFbUA7p0r7dwP+O5QwwMCW4V6ve7BhG3ujKwjHFQMxcpp/lVvu4/
         cTKjhzPbGjnhn4KuzlUNrZJVObwiMw5Oz0718=
In-Reply-To: <4E4555A2.4090705@tolaris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Tyler J. Wagner" <tyler@tolaris.com>
Cc: netfilter@vger.kernel.org

> Do you have any unusual routing loops or other network oddities? Just eth0 (external)
> and eth1 (internal)?

No, it's a bog standard setup. eth0 is the internal, eth1 the external
interface.

> Please post your iptables / iptables-restore script.

I did, in a way. It's really just that one line, "iptables -t nat -A
POSTROUTING -s 192.168.0.0/24 -o eth1 -j MASQUERADE", at the moment,
executed as a post-up command from /etc/network/interfaces.

Regards,

Christian
