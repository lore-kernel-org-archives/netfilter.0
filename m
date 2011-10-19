From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Removing VLAN tag from outgoing broadcasts
Date: Wed, 19 Oct 2011 15:20:52 +0200
Message-ID: <4E9ECEB4.9020402@freemail.hu>
References: <CA+JOZmMvZQ2eSPh=V+QeX9APg3qXsTmnzOrne5CbyT3dr1Xo5A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+JOZmMvZQ2eSPh=V+QeX9APg3qXsTmnzOrne5CbyT3dr1Xo5A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Michael Robinson <mike@robinsonhome.org>
Cc: netfilter@vger.kernel.org

Hi Mike,

2011-10-17 21:16 keltez=E9ssel, Michael Robinson =EDrta:
> I've set up a Linux (Ubuntu 10.04) server with multiple VLANs.
> Routing is enabled for all interfaces.  The 'eth2' interface is
> basically used as a VLAN trunk:

> The setup appears to work fine.  Now, for reasons beyond my control, =
I
> must change the behavior so all outgoing broadcast/multicast packets
> are sent untagged (regardless of their source).  I'm hoping that this
> would be possible with ebtables, but not being very familiar with it
> yet I was hoping for some guidance.  Is this possible?
I do not understand you...

If you remove the VLAN tags then how would your switch (or any other=20
network device) know where/whom the packets belonging to?!?
There "must" be an untagged VLAN in your network... So every untagged=20
packet will go that way... Every tagged packet will go to its own netwo=
rk...

You signal with the VLAN tag that you want to sent a packet to a networ=
k...

But maybe I am wrong... :D

Swifty
