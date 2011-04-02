From: Pandu Poluan <pandu@poluan.info>
Subject: Re: [1.3.6] "Couldn't find match `string'"?
Date: Sat, 2 Apr 2011 19:16:30 +0700
Message-ID: <AANLkTimzHfHm4iZwpMiHUn8rdUYndW5yXdDCGujuN6d_@mail.gmail.com>
References: <qbr8p69r6r6favuori53ct8bepfg8mefeo@4ax.com>
	<alpine.LNX.2.01.1103311426250.3599@obet.zrqbmnf.qr>
	<mt1ep6hsroebifmo1h99k3pss1lndge97c@4ax.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <mt1ep6hsroebifmo1h99k3pss1lndge97c@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilles <gilles.ganault@free.fr>, netfilter@vger.kernel.org

(sorry for top-posting; Gmail mobile)

iptables -- or, to be precise, netfilter -- is an in-kernel facility;
it does not have a configuration file.

You can, however, save your iptables rules using iptables-save > file,
and restore it from rc.local using iptables-restore < file. The file's
name and location is up to you.

Rgds,


On 2011-04-02, Gilles <gilles.ganault@free.fr> wrote:
> On Thu, 31 Mar 2011 14:28:58 +0200 (CEST), Jan Engelhardt
> <jengelh@medozas.de> wrote:
>>Your kernel is either tooooooo old, or was not compiled with the module
>>enabled. iptables 1.3.6 is also obsolete by now.
>
> Thanks for the help. I know they're old, but until I can figure out
> how to compile a newer kernel + iptables, I'm stuck with that
> three-year old release.
>
> I now have a working iptables, but there is no /etc/iptables/ and
> "iptables -h" doesn't say where the iptables configuration file should
> be.
>
> Thank you.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
