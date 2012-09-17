From: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Subject: Re: iptables port redirect question
Date: Mon, 17 Sep 2012 08:12:23 +0200
Message-ID: <3980014.EOsJlpYLpK@alaris>
References: <20120917110300.5e546d0c@shiva.selfip.org>
Reply-To: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120917110300.5e546d0c@shiva.selfip.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Monday 17 of September 2012 11:03EN, joydeep@infoservices.in wrote:
> Hello,
>=20
> How can I redirect all packets exclude the packets for lan (
> 192.168.0.0 ) and all packets to/from lo (localhost) ?
=2E..
> But this also redirect all local lan packets naturally, as it compare=
s
> with lo . How can I combined both lo and local lan ? Can a customized
> chain help ?

Yes, in general, custom chain and RETURN target can help to simulate=20
"or" operator. But in your case, you should be able to combine "! -o lo=
"=20
and "! -d 192.168.0.0/16" matches to do what you need.

On the other hand, I prefer to explicitly state what I want to=20
masquerade rather than masqeurading everything with some exceptions.

                                                          Michal Kube=E8=
ek

