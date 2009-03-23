From: Kai Wang <w2w2k2k2@gmail.com>
Subject: Re: SO_ORIGINAL_DST failed with ENOENT
Date: Mon, 23 Mar 2009 21:16:06 +0800
Message-ID: <8b129cf50903230616n3f472039g4fd55b56ddf03897@mail.gmail.com>
References: <8b129cf50903230609l3e187422nb450c9f5dfe8900a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=y/9fCf4o7oX5u+eHD98YSaqI1RGsoYuhOwhdqP+69Ok=;
        b=Ml9sWi83p7v37hWtlwBa+dcwdHfKYmbr0FGTf7u7So+YM2lggdFRB9dlGBfto3j4VS
         ddP//igbA22K//jCXRlvKtCDomwLb6E7rBRgxhcXZrjuqDX8P7832/nZAYonjgf2aU9A
         QQqe3bjU62mlI6eV0QhC8mzF8Kla4cOcRQmH8=
In-Reply-To: <8b129cf50903230609l3e187422nb450c9f5dfe8900a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi everyone,

I'm new to iptables and recently met a problem when trying to get
original IP address with getsockopt.

I'm using iptables 1.3.3. Here's the rule:
iptables -t nat -A OUTPUT -m owner=C2=A0 --uid-owner <my_user_name>=C2=A0=
 -p tcp
-d 10.0.0.0/8 -j REDIRECT --to-port 9000

It will redirect all tcp packages to my proxy process listening on
9000 port. And my proxy will handles the real connection with out
world.
Here's my code snippet of my proxy app to get the original destination =
address:

=C2=A0 struct sockaddr_in addr;
=C2=A0 socklen_t addr_sz =3D sizeof(addr);

=C2=A0 bzero(reinterpret_cast<char*>(
&addr), addr_sz);
=C2=A0 addr.sin_family =3D AF_INET;

=C2=A0 if (getsockopt(fd, SOL_IP, SO_ORIGINAL_DST, &addr, &addr_sz) !=3D=
 0) {
=C2=A0=C2=A0=C2=A0 int err =3D errno;
=C2=A0=C2=A0=C2=A0 LOG << "Couldn't read SO_ORIGINAL_DST from socket " =
<< fd
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 << " Detail: " << strerror(err);
=C2=A0=C2=A0=C2=A0 return false;
=C2=A0 }

=46or most connections this works well. But it randomly gives ENOENT
error: "No such file or directory"...=C2=A0 I totally don't know why th=
is
happens. Could anyone enlighten me?

Thanks in advance!


--
Best Regards!

=C2=A0 =C2=A0=E7=8E=8B=E5=87=AF Kai Wang
