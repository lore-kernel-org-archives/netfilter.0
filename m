From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: 64bit MARK
Date: Thu, 29 Oct 2009 16:39:42 -0400
Message-ID: <1256848782.6547.74.camel@jaspav.missionsit.net.missionsit.net>
References: <1256835945.1254.46.camel@francois.tc.commsmundi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1256835945.1254.46.camel@francois.tc.commsmundi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: fdelawarde@wirelessmundi.com
Cc: netfilter@vger.kernel.org

On Thu, 2009-10-29 at 18:05 +0100, Fran=C3=A7ois Delawarde wrote:
> Hello,
>=20
> Would it be possible to have 64bit MARKs with 64bit architectures?=20
>=20
> Apparently they are defined as "unsigned long" in linux headers, but
> iptables limits them to 32bit.
<snip>
Just as an aside, we've had problems using the top 16 bits of the 32 bi=
t
marks.  The OpenSWAN implementation on SnapGear devices changes the top
16 bits all on its own with two separate bugs - one with compression
enabled and another regardless of compression- John
--=20
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

