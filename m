From: Gilles <gilles.ganault@free.fr>
Subject: Re: [1.3.6] "Couldn't find match `string'"?
Date: Sat, 02 Apr 2011 14:22:19 +0200
Message-ID: <r65ep6lc2ro2vpbpvqnjot0dvp2k0qa4oo@4ax.com>
References: <qbr8p69r6r6favuori53ct8bepfg8mefeo@4ax.com> <alpine.LNX.2.01.1103311426250.3599@obet.zrqbmnf.qr> <mt1ep6hsroebifmo1h99k3pss1lndge97c@4ax.com> <AANLkTimzHfHm4iZwpMiHUn8rdUYndW5yXdDCGujuN6d_@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sat, 2 Apr 2011 19:16:30 +0700, Pandu Poluan <pandu@poluan.info>
wrote:
>You can, however, save your iptables rules using iptables-save > file,
>and restore it from rc.local using iptables-restore < file. The file's
>name and location is up to you.

Thanks Pandu. I'll use "iptables-restore" from cat /etc/rc to
configure iptables at boot time.

