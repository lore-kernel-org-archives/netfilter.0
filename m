From: Linux Scoop <linuxscoop@gmail.com>
Subject: Re: cannot allow outbound ping traffic
Date: Tue, 3 May 2022 10:28:35 -0400
Message-ID: <CAE-E4dTH07sRLgWxLdk6ZTAp1J5YQ=i0D_b9ZRfHtRJGGP9vwA@mail.gmail.com>
References: <CAE-E4dSkxc9d4sCWAs6dC=NjH3x6NuEKxyv9O9N4fG0hSncydQ@mail.gmail.com>
 <CAE-E4dTvSS6oG9aE5wWnhhQRmD1sqd2+CFYxRcCpKX9Ev64Duw@mail.gmail.com> <1702744278.936.1651586556340.JavaMail.zimbra@contatogs.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3aWRXnmtjNbPe8M0O5YDiKBgCmqEv6wcTtpgO9AKmwE=;
        b=hYGnruQ3bXa3mJ6duj1hA4idI/QRQwvxdXUGgZYic/DMRPqsKSGVJAe6XOhAkvTecl
         pF2HKJthec65Tznq2gF1zgoTCnluYLzk84hxnxAwOTKplW1JXsKhAObLlucEx5nJVskW
         S6mYbAGYqciZ80fm7BX5Hr5j7PLz/5Y+7/Bh/kMcVD6gU2gxG5iafEI4PyPo5Q1W4fDp
         1QFYwVgt8HWU08+956ZDvK8Y7tcY2konI/D1a/bcbiYOWoVQz8OSuy1HnkLaeVHvctq0
         jaMpedG/ZVk/W3pOAbCtt3z+ZmgGC/HrCTaIJ/6v0fI0Sb+5P9kZO5dWfKSeogfHaz68
         2G4g==
In-Reply-To: <1702744278.936.1651586556340.JavaMail.zimbra@contatogs.com.br>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Paulo Ricardo Bruck <pauloric@contatogs.com.br>
Cc: netfilter@vger.kernel.org

Thank you Paulo for your response.
ah yes my input rules did not properly allow established/related packets.

Best,

Lihua

On Tue, May 3, 2022 at 10:02 AM Paulo Ricardo Bruck
<pauloric@contatogs.com.br> wrote:
>
> remember that is a pair. Output + Input...
>
> You only let output as accept. What about input?
>
> best regards
>
> ----- Mensagem original -----
> De: "Linux Scoop" <linuxscoop@gmail.com>
> Para: netfilter@vger.kernel.org
> Enviadas: Ter=C3=A7a-feira, 3 de maio de 2022 10:59:00
> Assunto: cannot allow outbound ping traffic
>
> Hello netfilter community,
>
>
> I am running into a problem where I cannot ping other hosts if I have
> nftables service turned on.
>
> I have the following rule for outgoing traffic (basically allows all
> outgoing traffic)
>
>
>
>         chain OUTBOUND {
>
>                 type filter hook output priority 0; policy accept;
>
>         }
>
>
>
> But I cannot ping any inside or outside IPs, eg.
>
>
>
> [root@lxdvfs1a nftables]# ping -vv 172.29.28.1
>
> ping: socket: Permission denied, attempting raw socket...
>
> PING 172.29.28.1 (172.29.28.1) 56(84) bytes of data.
>
> 153 packets transmitted, 0 received, 100% packet loss, time 151999ms
>
>
>
> If I turn off nftables service, I can ping any IPs normally.
>
> [root@lxdvfs1a nftables]# ping 172.29.28.1
>
> PING 172.29.28.1 (172.29.28.1) 56(84) bytes of data.
>
> 64 bytes from 172.29.28.1: icmp_seq=3D1 ttl=3D64 time=3D1.64 ms
>
> 64 bytes from 172.29.28.1: icmp_seq=3D2 ttl=3D64 time=3D0.446 ms
>
> 64 bytes from 172.29.28.1: icmp_seq=3D3 ttl=3D64 time=3D0.488 ms
>
>
>
> I also tried adding the following to explicitly allow outgoing ping,
> but it did not work either.
>
>
>
> icmp type echo-request ct state new,established accept
>
>
>
> Any insight/help would be appreciated.
>
>
>
> Thanks,
>
> Lihua Wang
>
> Sysadmin at CUNY Graduate Center
> --
> Pau lo Ricardo Bruck consultor
> tel 011 3596-4882
> cel 98140-9184(TIM/Whats)
> [ http://www.contatogs.com.br/ | http ] [ http://www.contatogs.com.br/ | =
s://www.contatoglobal.com.br ]
>
>
> Domou arigatou gozaimasu
