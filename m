From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Conntrack : limit number of NEW outgoing connections per source
 IP
Date: Sat, 15 Jan 2011 13:36:56 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101151329370.25357@obet.zrqbmnf.qr>
References: <6750301E8CE01943922138638F4F1D26016EE7770FD7@diademasrv.diademasw.inkubator.cz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6750301E8CE01943922138638F4F1D26016EE7770FD7@diademasrv.diademasw.inkubator.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Rovner <jan.rovner@diadema.cz>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Saturday 2011-01-15 09:21, Jan Rovner wrote:

>Hello,
>
>I have many computers behind a SNAT router (gateway to internet). All 
>internal Computers have assigned private IP adressess in 192.168.0.0/16 
>range.
>
>I have two questions:
>
>1) I would like to limit the RATE of newly established connections 
>initiated by Computers, i.e. connections with NEW state in kernel 
>conntrack. The important points:
>Is there any suitable iptables "smart" solution for achieving this?

Quite easy.

	-i internalnetwork -m conntrack --ctstate NEW,RELATED
	-m hashlimit --hashlimit-above X/Y
	--hashlimit-mode srcip -j REJECT

>2) Is it possible in similar way to limit a TOTAL NUMBER of
>established (assured) connections per source IP?

	-i internalnetwork -m conntrack --ctstate NEW,RELATED
	-m connlimit --connlimit-above Z -j REJECT
