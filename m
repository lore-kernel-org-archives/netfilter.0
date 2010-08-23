From: =?UTF-8?Q?Fran=C3=A7ois_Legal?= <devel@thom.fr.eu.org>
Subject: Re: routing VPN users through transparent Squid using iptables
Date: Mon, 23 Aug 2010 10:01:24 +0200
Message-ID: <70df47e691bedf9a4877f68170159563@thom.fr.eu.org>
References: <4C70FE76.1060204@andrewsmail.co.uk>
 <4C714C43.2050203@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C714C43.2050203@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I think the problem comes from SQUID as it has to be listening on the
interface (here ppp+) for transparent proxying to work.
If SQUID is started before the pptpd connection comes up, then this is
not the case.

=46ran=C3=A7ois


On Sun, 22 Aug 2010 18:11:47 +0200, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>=20
> Jack Andrews a =C3=A9crit :
>>
>> Now, I was hoping another simple rule would redirect all http traffi=
c
>> through squid:
>> [CODE]iptables -t nat -A PREROUTING -i ppp+ -p tcp --dport 80 -j
>> REDIRECT --to-port 3128[/CODE]
>>
>> But this doesn't seem to work (I'm also hoping ppp+ is the correct
>> formatting for a wildcard?).  Http traffic is never redirected and
>> bypasses the proxy.
>=20
> The rule looks good to me. It should do the job.
> No other rules in the PREROUTING chain before ?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

