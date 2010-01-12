From: "J. Bakshi" <joydeep@infoservices.in>
Subject: How to protect apache benchmarking attack ?
Date: Tue, 12 Jan 2010 14:51:59 +0530
Message-ID: <4B4C3F37.9010703@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello all,

I am dared to see what "ab" (apache benchmarking too) can do  against a=
n
apache server.  I have used the following against my server to check
call handling

` ` `
ab -n 1000 -c 20 http://<site-name>/index.php?no_cache=3D1
` ` `


and it simply bottle neck the target apache server.  the target server
is also  over loaded with huge cpu load.  Is there any  precaution to
prevent this ?  the target  system is already  protected with
mod_security.=20

Thanks

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

