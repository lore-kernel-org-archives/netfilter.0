From: Michal =?iso-8859-2?q?Kube=E8ek?= <mkubecek@suse.cz>
Subject: Re: regarding limit option and logging
Date: Wed, 12 Oct 2011 10:02:16 +0200
Message-ID: <201110121002.16463.mkubecek@suse.cz>
References: <CA+f1OFq3vGS3ZiWB3q4Xe1gDVYm=MJ6Yi96pCYjn5y9qbxZoEQ@mail.gmail.com>
Reply-To: mkubecek@suse.cz
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+f1OFq3vGS3ZiWB3q4Xe1gDVYm=MJ6Yi96pCYjn5y9qbxZoEQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Tuesday 11 of October 2011, Adishesh M wrote:
>=20
> I want to limit the number of packets logged to one packet per second
> (1/s). For this I am using below rules and it is not working.
>=20
> iptables -A INPUT -d 10.255.13.157  -m limit --limit 1/sec -j NFLOG
> --nflog-group 1

What exactly does "is not working" mean? My guess is that iptables=20
complains about missing --limit-burst value. If you really don't want=20
more than one message per second, try 1, but for a real-world=20
configuration I would suggest a bit more.

                                                         Michal Kube=E8=
ek
