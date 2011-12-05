From: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Subject: Re: [iptables] misleading print
Date: Mon, 05 Dec 2011 16:44:28 +0100
Message-ID: <2026716.mRmHE8f3qx@dhcp91>
References: <jbinrb$2l7$1@dough.gmane.org>
Reply-To: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jbinrb$2l7$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: "U.Mutlu" <for-gmane@mutluit.com>

On Monday 05 of December 2011 16:26EN, U.Mutlu wrote:
> I have in my script these statements:
>    iptables -A INPUT  -i lo -j ACCEPT
>    iptables -A OUTPUT -o lo -j ACCEPT
>=20
> When doing "iptables -L -n" then the above gets shown as this:
>    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
>=20
> IMHO, this could easily be misinterpreted if one looks
> only at the iptables output, because the crucial info,
> ie. that it applies to the "lo" device only, is missing...

Output of "iptables -L" doesn't show -i and -o matches by default. If=20
you want to see them, use "-v" option.

                                                       Michal Kube=E8ek

