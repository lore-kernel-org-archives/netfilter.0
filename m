From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Help Needed In Modifying Standalone Firewall Rules to Support
 Port-Forwarding
Date: Mon, 09 Dec 2013 00:44:18 +0100
Message-ID: <52A50452.2080700@plouf.fr.eu.org>
References: <CACK8u8JPTENmRkdQ5LX4C1jctqMgYYEeF-FfzHOWd2jZfyMyoA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACK8u8JPTENmRkdQ5LX4C1jctqMgYYEeF-FfzHOWd2jZfyMyoA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Notify Me <notify.sina@gmail.com>
Cc: netfilter@vger.kernel.org

Notify Me a =E9crit :
>=20
> *filter
> :FORWARD DROP [0:0]
> -A FORWARD -i eth0 -p tcp -m state --state NEW -m recent --set --name
> DEFAULT --rsource
> -A FORWARD -i eth0 -p tcp -m state --state NEW -m recent --update
> --seconds 30 --hitcount 10 --name DEFAULT --rsource -j DROP

No ACCEPT here, so this ruleset drops all packets in the FORWARD chain.
