From: Ben Muj <beniaminmuj@yahoo.com>
Subject: How to build an ebtables kernel module for MIPS64 Octeon processor
Date: Sun, 31 Mar 2013 03:14:46 -0700 (PDT)
Message-ID: <1364724886.67263.YahooMailNeo@web162404.mail.bf1.yahoo.com>
Reply-To: Ben Muj <beniaminmuj@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1364724886; bh=g3LZqVCeNOOa/+LYyvIbJ5koQ0MGqXlqdsPpTz+2SFA=; h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=lA6CjKnvFI/m8y5hDswN16/kdbFsis5YzoXZ/v9q9f+n8C6DugaEFLeadoJP/4qI6hq9SogXt59W6VSrDSqV+AxvM43Qt5q/xvw2yU2Rn/Pm6TEcnF3LbcjvPQbXTz98ntVbJtg7yKBWOBpDtOH2lLGzBgpzk2bLMCyo9U+HFW8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello everyone,

I have a router (Edge Router Lite) based on octeon CPU and the currentl=
y installed kernel does not support ebtables.

Please help me in the process of building the ebtables kernel module in=
 order to modprobe it.
I've got their SDK toolchain.

Thank you in advance!

Beniamin Muj
----------------------------------------------------------------------
"If you find a path with no obstacles, it probably leads nowhere."
----------------------------------------------------------------------=A0
