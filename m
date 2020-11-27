From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: FTFW with multicast not working properly
Date: Fri, 27 Nov 2020 19:57:52 +0100
Message-ID: <20201127185752.GA24475@salvia>
References: <CAP0dHewHgdndzpTWrmMfGfkrVukvmV9Luocs-qArZf5UeJepTA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP0dHewHgdndzpTWrmMfGfkrVukvmV9Luocs-qArZf5UeJepTA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?utf-8?Q?Jean-S=C3=A9bastien?= Frerot <jsfrerot@ludia.com>
Cc: netfilter@vger.kernel.org

On Fri, Nov 27, 2020 at 11:56:22AM -0500, Jean-S=C3=A9bastien Frerot wrote:
> Hi, I'm trying to set up conntrackd in FTFW mode with the multicast proto=
col.
> The problem I'm having is that my BACKUP firewall is not getting the
> states as it's supposed to.
> It's receiving the packets (confirmed by a tcpdump), but only a few
> states are replicated, even when I used the '-B' option to resend all
> the states to the slaves.
>=20
> If I configure it to use unicast UPD, all is working fine.
> I was hoping to use multicast so I can migrate my current active
> firewalls, to a new pair of firewalls. But for this to work, I need to
> sync the states to all my 4 firewalls.

FT-FW only works with 2 firewalls. For more than 2 firewalls, please
try NOTRACK mode.

FT-FW would need to be extended to support more than 2 firewalls, by
adding some sort of node ID and independent retransmissions queues for
each firewall in the cluster.
