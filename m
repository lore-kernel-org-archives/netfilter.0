From: Shahbaz Yousefi <shabbyx@gmail.com>
Subject: Implementing and adding a custom filter
Date: Thu, 16 Feb 2012 18:03:58 +0100
Message-ID: <CALeOzZ8YJ99spnbCxY9xv4j9GFxWPNGqorsKUfEym4jZffDdSg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=9iCu04tjrdZc1FCjdZ924LMeLYhck9QcU2R6G+ybOrs=;
        b=jgHQ/kFEgF8PWoqJTp4y144BxTSXmbQPEbHQSRYvpgezr9rIVNb2PIUUubCRKZthTw
         qjDuNLWVa3KpL6dgrozTVu9qkkfa41v0PZ1DYXw5G3Iabu9BuzBw9Zm9mBGe+8saR/bd
         l/I3NDdHFA+4xXJp3R/HEy7gq6ub6fOJ5EFko=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I need to test the behavior of a kernel module when it is probed for
data while some of its expected packets have arrived and some have
not. Normally, this module expects to be polled when all packets are
sure to have arrived. The network is a deterministic one (called
EtherCAT). The solution that came to me was to put a bridge in between
the network and introduce a delay between the packets being forwarded.
This way, I can deterministically poll the kernel module in question
when some of its packets have arrived while the rest not.

If you are interested in knowing more, you can read these two
questions that I asked elsewhere:

http://serverfault.com/questions/360466/how-to-write-a-netfilter-kernel=
-module-and-use-it
http://stackoverflow.com/questions/9313088/how-to-write-custom-module-f=
or-ebtables

Unfortunately, I could not find an answer to my problem anywhere, nor
could anyone answer them.

What I am trying to do is basically this:

- Put a bridge in the middle of the network (successfully done using bl=
ctr)
- Write a kernel module, checking all the packets that pass through the=
 bridge.
=A0 * In this phase, stall inside one of the functions to make sure
there is a certain delay between packets being forward.
- Make ebtables use my filter

I took a code from linux-source/net/bridge/netfilter/ebt_ip.c, made
the match and check functions simply return true (so they match all
the packets) and use xt_register_match in init_module as was done in
ebt_ip.c

This is the registration data I am using:

static struct xt_match reg __read_mostly =3D {
=A0=A0=A0 .name=A0=A0=A0=A0=A0=A0  =3D "any",=A0 // I tried "ip" also, =
but that didn't change anything
=A0=A0=A0 .revision =A0=A0  =3D 0,
=A0=A0=A0 .family =A0  =A0  =3D NFPROTO_BRIDGE,
=A0=A0=A0 .match =A0 =A0=A0  =3D match,
=A0=A0=A0 .checkentry =3D check,
=A0=A0=A0 .matchsize=A0 =3D XT_ALIGN(4),=A0 // I have no idea what this=
 is! I just
gave it 4 as if its an int
=A0=A0=A0 .me=A0 =A0 =A0    =A0=A0 =3D THIS_MODULE
};

By the way, I'm talking about Linux 2.6.32

Now I put some log inside match and check functions to make sure they
are called, but they are not. I have no clue how to make it work and I
can't find anything useful on the net.

My question is, how can I make ebtables call my match and check
functions before forwarding the messages? That is, how can I put my
filter in effect?

Thank you,
Shahbaz
