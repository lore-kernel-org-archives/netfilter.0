From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port Forwarding
Date: Sun, 11 Oct 2009 10:37:46 +0200
Message-ID: <4AD1995A.9020601@plouf.fr.eu.org>
References: <1572887654.20091011013039@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1572887654.20091011013039@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

jen140@gmail.com a =E9crit :
> I  wanted  to configure port forwarding, and forward port 135 from An=
y
> address  that  comes from eth0 (internet) to ip 192.168.0.200 and sam=
e
> port(135).
[...]
> But   the   problem   is   that  it  is  filtered  (I  check  it  wit=
h
> nmap-online.com service).

Did you check with a packet sniffer that these packets are actually
received by the internet interface ? They may be filtered by either you=
r
ISP or the sender's ISP.
