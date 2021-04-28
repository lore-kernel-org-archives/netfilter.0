From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: Why is it impossible to DNAT 127.0.0.0/8?
Date: Wed, 28 Apr 2021 18:03:29 -0400
Message-ID: <CAPJdpdDVYpnwtJDQtMTQqGRb_qShHFpdnk9fsVN9h3ZDiT5hvg@mail.gmail.com>
References: <4da21aab607c40b08c3e1343ca003244@stud.uni-goettingen.de>
 <CAPJdpdCcsRuMnh433VHNmeZof+7wyWy6K2s1BzTtT5+vrwvx=g@mail.gmail.com> <CAPJdpdDkJ7VP_TdAYAyGruC5aT5BvpviKRajeQxf5+3aae_Zig@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WnwwBnf6MzvRuBBp4n1xdqT6xjhzWxlzTn+oX0MXVWs=;
        b=PMMqmnnmiadB2p26i7wqGGUi8d0C6GdqpgYUsRYRkl+2xnjh/FsCB/7pQ4CPyP8Jdq
         8LdmA+G7XgptsG3zT5JL+Ep6tgwojZV9f04s5EmPdJ66UJU0G8oCyIVnuq/oVafLyauA
         /0yCC7TpNcBnWMNOT/yQ+drhhMLlHKps2bYWKlKT4Cn5sVL3js2YScLot+tPhJ3s+ksa
         Q6b7ezK/yDIEpxPX1PneFU9nSXjWiUU2vQfo0x/fONeAUE+BVeCwFEFTyn57Fb1K2I8U
         WlQ1OohYjJ5g0GW+fYOnsAMsTjEmuZFgSGGDgDa+SOT5Ef53T+3Dad33sk3rsXs9dHI3
         SvaA==
In-Reply-To: <CAPJdpdDkJ7VP_TdAYAyGruC5aT5BvpviKRajeQxf5+3aae_Zig@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Quentin, Lars" <lars.quentin@stud.uni-goettingen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

hey everyone,
i just realized the list has been rejecting my answers to this chain
because i didn't send them in plain text so below are my two responses
so everyone can see them

It's a kernel security restriction that was added in the 2.4 kernel to
prevent a large number of issues that can happen when you route
connections to a loopback interface. it blocks all traffic from any
subnet attached to any loopback interface from being routable by
adding it to the "Martian IP" list
https://en.wikipedia.org/wiki/Martian_packet#:~:text=3DA%20Martian%20packet=
%20is%20an,Assigned%20Numbers%20Authority%20(IANA).
The full explanation for this is long but it has to do with a large
number of security vulnerabilities that were quite common on Linux and
Unix in the 1990's and early 2000's many of which were never fixed but
were mitigated by this change. Essentially the reason they chose to
mitigate it instead of fixing it is it involves thousands of
applications which falsely assume that the loopback interface is
secure so they use it for unauthenticated IPC. Programmers still
commonly make this mistake so it is an extremely risky security
feature to disable.

Instead you should use a "dummy" interface with a routable IP if you
want to bind a service to a virtual interface that does not go down if
a physical interface does. see
https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfa=
ces-for-virtual-networking/
  https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/=
html/configuring_and_managing_networking/creating-a-dummy-interface_configu=
ring-and-managing-networking
or https://itectec.com/ubuntu/ubuntu-ubuntu-18-04-how-to-create-a-persisten=
t-dumthe-network-interface/
for details on how to set one up.
You will also need to modify the configuration of the service to bind
to the dummy interface.

The other option is to modify the services configuration to bind to a
physical interface, IP address, or 0.0.0.0 (All interfaces)



hey Lars,
I realized that my response may have not been as helpful as i would
have liked so i read through your poset on segfault and i have a more
tailored answer for you
it looks like from what you said this is exactly the kind of unsecured
IPC connection the kernel developers were worried about in the first
place, that said there were additional options developed for your
situation.
What I recommend is using stunnel instead of DNAT.
you can configure Stunnel to listen on both the source and target
machines and wrap your connection in a pseudo VPN SSL tunnel
the kernel will allow this and it should be transparent to your application=
.
Now this is not the standard use case for stunnel but it is one of the
original use cases in the design the key configuration parameter that
you need to pay attention to is "client". on the source side client
must be set to "yes" and on the target side client must be set to "no"
see https://docs.opnsense.org/manual/how-tos/stunnel.html for a rough
example of how this is done and for the full documentation for stunnel
see chttps://www.stunnel.org/docs.html
you may also want to consider pairing it with xinetd to launch the
tunnels as needed in order to reduce risk of the tunnel breaking and
support for the host.allow and hosts.deny acls via tcpwrappers as an
additional security measure.


On Wed, Apr 28, 2021 at 5:52 PM Paul Robert Marino <prmarino1@gmail.com> wr=
ote:
>
> hey Lars,
> I realized that my response may have not been as helpful as i would have =
liked so i read through your poset on segfault and i have a more tailored a=
nswer for you
> it looks like from what you said this is exactly the kind of unsecured IP=
C connection the kernel developers were worried about in the first place, t=
hat said there were additional options developed for your situation.
> what i recommend is using stunnel instead of DNAT.
> you can configure Stunnel to listen on both the source and target machine=
s and wrap your connection a pseudo VPN SSL tunnel
> the kernel will allow this and it should be transparent to your applicati=
on.
> now this is not the standard use case for stunnel but it is one of the or=
iginal use cases in the design the key configuration parameter that you nee=
d to pay attention to is "client". on the source side client must be set to=
 "yes" and on the target side client must be set to "no"
> see https://docs.opnsense.org/manual/how-tos/stunnel.html for a rough exa=
mple of how this is done and for the full documentation for stunnel see cht=
tps://www.stunnel.org/docs.html
> you may also want to consider pairing it with xinetd to launch the tunnel=
s as needed in order to reduce risk of the tunnel breaking and support for =
the host.allow and hosts.deny acls via tcpwrappers as an additional securit=
y measure.
>
>
>
