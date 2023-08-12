From: =?UTF-8?Q?Fran=c3=a7ois_Patte?= <francois.patte@gmx.fr>
Subject: unable to start nftables
Date: Sat, 12 Aug 2023 17:18:13 +0200
Message-ID: <7953ed4a-eaaf-feb6-bc09-e1179b754253@gmx.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.fr;
 s=s31663417; t=1691853494; x=1692458294; i=francois.patte@gmx.fr;
 bh=Ti2ZIzDnNw2JGNKZrf76WR80XzOMWPQqJ/x/Sl//e0U=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=ojl9WxuhSi/zDSMz0gW4O5Dc5XZMGjynFNYWgKQ+hFiZ0i7MsL3dB6RFmb7nFLFAyQ0JrUg
 n7x2vLUged+YyC2R0i+KCClz0nDMzs7J5bgC+UVTpl8cDb5A+8nEJDfAYPA1QBlju4cb7PXXT
 msI3fz6m8jRUf5pZe/vMevBqOPPcYqu0MlThM69vqFdHX3Xy+KDJat7U14dKneTiOTmQtk3Tb
 BJWcxXcKg5xKbkE8LM05CUx0TmZTuu1Z4oREh0M+MFbZP8i63u0sy4ouAqEVdFKVqtfrCVvbw
 +tDIuQhexXvG+3L8rbCrusPtjFdMz18PDII7vxZQAtrRlAPa6sRw==
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Bonjour,

I am currently unable to start nftables service, the answer is:

internal:0:0-0: Error: Could not open file
"/etc/sysconfig/nftables.conf": Permission denied

file /etc/sysconfig/nftables.conf exists and have 755 permissions.

What can I do?

Thank you for any help.

F.P.
