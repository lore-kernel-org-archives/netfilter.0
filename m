From: Tim Verhoeven <tim.verhoeven.be@gmail.com>
Subject: Compiling ebtables statically or dynamically results in different 
	behaviour
Date: Wed, 8 Apr 2009 10:51:12 +0200
Message-ID: <2a7fce340904080151u36088438v54a1b0d999f55561@mail.gmail.com>
References: <2a7fce340904070653h14f05a32y5bcb7f2b9713403a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=EG47JAb8j54YZyhg7aFSFMBa5q2YuFJg7ND2izUIjfE=;
        b=JdElXlVz2oYq6TVS0vRxN/ePdGj2igbZUsqMQ9IU2wD1zk1CsaiP7wfqTWPNbNEjQc
         u5ZD7ufc6y44U1Q8k2u5ahXd7SCnjha6GFNXzRKVgrA+RPxlkeVQpUnlMljq5DwaATjn
         5oVxa6UQFypOGdMMdcWX9kb3Ebc5hZgDI6Oto=
In-Reply-To: <2a7fce340904070653h14f05a32y5bcb7f2b9713403a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I have a very strange problem with ebtables. I'm using it on CentOS 5
(2.6.18 kernel) and when using the dynamically compiled version
(version 2.0.8-2) I can't create a new chain. When using the same
version but compiled statically it works. The difference is clearly to
see when using a strace :

Good behavior (statically compiled) :

setsockopt(3, SOL_IP, 0x80 /* IP_??? */,
"filter\0\0\0\352tv;\0\0\0\0\0\0\0\0\0\0\0008\2\0\0\0\0\0\0"..., 312)
=3D 0
exit_group(0) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ?


Bad behavior (dynamically compiled) :

setsockopt(3, SOL_IP, 0x80 /* IP_??? */,
"filter\0\0\0\352tv;\0\0\0\0\0\0\0\0\0\0\0e\3\0\0\0\0\0\0"..., 312) =3D
-1 EINVAL (Invalid argument)
write(2, "The kernel doesn't support a cer"..., 113The kernel doesn't
support a certain ebtables extension, consider recompiling your kernel
or insmod the extension) =3D 113
write(2, ".\n", 2.
) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D 2
exit_group(-1) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ?

=46or some reason the one version sets different options then the other=
=2E
I've tried different things (compiling against the standard kernel
include files (kernel-devel), compiling against the included include
files, using some gcc options, ...). But none of those worked. Any
hints are appreciated.

Regards,
Tim

--
Tim Verhoeven - tim.verhoeven.be@gmail.com - 0479 / 88 11 83

Hoping the problem =C2=A0magically goes away =C2=A0by ignoring it is th=
e
"microsoft approach to programming" and should never be allowed.
(Linus Torvalds)
