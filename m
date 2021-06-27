From: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 16:46:18 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2106271613030.19074@piplus.local.jubileegroup.co.uk>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net> <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net> <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org> <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net> <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net> <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org> <291b9611-62ed-6000-6d4b-36d4b9196698@att.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463810772-1428951008-1624808659=:19074"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <291b9611-62ed-6000-6d4b-36d4b9196698@att.net>
Content-ID: <alpine.DEB.2.21.2106271644310.19074@piplus.local.jubileegroup.co.uk>
List-ID: <netfilter.vger.kernel.org>
To: slow_speed@att.net
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463810772-1428951008-1624808659=:19074
Content-Type: text/plain; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.DEB.2.21.2106271644311.19074@piplus.local.jubileegroup.co.uk>

Hi there,

On Sun, 27 Jun 2021, slow_speed@att.net wrote:
> On 6/26/21 3:19 AM, David Hajes wrote:
>=20
>> it seems to me that you need to learn basics of firewalling and Linux=20
>> management.=20
>=20
> A most fundamental part of learning is asking questions.=A0 That is what =
I'm=20
> doing here.

Mailing lists are not usually intended to replace doing your homework.

People tire of answering questions which wouldn't need to be asked if
the questioner had dome some modest amount of reading.  There are
numerous documents, not least those already on your computer, and many
on the netfilter Website

https://www.netfilter.org/documentation/

the study of which would greatly enhance your understanding without
causing friction on this list.

In the case of a firewall (not that to use iptables is necessarily to
implement a firewall, but in the case of a firewall) it's a matter of
"drink deep, or taste not the Pierian spring" - because if you get it
wrong with a firewall it might not be obvious and you might well live
to rue the day.

> And I'd still like some verification of the exact command to reload the=20
> tables.

There isn't an "exact command to reload the iptables".  Even supposing
there was some exact command which answers whatever question you're
really asking, to get to it you'd need to put a great deal more work
into the question.  The packet filtering susbsystem is a very complex
beast and there are numerous tools available to help you work with it.
The iptables command is one of them.  Like many commands it has what's
known as a "man page"; we say that as a kind of shorthand for starting
a shell and at the shell prompt then (in the case of iptables) running
the command

man iptables

which I urge you to try.  The man pages have a standard format and you
should make yourself familiar with it and be familiar with using them.
Although they're called pages, in reality each page can be a document
many pages (screens, whatever) in length.  When you're familiar with
them you'll have a wealth of information at your fingertips which will
most often answer your questions in much less time than starting some
thread on a mailing list.

--=20

73,
Ged.
---1463810772-1428951008-1624808659=:19074--
