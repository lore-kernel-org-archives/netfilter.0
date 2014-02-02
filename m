From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: Public IP to Private IP
Date: Sun, 2 Feb 2014 11:09:00 -0500
Message-ID: <CAHEKYV7SoAsJ=u-8LP9AqXmKH6GmPf96HHjNfzyeLuKHqJU2vQ@mail.gmail.com>
References: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>
	<CALFTrnO7SAm0ghr7b1p+o9cWnbwtRJQMtSmtJy_VXJxd-xxkcw@mail.gmail.com>
	<CAFPGR9guTGspBJ8yfOVNZAAMy44YGS+UeV+QmYNLpAJ+ZxTuxw@mail.gmail.com>
	<52EE680B.6090407@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=9qkO054fu1PouYh5yqemdjL/lC1e7HvmlaoHFd9sheo=;
        b=Xa0S/GVSKgTv5yP9+mjFlWWXpRSdNevhhA+R63V4x8ZwmINWOUbNheHB9roadBAXUU
         aFUdBgeJhMDjGJx4aXFPocx2E9Gwo6u1BwRjZ6P7rjZHtuE6XXgD+VabxHsgtYXxV/p3
         +ZaRfD01WZ8C2LxlG6B+QE2JfNEAVxQsfLa5lwdPtY2yIPVNyWSu9eK/2P06Z1/tQjju
         laMfuUMTKl7WEAeQOKbW6KKYK3cAy8lsxbgA7x1rX6dVlSc5oh3flhD7+hAeRnuKz4VQ
         2/BDnuadnIkxQUGuEH+7FlnbtyhE2x/L60rkFze3p+KEoKH75LEAGW1yyd6BOW/qjbfX
         3wTw==
In-Reply-To: <52EE680B.6090407@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter list <netfilter@vger.kernel.org>

On Sun, Feb 2, 2014 at 10:45 AM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
> Hello,
>
> Scott Mayo a =E9crit :
>> On Mon, Jan 27, 2014 at 2:48 PM, Ray Soucy <rps@maine.edu> wrote:
>>> The term you're looking for is "NAT reflection" or "hairpin NAT".
>>>
>>> If you're not running split DNS, then trying to reach a system via =
its
>>> "outside" IP from an internal system will present a problem because
>>> the source IP of the request is seen as on-link by the server, so t=
he
>>> server responds directly from an unexpected source IP and the
>>> requesting host drops the request.
>>>
>>> You can get around this issue by NATing the return traffic when its=
 to
>>> and from the internal network.
>>>
>>> Assuming that your inside interface is eth1, and your inside IP
>>> network is 192.168.0.0/23:
>>>
>>> iptables -A POSTROUTING -s 192.168.0.0/23 -d 192.168.0.0/23 -o eth1=
 -j
>>> MASQUERADE
>
> Instead of masquerading I would suggest to 1:1 map the source address=
es
> to a different (unused) private subnet, so that the source address se=
en
> by the final server can be mapped back to the real source address.
>
> E.g. :
> iptables -A POSTROUTING -s 192.168.0.0/23 -d 192.168.0.0/23 -o eth1 \
>   -j NETMAP --to 192.168.8.0/23
>

      Assuming 0.1 is the gateway, how about adding to its firewall
rules something like

iptables -t nat -A POSTROUTING -d 192.168.0.2 -s 192.168.0.0/24 -j
SNAT --to-source 192.168.0.1

(Adjust as needed)

>> That did not seem to work either.  Getting the same results.  Thanks=
=2E
>
> Also make sure that "reflected" packets from eth1 to eth1 (replace wi=
th
> the real internal interface name) in the FORWARD chain are ACCEPTed.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
