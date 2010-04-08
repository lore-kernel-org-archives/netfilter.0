From: Hamid Nassiby <h.nassiby@gmail.com>
Subject: Packet manipulation in user space
Date: Thu, 8 Apr 2010 23:24:09 +0430
Message-ID: <h2ub3f13ff81004081154tbf514844hdfb703cf81f857d2@mail.gmail.com>
References: <h2hb3f13ff81004081148n221e9728mb5a14944cf4ffd06@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:received:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=BF7V5WD2cjtsh+N1YMhe4MkYS80AukxxrBGgUdCzQGU=;
        b=UJxc3/hlFrXyRWnHpD3nerYH5US3sfRDQxbejUhjfl1ehNvLUKiz+c5xhetN4QSGwA
         +vck4dmnoTvAngBCk25+TiEc2r4ydvPciTS7j4FWPHOJ/GVG2SO/hA67yrGGRAoN6Ocp
         KeBqNapUTcJjeeFhnIrF6bbMTn+xLSxO0+0+4=
In-Reply-To: <h2hb3f13ff81004081148n221e9728mb5a14944cf4ffd06@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@vger.kernel.org>

Hello,

I'm working on a project which wants to port a Windows-based network
protocol to Linux. The protocol works as a VPN/Firewall, on packets
copied from Data-Link Layer to user space. In MS Windows
WinpkFilter(C) does copying from kernel space (Data-Link layer)=C2=A0 t=
o
user space and then it drops the original packet. In user space, our
protocol does some operation on packet ( e.g. checks=C2=A0 the packet
authority and/or encrypts/decrypts it, ...) and then injects the
packet upward to application layer or downward or simply drops it.

So our requirements are:

Capture each packet which is coming inside or going outside the
computer in Data-link Layer.
Create a copy of the packet and drop the original one.
Copy of packet must be available in user space to be manipulated by
our protocol.
After manipulation in user space, inject encrypted/decrypted version
of the privileged (copy of) packets to the network or upward to the
application layer.

And of course we want to have the minimum changes to be made on our
current protocol.

I tried raw sockets and netfilter netlink, but I didn't find a
suitable solution=C2=A0 which let me to drop packets or inject them upw=
ard
to the application layer. I need to know if it is possible to do this
with libraries/interfaces currently available in user space or should
I write a kernel module that does the above tasks for us?

Any guidance is pleased,
Thanks in advance,

Hamid.
