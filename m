From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: RE: basic understanding of iptables - some questions
Date: Sun, 11 Dec 2016 00:52:16 +0200
Message-ID: <057b01d25338$0e5a7950$2b0f6bf0$@ngtech.co.il>
References: <560733058.4361908.1479674705472.JavaMail.zimbra@helmholtz-muenchen.de> <a07f78ad-c0f7-21a4-890c-87b9b89269cb@plouf.fr.eu.org> <051c01d252c1$8612a3e0$9237eba0$@ngtech.co.il> <20161210151139.GT8339@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <20161210151139.GT8339@harrier.slackbuilds.org>
Content-language: he
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Rob0 thanks for the notes.
First goes first... I have seen a version of ssh somewhere couple years ago
that used some kind of FTP over udp on port 22.
I do not remember the details but it was there and worked for good and bad.
Mosh works on other ports then 22 so this rules is not for mosh.
Probably the version I have seen was self compiled one which was never
released to the public or to anyone except a specific group of sys admins.

I believe that it shouldn't be allowed(22 udp) on systems since it's an open
port waiting for smugglers to smuggle things in and out of the network
pretending to be 22 by the naked admin eyes

And... it's not such a big issue to write an sftp service or an nrpe like
service that will utilize this port for smuggling things.
Leaving ssh the main subject aside, most of the Bittorent world is utilizing
UTP which is a protocol over udp which uses couple very nice FW holes or
piercing like the one that was mentioned.
The most used one is ESTABLISHED,RELATED which the bittorrent users use to
"open" a fake connection from the inside out and using aa coordinator both
peers are 'piercing' the FW each of them from his side.

I can demonstrate if required but I believe it's a known enough issue in
this area of the Internet so I wouldn't be needed to dirty my hands coding
such a thing.

Eliezer

* let me know if I missed something.

----
Eliezer Croitoru
Linux System Administrator
Mobile: +972-5-28704261
Email: eliezer@ngtech.co.il


-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of /dev/rob0
Sent: Saturday, December 10, 2016 5:12 PM
To: netfilter@vger.kernel.org
Subject: Re: basic understanding of iptables - some questions

[ top-posting fixed ]
> Pascal Hambourg:
> Le 20/11/2016 =E0 21:45, Lentes, Bernd a =E9crit :
> >
> > Chain ufw-user-input (1 references)
> >  pkts bytes target     prot opt in     out     source
destination
> > 41587 1849K ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpt:22
> >     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0            udp dpt:22
>=20
> Silly. SSH does not use UDP.

On Sat, Dec 10, 2016 at 10:43:47AM +0200, Eliezer Croitoru wrote:
> It's not silly that ssh uses UDP since there are implementations of=20
> SSH which utilizes UDP....

This post made me curious.  Clearly in the case of the OP, Pascal is
correct; we can see the counters on the udp/22 rule above.

I did a bit of searching and the only "ssh using udp" implementation found
was Mosh, <https://mosh.org/>, but Mosh !=3D ssh.

Of what ssh implementation do you speak?  More to the point of this thread,
is it using udp/22?  Is it available for GNU/Linux?
--
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in the
body of a message to majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html

