From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Matching by packet connection
Date: Fri, 16 Nov 2007 22:18:15 +0100
Message-ID: <473E0917.2060007@plouf.fr.eu.org>
References: <d95317090711161224x16ea558cp1bf843352d90608c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090711161224x16ea558cp1bf843352d90608c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Gilad Benjamini a =E9crit :
>=20
> "If a packet matches <condition> and the state is ESTABLISHED and the
> packet is in the same direction as the connection, then do
> <something>"

If I understand correctly, you want to match packets which are in the=20
original direction of the connection they belong to (i.e. the same=20
direction as the first packet) ?
