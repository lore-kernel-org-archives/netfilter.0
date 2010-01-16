From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: filtering based on MAC address prefix
Date: Sat, 16 Jan 2010 16:43:26 +0100
Message-ID: <4B51DE9E.1070800@plouf.fr.eu.org>
References: <818423da1001151144m5d7b698dh2c7ed2a108a0489c@mail.gmail.com> <4B518D2A.2040905@caf.com.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B518D2A.2040905@caf.com.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Eray Aslan a =E9crit :
>=20
> ebtables(8) is usually the better tool to use for dealing with ethern=
et
> frames.  Check if its --source and among matches fits.

But ebtables works only on frames seen by a bridge. So using it require=
s
to create a dummy bridge with one member.
