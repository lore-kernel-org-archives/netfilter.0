From: Pawel Karpowicz <mafeuser@gmail.com>
Subject: simple/ubiquitous iptables NAT config no longer works
Date: Tue, 18 Oct 2011 08:10:40 +0200
Message-ID: <CAA+mFXPp3vcLiABSpwNrP6jLmMB8V6QrbiQoUSOysAG1N4V4JQ@mail.gmail.com>
References: <CAA+mFXNdGDpickA-JNukzmHhgtGM+AtZ=2dDpfvh6G-ZYdY3xA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=i68Ijgh1RyV5AJRLrRx514inXcENc4or/XmImKIDv+0=;
        b=SQJMq7K3p2usvKdqji/jX/Vz/mLY42oAN1cLJzkNy9a/Int/lQUFN15PRvMkmTh0QH
         tzdeu74Rm2okTYXPsxNmBWVCZ/H0qSmCGRY2CRQmBhSy1oZCW4bXMba905r6mWXAOTQE
         MyBvkBH0SvO2dOvaXUacnapfyKDgOklefa1AI=
In-Reply-To: <CAA+mFXNdGDpickA-JNukzmHhgtGM+AtZ=2dDpfvh6G-ZYdY3xA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hallo netfilter team.

I am running ubuntu with simple and=A0ubiquitous=A0NAT configuration,
taken for example from:
http://www.revsys.com/writings/quicktips/nat.html

It worked fine for ubuntu 10.04 as well as 11.04, but no longer works
for 11.10 (iptables-1.4.10).

In details, TCP connection issued from some machine behind the NAT
gets connected correctly (SYN, ACK/SYN, ACK handshake)

then HTTP request gets destination correctly.

server ACK (without data payload) to request also is correct.

Then expected server response packet with TCP payload never comes.

Description above is based on public interface sniffing (wireshark).

Do YOu know what might be the reason?

best regards,

Paul
