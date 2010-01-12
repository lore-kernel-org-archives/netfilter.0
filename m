From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Iptables without ipt_state using xt_state
Date: Tue, 12 Jan 2010 23:43:22 +0100
Message-ID: <4B4CFB0A.3070407@plouf.fr.eu.org>
References: <4B4CB29D.9000506@gmail.com> <4B4CC130.40204@chello.at> <4B4CDEBE.2040304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4CDEBE.2040304@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

=46iloSottile a =E9crit :
>=20
> root@vps:~# ls /lib/xtables/ | grep state
> libxt_state.so
>=20
> Does it assure that i have the xt_state module loaded?

No. This is a shared library, just a piece of the userland iptables.
If you have access, you can check the kernel config file in /boot or in
/proc/config.gz.
