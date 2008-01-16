From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Per IP maximal speed limit inside HTB class
Date: Wed, 16 Jan 2008 13:30:46 +0200
Message-ID: <1200483046.5107.17.camel@casper2.meteor.dp.ua>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

Hi there,

I already have HTB class tree which makes channel division between
client groups.
One of those groups now has to have clients with limited maximal speed
to implement "unlimited" traffic billing.

So the question is: is there any queueing discipline which can limit
maximal speed for any source/destination IP with one rule so that I
would not have to insert clases for each new IP?

=46or example it would be perfect if I could make something like this:

+ HTB class with from 5 Mbit/s to 5 Mbit/s
  | HTB class with from 1 Mbit/s to 5 Mbit/s prio 2 (for clients withou=
t
unlimited traffic)
  | HTB class with from 4 Mbit/s to 5 Mbit/s prio 1 (for clients with
unlimited traffic)
    + {some limit qdisc}
      | max speed limit 128 KBit/s (for 128K unlimited traffic) prio 1
      | max speed limit 256 KBit/s (for 128K unlimited traffic) prio 2
      | max speed limit 512 KBit/s (for 128K unlimited traffic) prio 3

Any hints?

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

