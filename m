From: Alex Bligh <alex@alex.org.uk>
Subject: Re: Using DNAT with multiple upstreams
Date: Wed, 19 Dec 2012 00:34:40 +0000
Message-ID: <0FFCF6E8-318F-43C3-8B99-CE92630C3309@alex.org.uk>
References: <4B5F9CC88C3B87ECDEAD7A5D@Ximines.local> <CAJygYd1Emv_3M7nDLD8c2XwO=hc8OOMeTm1M-M4R4CDEOmi1ew@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd1Emv_3M7nDLD8c2XwO=hc8OOMeTm1M-M4R4CDEOmi1ew@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Cc: Alex Bligh <alex@alex.org.uk>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 18 Dec 2012, at 23:51, =E5=8F=B6=E9=9B=A8=E9=A3=9E wrote:

>=20
> ip route add table <table_name> default via xxxx dev xxx
> ip rule add from xxxx table <table_name>
>=20
> This will give you ability to choose nexthop base on source ip.

The issue with that approach is that I don't want arbitrary
traffic from 10.10.10.99/24 to go via Provider A - just
the replies to DNAT inbound traffic.

--=20
Alex Bligh




