From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Redirecting external IP/Port from localhost to an ssh tunnel
 on localhost
Date: Sat, 24 Oct 2015 15:47:10 +0200
Message-ID: <562B8BDE.2050509@plouf.fr.eu.org>
References: <CAHfhYmybX5R2Qo6dMTfMdcHBk7N_xsZQ548Hf5DZCZF9pv=QYA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHfhYmybX5R2Qo6dMTfMdcHBk7N_xsZQ548Hf5DZCZF9pv=QYA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gaetan Lord <email@gaetanlord.ca>
Cc: netfilter <netfilter@vger.kernel.org>

Gaetan Lord a =E9crit :
>=20
> From my computer, I have an application trying to reach a external
> host/IP but I would like to redirect all the packets to a local port.

=46or example :
iptables -t nat -A OUTPUT -d $ORIGINAL_IP -p tcp --dport $ORIGINAL_PORT
-j DNAT --to $LOCAL_IP:$LOCAL_PORT
