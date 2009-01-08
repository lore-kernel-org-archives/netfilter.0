From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Mystics of packet forwarding
Date: Wed, 7 Jan 2009 19:26:46 -0600
Message-ID: <200901071926.46455.rob0@gmx.co.uk>
References: <4963B3EB.6090806@arturaz.net> <d39744a20901070752t45c57f98v51d04236bc81a5e8@mail.gmail.com> <49652E64.7040303@arturaz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49652E64.7040303@arturaz.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Wed January 7 2009 16:36:20 Art=C5=ABras =C5=A0lajus wrote:
> I'm lost. And desperate.

Where did we see your "iptables-save -c" output? I looked through the=20
whole thread just now, can't find it.

My WAG without seeing your rules is that they're complex and insane;=20
also, I bet you're missing a state rule for return packets.

SIMPLIFY. Start off with a nice simple ruleset that works, something=20
along the lines of Rusty's Really Quick Guide to $FOO (for values of=20
=46OO of "Packet Filtering" and "NAT".)
--=20
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
