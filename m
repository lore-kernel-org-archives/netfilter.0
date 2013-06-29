From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: ftp tracking for outgoing connections
Date: Sat, 29 Jun 2013 13:09:12 +0200
Message-ID: <51CEC058.7020409@plouf.fr.eu.org>
References: <CALE+ZtAxnV4BjeiJc22-TkRjBnn=GZ62nz0TfT1F6vhnbDLBcg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALE+ZtAxnV4BjeiJc22-TkRjBnn=GZ62nz0TfT1F6vhnbDLBcg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: adam <adam_vs@o2.pl>
Cc: netfilter@vger.kernel.org

Hello,

adam a =E9crit :
>=20
> I don't want to DNAT outgoing sftp and ftp connections. Exceptions
> work well with sftp but FTP of course not because it uses another dat=
a
> chanell - in passive mode another outgoing connection from high port
> to high port. I don't think conntrack can track ougoint FTP protocol
> connections.

Of course it can, with the FTP conntrack helper nf_conntrack_ftp loaded=
=2E
See also the RELATED state and the "helper" match in the iptables man p=
age.
