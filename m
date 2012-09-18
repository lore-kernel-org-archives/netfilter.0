From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Block Facebook with Layer7
Date: Mon, 17 Sep 2012 21:54:44 -0400
Message-ID: <47e26662c03e90efdd07a69583376777@linuxwall.info>
References: <CAMTjHrwPuUTra2hHqP8oq3=SDVi_K_nAE4cjcGsaANL_ge63cA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxwall.info;
	s=samchiel; t=1347933284;
	bh=F5Toqulx7BPgQf/lYRY/MZojf28fixze6cVZYQG/MtY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V+1ZykpvYIi569GU3l/BM5vcadhi6xktsWOIXwwffbqpzOLdwz7yPRrmaj0bLYMDv
	 spnkwE+dl8+S1C+aDjiif4XJB56puVQt+zJ7EJndEwzJHy0iL0oiAjDsNeqvWF469a
	 ISxbFzCA+Mwq2zLfMc8+IkCzmiLf6VA85olj2nYY=
In-Reply-To: <CAMTjHrwPuUTra2hHqP8oq3=SDVi_K_nAE4cjcGsaANL_ge63cA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Usu=C3=A1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On 2012-09-17 18:30, Usu=C3=A1rio do Sistema wrote:
> Hello everyone,
>
> it's possible to drop traffic to facebook with iptables Layer7 ? I
> have done some test with Squid but I found some difficult because I'm
> using Transparent Proxy so maybe it been  more easy to drop with
> iptables layer7.
>
> any tips is welcome......as well as some how to....
>
>

iptables -t filter -I FORWARD -p tcp --dport 80 -m string --string "hos=
t:=20
facebook.com" --icase --algo bm -j DROP

Of course, this won't work with HTTPS connections.

--=20
Julien Vehent - http://jve.linuxwall.info
