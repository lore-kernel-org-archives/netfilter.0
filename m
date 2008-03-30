From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Can netfilter conntrack ftp FXP ?
Date: Sun, 30 Mar 2008 15:58:33 +0200
Message-ID: <47EF9C89.1020100@plouf.fr.eu.org>
References: <deecbc160803292251kb0df43di2125a58a3fd0dfec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <deecbc160803292251kb0df43di2125a58a3fd0dfec@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Gary Bai a =E9crit :
>   And I tried to transmit two files between two FTP servers, but it's=
 failed.

Try loading the FTP conntrack module ip_conntrack_ftp or=20
nf_conntrack_ftp with parameter loose=3D1 on all involved machines (i.e=
=2E=20
client and both servers).

>   Why so many conntrack_helpers except fxp ?

Because it is considered insecure.
