From: Cloves Pereira Costa Jr <cloves.costa@m2sys.com.br>
Subject: Re: [RFC] Using iptables to control bind/connect/accept/sendto
	permissions
Date: Tue, 04 Mar 2008 11:18:30 -0300
Message-ID: <1204640310.3144.43.camel@wtprit0036.m2sys.com.br>
References: <6599ad830803032204j3dc191ech8dfb64d9366f5ffe@mail.gmail.com>
Reply-To: cloves.costa@m2sys.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6599ad830803032204j3dc191ech8dfb64d9366f5ffe@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter ML <netfilter@vger.kernel.org>

Hi Paul.

I don't think u r wrong in this... But what u want is basicaly some kin=
d
of tool to control what process is connecting in with port and from who
is accepting connections.

There is a tool called HLBR that is a IPS (Intrusion Detection System)
that do something similar. http://hlbr.sourceforge.net/index.html.en

[]s

Cloves Jr

Em Seg, 2008-03-03 =C3=A0s 22:04 -0800, Paul Menage escreveu:
> As part of the cgroups/containers work, we'd like to be able to
> control what kinds of socket connections processes can get their hand=
s
> on, on a per-group basis.
>=20
> So for example, we might want to say that processes in a particular
> group can listen on port X, and can connect to any hosts in a
> specified netmask in a given range of ports. It woul also be nice to
> be able to get notifications of what sockets different groups had ope=
n
> (without having to regularly trawl through large /proc/*/fd
> directories for large numbers of processes.
>=20
> Now it would be possible to come up with our own API and mechanism fo=
r
> specifying, enforcing, and reporting all these details, but creating
> new complex APIs is generally a bad idea. Effectively what we want to
> do can be expressed as a subset of the API and functionality of
> iptables - when a user tries to perform a control-path operation such
> as connect() or accept(), we want to check their request against a
> series of rules, and be able to permit, deny, report, etc, their
> request. Many of these rules will involve matches against things like
> protocols, addresses, ports, etc. A NF_ACCEPT verdict would represent
> granting permission; a NF_DROP verdict would represent a permission
> failure.
>=20
> Exactly how to fit this into the iptables architecture, I'm not quite
> sure. At first I thought about adding a new netfilter hook,
> NF_CONTROL, but changing the number of hooks seemed to cause nasty
> compatibility issues with userspace and it would be nice to avoid
> that. Eventually I got a partial prototype working for controlling
> connect(), using the local output hook, but having the netfilter
> callback for my new table do nothing. The sequence looked something
> like:
>=20
> - user attempts to do an operation on a socket
> - protocol-specfic code (e.g. in tcp_v4_connect()) called a new
> function ipt_control_check()
> - ipt_control_check synthesized a fake skb with the appropriate
> source/dest/etc fields and passes it to ipt_do_table()
> - verdict is used to permit or deny the user's operation.
>=20
> The same thing could be done for different protocols, and for accept(=
), etc.
>=20
> Hooking into the local output hook doesn't feel quite right though - =
I
> think it would make more sense to tweak ipt_do_table() so that it
> could be used out of the context of any netfilter hook.
>=20
> Since this would be running its checks in the context of a process,
> some of the existing expensive or deprecated matches such as the
> complex "owner" matches would become much more feasible in , since
> they'd be able to just check the properties of "current". Also, we'd
> probably add new matches such as "cgroup" which would match based on =
a
> cgroup-provided ID.
>=20
> Now, we could approximate this using regular packet filtering, but
> that has some drawbacks such as:
>=20
> - additional per-packet processing (some of the match expressions
> could get rather complex if you have tens of jobs on a machine each
> with their own permitted sets of remote destinations).
>=20
> - doesn't solve the problem of people listening on ports that are
> supposed to be reserved (by the job control system) for some other jo=
b
>=20
> - doesn't give such obvious feedback to the user
>=20
> So what do people think? Is this a crazy idea that should be dropped
> ASAP? Or something that you'd be willing to consider patches for?
>=20
> Paul
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

