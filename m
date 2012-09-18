From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Block Facebook with Layer7
Date: Tue, 18 Sep 2012 00:00:08 -0400
Message-ID: <f40ce59f1307b5a8d31c16d411f5d2cc@linuxwall.info>
References: <CAMTjHrwPuUTra2hHqP8oq3=SDVi_K_nAE4cjcGsaANL_ge63cA@mail.gmail.com>
 <47e26662c03e90efdd07a69583376777@linuxwall.info>
 <CAMTjHryLgyApzBrUex08hNnXZpX5wuHceq=3bU0r1QwWFZrvoA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxwall.info;
	s=samchiel; t=1347940808;
	bh=rLiepFuYwIirlvmz5ik+OviHKPIHgCj51B2hFmuMxEg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dDkiZSGYy4lEzT8HidJOYtysAgPpw0Th1yW6pos5IL16Ax7MSivfgKh2Hfza+ApAV
	 ShA5eQDpy/BVMZYhfqtqtIquLjuteoWBhtR3Rt9Bx1q0FGaPOO7f+bLtXArJL6Y+7U
	 lQyiURgw5x3mPr3sOJT87ytQ8CT7vwMee1ld/qj0=
In-Reply-To: <CAMTjHryLgyApzBrUex08hNnXZpX5wuHceq=3bU0r1QwWFZrvoA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Usu=C3=A1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On 2012-09-17 22:53, Usu=C3=A1rio do Sistema wrote:
> sorry, but to work with HTTPS just add an new rule with --dport 443 r=
ight=20
> ??

You cannot* inspect the content of a HTTPS connection because it's=20
encrypted. That includes the entire HTTP communication, thus the Host h=
eader=20
as well.

http://en.wikipedia.org/wiki/Secure_Sockets_Layer


* well, you *can*, but that requires using ssl proxies and organized MI=
TM.=20
Not something easy to deploy.

--=20
Julien Vehent - http://jve.linuxwall.info
