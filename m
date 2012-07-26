From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: Identify traffic coming from which bridge
Date: Wed, 25 Jul 2012 23:35:18 -0700 (PDT)
Message-ID: <1343284518.33961.YahooMailNeo@web124903.mail.ne1.yahoo.com>
Reply-To: Ming-Ching Tiew <mctiew@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1343284518; bh=3AhSUg+mgMiTq6dkPbTMm2CHgyTZis9OdM/KJ5noyFk=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=l3PYQ7dbpXA5oivbw14qrAXsSZ0w20hkFxghLI18E3FCaveDQUyYW1fvvbgn5OgO/Sn1nhyGVnAIS+y5kM9hT6bZuPaPCDWqZAV9cRaem5LUgj+Z1uuktWv9cyPspDDU+9qN92hqO2C8sarJM8JsH6VDEtO4EcG4X5uVCu4Oxng=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Assuming I have a configuration with a few bridges connected to a serve=
r.
On the other side of bridge, there are a few clients connected.

Eg=A0 bridge A - client A, B, C
=A0=A0=A0=A0=A0 bridge B - client D, E, F
=A0=A0=A0=A0=A0 ......

When a client X is connected to the server, is there a way for the serv=
er to
know client X is connected via which bridge ?=20

Regards

