From: Marco <listaddr@gmail.com>
Subject: Re: conntrackd questions
Date: Thu, 21 Feb 2013 11:14:45 +0100
Message-ID: <CAHPDOiH0jLaV3vdu4whkPC2rF560Ag6cTAFfs7jH_d3aR8XijA@mail.gmail.com>
References: <CAHPDOiHUU+4qXB3iz6_6ZKOBRg8beBL_7SHC8c4zULw1vJ2CnA@mail.gmail.com>
	<20130219195237.GA3208@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=VzNjbVd4YLCTUY+BkJYPKOmmw9LKoeC8CijYoHMlk5k=;
        b=Fak//HYkTyFjnClLRCtPSFMRkBGpurPJ2dap1o0OX5C+nYxw0VYdkESdy6ZoX0czc7
         VQoJUjsGl/8Esm+VFvFe6pFjhE+F1iEiFp1WE4HydVVJA8SrF7BH+5ViqjPzAw5vDqPQ
         jhdc4qGAnxBLmeA9eLyo2/mUpSnd4QSJOEk3TcQP/0SYwYJaN+TtkBlBDbBDHh1o8UQa
         TueEEfoB3UBM2brJ0DXZR1RiTKqadyKJrfzwEXtqAnap+Y0CUJuTrSl/tbEWFZAs8O+H
         VmgJHLoAU1sFQvhWeuFTXL+Ssu7qUKscekA7uvFw7FA8PflwsoV/bRX7JViouvST4Uvf
         iGnQ==
In-Reply-To: <20130219195237.GA3208@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

2013/2/19 Pablo Neira Ayuso <pablo@netfilter.org>:

> There are several things that you can check to troubleshoot
> conntrackd:
>
> 1) Log files: /var/log/conntrackd.log and /var/log/keepalived.log
> 2) See if entries are actually synchronized via `conntrackd -i' and
> `conntrackd -e' and other statistics.
> 3) echo 255 > /proc/sys/net/netfilter/nf_conntrack_log_invalid, to
> see if the connection tracking system is marking packets as invalid.
>
> I also suggest you to read the official documentation:
>
> http://conntrack-tools.netfilter.org/manual.html

I had read the official documentation. I will keep testing to see if I
can come up with more information.

On a related note, am I understanding correctly that if external cache
is disabled, then there's no need to use the notify_* scripts in
keepalived.conf? or it's harmless to use them anyway?

Thanks.
