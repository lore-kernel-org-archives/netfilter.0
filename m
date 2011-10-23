From: "p. awa" <pawa@tormail.net>
Subject: Re: tag process's future sockets for iptables rules?
Date: Sun, 23 Oct 2011 17:18:17 +0000
Message-ID: <1RI1gs-000H1O-OY@internal.tormail.net>
References: <1RHeWb-0000Qb-4M@internal.tormail.net>
 <alpine.LNX.2.01.1110222242100.17728@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tormail.net; s=tm;
	h=Message-Id:X-TorMail-User:In-Reply-To:Content-Type:MIME-Version:References:Subject:To:From:Date; bh=1nV8LaC/slN3wm9kvQ0UykKOIXoCSf2W2hdqcRAge4U=;
	b=aNOWiu6TuKqujG4r8lkkEJTgu77GmP00ipm59M7srmurcmKgsoIdistJLi2+0WY4mD5FW2Z+B8mJ6NJw6wLSQ1mI9yv/sJ/lppm/pOX80n2vB+D2mc0hBtXUPAyaeWEC4e6Oe35D+PdxOx+N13VDX++T3PKoaY/kWOKo0A+DMQM=;
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.01.1110222242100.17728@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> >| netfilter_add_tag("public-addresses-proxied-via-tor");
> >| netfilter_add_tag("internal-addresses-directly");
> >| netfilter_remove_tag("proxy-dns");
> >| execlp("wget", ...);
>
> A socket option, SO_MARK, for use with setsockopt/getsockopt.

but setsockopt is per socket. i'm looking for something that is
per process (and inherited by children - in the example, wget).
this is to replace what i do at the moment, namely

| setgid(123);
| execlp("wget", ...);

and

# iptables ... -m owner --gid-owner 123 ...
