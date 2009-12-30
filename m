From: Felipe W Damasio <felipewd@gmail.com>
Subject: Re: ebtables broute DROP problem in production environment
Date: Wed, 30 Dec 2009 02:08:18 -0200
Message-ID: <8a87046f0912292008t518031e1l8a1e21f8765e4616@mail.gmail.com>
References: <8a87046f0912231019l76e69a9eg52a529023d02237b@mail.gmail.com>
	 <8a87046f0912231022g438141afpfaa647ac0d01cdda@mail.gmail.com>
	 <8a87046f0912240513m4c3cd0f2u565ef8e8b849f58@mail.gmail.com>
	 <8a87046f0912291418x11b37daen604665a94108f128@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=WJmU9Eu95UU4cm/LbGNAGbfrLZhh6v7QaFs7MBTgu0Y=;
        b=ifuXxTzIgNPbAzhi9VPiB8DORn1db/o8SzXFOJmRZWLpMxGgEAGaEmYIUaMNLhAEEf
         RDBl/C7ZEU0ssvXLgqoDZmkwN1Ri9FoeZU+/24oB/uKvRPF7pQwsThtXKJ7EdKkYTW7A
         alG6NVEpi0SqspTlpe75LgZYcjPT89/53vMik=
In-Reply-To: <8a87046f0912291418x11b37daen604665a94108f128@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Bruno Gustavo Wallauer <brunogw@gmail.com>, pascal.mail@plouf.fr.eu.org

  Hi All,

2009/12/29 Felipe W Damasio <felipewd@gmail.com>:
> =A0- The traffic is passing through the bridge just fine;
> =A0- When I plug a single client everything works great;
> =A0- When I plug in the CMTS (all the cable modem clients, then),
> everything stops.

  I now see that iptables -t mangle -L -v shows growing matches:

pkts bytes target     prot opt in     out     source
destination
 7508  466K DIVERT     tcp  --  any    any     anywhere
anywhere            socket
37713   13M TPROXY     tcp  --  eth0   any     anywhere
anywhere            tcp dpt:http TPROXY redirect 0.0.0.0:3128 mark
0x1/0x1

  So the traffic _seems_ to be routed to port 3128. But how can I make
sure that squid is getting it?

  I don't get why it's not working....since it works with a single user=
=2E

  Thanks,

=46elipe Damasio
