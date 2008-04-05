From: "Joel Pearson" <joel.pearson@gmail.com>
Subject: Re: iptables equivalent of ssh local port forward.
Date: Sat, 5 Apr 2008 13:16:44 +1100
Message-ID: <bac5fd1b0804041916g19fb4fe0ta6b3b74ae21eea8f@mail.gmail.com>
References: <bac5fd1b0804041635g768b214bq38535a328d81bf7e@mail.gmail.com>
	 <alpine.LNX.1.10.0804050205390.26881@fbirervta.pbzchgretzou.qr>
	 <47F6C3DF.2040805@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=SZ7pTNLgYEUIBIRV4kz92HyxoqeSbwx926ngTzFK4yA=;
        b=QE3xGBpvp+oZv3UrTMRDUDanlRwe13IY0YEzkvTRPuhG9xkUfR0VuuLd8I3sWDje+yI6FMDcdbi4UGM1b0VggSRnd0mthlX9BPHQj5VrSTjvPm3XcjfJ1zzgzRhAJ9kdVUv5nhhXEY04lQoJdHEbdj3IaJDmlPN/sDBOKSFhmOw=
In-Reply-To: <47F6C3DF.2040805@solutti.com.br>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>

On Sat, Apr 5, 2008 at 11:12 AM, Leonardo Rodrigues Magalh=E3es
<leolistas@solutti.com.br> wrote:
>
>    graph shows clearly the problem, but doesnt gives the solution.
>
>    the host with DNAT rule, when forwarding to a source machine on th=
e same
> subnet of the DNATted machine, should do a SNAT too. DNAT redirects t=
he
> packet, SNAT changes the source address to the host with DNAT rule ad=
dress.
> So, replies will go to the host with DNAT rule and everything will wo=
rk.
>
>    The big problem of this setup is that the DNATted machine will loo=
se
> capacity of logging original source address, because it was SNATted.
>
>    On these situations, you could think on a DNS setup with views and
> replying with internal address for your internal network, avoiding th=
e use
> of this setup, altough it works completly fine.
>
>

Hi Leonardo,

I understand the implications of the SNAT problem with respects to
logging the incorrect source ip address.

The situation I have at the moment is that I am slowly migrating
everything from one server to another.
However there is one particular service (IMAP in this instance) which
needs to be used from inside the network and outside the network with
the same domain name.
I actually have the DNS setup you are talking about, however it is
pointing to 192.168.1.3 (the machine doing the DNATing), when dns is
requested internally.
I realise I could create another domain name for this particular
service, which would be quite an elegant solution, however this is
only a temporary measure for the next few weeks.
Because I am about to make the DNAT machine redundant.

Thanks for helping me out in my problem.

Cheers,

-Joel
