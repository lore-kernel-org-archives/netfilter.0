From: =?UTF-8?Q?Micha=c3=abl_PAULON?= <michael@paulon.org>
Subject: Misleading include documentation
Date: Wed, 23 Mar 2022 13:38:26 +0100
Message-ID: <65ed85a8-d27e-25c7-1947-6b992745c811@paulon.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I've been trying to use the include directive as described in=20
https://wiki.nftables.org/wiki-nftables/index.php/Scripting
The following statement in the documentation doesn't have any effect=20
(the token is read from configuration and no error is thrown, but the=20
files in /etc/nftables/ aren't taken into account):

# include all files in a given directory using an absolute path
include"/etc/nftables/"

Whereas this one work as intended:

include "/etc/nftables/*"

Is it a bug or should the documentation be updated ?

Have a nice day/night

--=20
Micha=C3=ABl PAULON

PS: oopsie looks like my mail client wanted for whatever reason ton send=20
this mail as html, so I got bounced, should be better now, sorry


