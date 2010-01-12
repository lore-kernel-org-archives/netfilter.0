From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: How to protect apache benchmarking attack ?
Date: Tue, 12 Jan 2010 15:10:25 +0530
Message-ID: <4B4C4389.6010604@infoservices.in>
References: <4B4C3F37.9010703@infoservices.in> <20100112102848.4b427416@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100112102848.4b427416@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Marek Kierdelewicz wrote:
>> Hello all,
>>    =20
>
> Hello J.,
>
>  =20
>> I am dared to see what "ab" (apache benchmarking too) can do  agains=
t
>> an apache server.  I have used the following against my server to ch=
eck
>> call handling
>>    =20
>
> You can use hashlimit [1] match of iptables to limit concurrent
> connections from single IP.
>
> [1] http://linux.die.net/man/8/iptables -> lookup hashlimit; note:
> current versions of hashlimit can also use srcip as --hashlimit-mode;
> that's probably what you want
>
> Cheers,
> Marek Kierdelewicz
>
>  =20

Hello Marek,

thanks for your prompt reply. I'll look into the hashlimit as you
suggest.  Though a question in mind. Can It somehow affect the web
access from general users. ?  I need the protection but also don't  lik=
e
my protection makes the web service block general  users somehow :-)

Any real-life configuration is always Welcome.

Thanks

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

