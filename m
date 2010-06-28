From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: question about NAT rule
Date: Mon, 28 Jun 2010 20:42:09 +0300
Message-ID: <AANLkTin0repbbkj42wJF5fivDlApG8VaAn0JvK8JiKbh@mail.gmail.com>
References: <AANLkTimaYvRg2379FY2erzJTKyhXFjEtyvOtgqfYnV2d@mail.gmail.com>
	<4C20D263.2050502@plouf.fr.eu.org>
	<AANLkTinOd_6m6UvbqKcB3v2-FinNQzHUmhymFE9Z5RHm@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=+hGZzKAOUUKqQhi2Qxx1gz7jMv+UfMfKtDiDRgxM2Ow=;
        b=tedo1E0Ju9r0NUD1inIIUQhNCV6nrBQQmInbCsgzKhAXhNe5zj6psT3XWK5NLgxtfe
         tXEZasF/hq1TCD/rdkQGRL10PIH4tGsKfav0gE3pT3Lr6hIpVcJ3Nt79s7ByV+UEn5uB
         MfrTvBiQu0iCTlLuV7w6yaxpZyhkIZ9Us9y4Q=
In-Reply-To: <AANLkTinOd_6m6UvbqKcB3v2-FinNQzHUmhymFE9Z5RHm@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2010/6/23 Pete Kay <petedao@gmail.com>:
> Hi,
>
> I guess I may have misunderstood the purpose of the
> netfilter-conntrack module. =A0What I would like to do is to set up a
> alot of iptables NAT rules ( > 10K at 500 rules (add/drop)/s). =A0Usi=
ng
> the system iptables command is not going to be fast enough for me.
> All I want is to deliver the packets received from specific IP:port t=
o
> another IP:port. =A0Therefore, I am looking into using
> netfilter-conntrack api to actually "set" those rules dynamically. =A0=
Is
> this the right approach in doing that?
>
> Could someone please give me some suggestions?

Adding/dropping iptables rule for a whole set of 10K rules is a very
time-consuming procedure.
Probably you ought to try to change the algoritm logic. As a way I
suggest using ipset for storing info about IPs and ports and to build
an unchangable set of iptables rules for walking through them in a
binary tree manner.

--=20
Best regards
Anatoly Muliarski
