From: Antoine Souques <corum@via.ecp.fr>
Subject: Re: How to do PAT based on source IP adress and port ?
Date: Sun, 18 Jul 2010 01:21:27 +0200
Message-ID: <4C423AF7.60901@via.ecp.fr>
References: <AANLkTikEVBlk2beBQ0ZUg308udyaZ-_yWOQpvhRlZ6J7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikEVBlk2beBQ0ZUg308udyaZ-_yWOQpvhRlZ6J7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Le 17/07/2010 23:30, Thomas Elsgaard a =E9crit :
> Hi
>
> I am wondering how i can get iptables to do a PAT based on source IP =
address?
>
> Traffic from 10.5.1.0/24 towards UDP port 69 should be mapped to port
> 20000 instead of port 69
> Traffic from 10.5.2.0/24 towards UDP port 69 should be mapped to port
> 20001 instead of port 69
>
> Is this possible with iptables?
>
> Thomas
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   =20
I am sorry, I gave you the wrong target. DNAT matches better your goal.
