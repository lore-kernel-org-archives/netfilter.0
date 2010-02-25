From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: Port Scanning: Is there a difference between stateful INVALID
 	filtering and stateless TCP flag filtering?
Date: Thu, 25 Feb 2010 09:02:01 +0530
Message-ID: <4B85EF31.90806@infoservices.in>
References: <ac5c74141002240018pd69e696vce194ed87e90b643@mail.gmail.com> <4B8509B6.7000408@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8509B6.7000408@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On 02/24/2010 04:42 PM, Mart Frauenlob wrote:

> iptables -I INPUT -m state --state INVALID -j LOG
> iptables -I INPUT -m state --state INVALID -j DROP
>
> then start your nmap scans... you will see what it catches....
>
> http://jengelh.medozas.de/projects/chaostables/ <- read this!
> http://xtables-addons.sf.net/ <- includes portscan detection module.
>
>  =20


Mart, thanks a lot for the links. I was also looking for such a solutio=
n
but didn't know much about xtable and add-on.
wish you a nice day.

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

