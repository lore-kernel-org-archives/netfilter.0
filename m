From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How can I flush  mangle, filter  table with  conntrack tools
 ?
Date: Sat, 17 Nov 2007 16:16:05 +0100
Message-ID: <473F05B5.3050100@plouf.fr.eu.org>
References: <473EEDD5.3000600@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <473EEDD5.3000600@zensoluciones.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

S=E9bastien CRAMATTE a =E9crit :
>=20
> How can I flush  mangle,filter  table with  conntrack tools ?

Err... why the hell would you want to flush iptables tables with=20
conntrack tools when iptables does the job just fine ?


> #conntrack -F mangle
> conntrack v1.00beta2: unknown type `mangle'

'conntrack -F' flushes the conntrack or expect table, not iptables tabl=
es.
