From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: Extremely slow upload (and more) from behind NAT
Date: Fri, 12 Aug 2011 20:18:04 +0100
Message-ID: <4E457C6C.7080808@tolaris.com>
References: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com> <4E4555A2.4090705@tolaris.com> <CAKbQEqG5kBPrqBqdMpyufWpioeE6A0_zpXgEPnYeCuPk3JmpxA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKbQEqG5kBPrqBqdMpyufWpioeE6A0_zpXgEPnYeCuPk3JmpxA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Christian Pernegger <pernegger@gmail.com>
Cc: netfilter@vger.kernel.org

On 2011-08-12 17:45, Christian Pernegger wrote:
>> Please post your iptables / iptables-restore script.
>=20
> I did, in a way. It's really just that one line, "iptables -t nat -A
> POSTROUTING -s 192.168.0.0/24 -o eth1 -j MASQUERADE", at the moment,
> executed as a post-up command from /etc/network/interfaces.

I doubt that's the problem, then. I would write it without the "-s
192.168.0.0/24" statement, as it is not needed if you have no other
networks or interfaces. But I very much doubt it is the cause of the
problem.

You said the problem only happens to NAT'ed traffic. What if it's not
NAT, but eth0, that's the issue? Try swapping eth0 and eth1 and see if
the problem affects traffic to/from the router as well.

I recently had a problem with one server (with an old cheap Via chipset=
)
that ran fine on Ubuntu 8.04. But when I reformatted it for Ubuntu
10.04, eth0 started having serious issues with throughput that I
eventually concluded was an IRQ issue. Since it had two interfaces, I
renamed them and used the other one.

Regards,
Tyler

--=20
"Offending fundamentalists isn't my goal =E2=80=93 but if it is an inev=
itable
side-effect of defending human rights, so be it."
   -- Johann Hari
