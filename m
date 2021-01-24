From: "Eliezer Croitoru" <ngtech1ltd@gmail.com>
Subject: RE: Use case of nftables + Linux combination as network firewall
Date: Sun, 24 Jan 2021 12:53:06 +0200
Message-ID: <003f01d6f23f$1984bfc0$4c8e3f40$@gmail.com>
References: <CAEx-Y1-yWpUcfQKe_gkkuEhpRr2Nm59CjRp61dA5-GS8os5ihw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=ypAzOQ+hfGnjagcmmchM6xL4dF3zyIxwE5N/UAE+wuU=;
        b=ophIAbdPcTBY7s11DpHulyUQM4jZI42rjBcBt11wcmfyeiKfx9eO3M7++r4mh3Kj/2
         C8gCLD3+jrzAzq5mK7A/mZPOk6jv+DImwgu+0q06RuH4rJeab04vU5pQIsxC0AnBY0nc
         2Dg6fJWOVUMSygifE9KA4JdyeftM5eA4yHJ6DGOd4wsCHRuEXxZzFVmm77cNOgVKmFLo
         kR9h0cc7p/QQ2qGcD9n+x+HvcvFe3j/h+8Rv1n8qO1oQErg6JNUwUzwemqI8xZ82qtXv
         6XKmMcxd9ViraNxPcBC0ux1idXLk+1rYcScULIEZwT0jbhrcezv8lbZKzxseESnxou+c
         KitQ==
In-Reply-To: <CAEx-Y1-yWpUcfQKe_gkkuEhpRr2Nm59CjRp61dA5-GS8os5ihw@mail.gmail.com>
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: 'Younwook Jang' <younwook@gmail.com>

A few examples:
https://www.dataswitchworks.com/vRouter.asp
https://vyos.io/

I am not sure what is the question regarding nftables.
The above products and many others are using iptables which in turn can =
be replaced with nftables based.
The only difference between nftables and iptables is the actuall rules =
to add or remove rules and details into
ipset this or another.

What would expect from a Firewall else that what vyos or brocade offers?

Eliezer

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com
Zoom: Coming soon


-----Original Message-----
From: Younwook Jang <younwook@gmail.com>=20
Sent: Friday, January 22, 2021 3:32 PM
To: netfilter@vger.kernel.org
Subject: Use case of nftables + Linux combination as network firewall

Dear netfilter users,

I'm looking that real reference case that uses nftables+Linux server
as network firewall.

Would you please share reference cases or related information ?

I think that Linux VM with well-configured nftables can be act as
network firewall especially cloud environment.

Please share your advice.

thanks, regards.

