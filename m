From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding
Date: Tue, 18 May 2004 22:33:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405182233.34800.Antony@Soft-Solutions.co.uk>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105> <1084899777.7261.17.camel@localhost> <4290.192.168.74.21.1084904497.squirrel@192.168.74.21>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4290.192.168.74.21.1084904497.squirrel@192.168.74.21>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tuesday 18 May 2004 7:21 pm, alucard@kanux.com wrote:

> I=B4m using a completly different address to try to access the server f=
rom
> the outside, to be more specific, I'm doing this at work and I'm using =
the
> computers in my house to do this test and nothing happens. If I telnet
> port 80 server2 directly from server1 I get this -to make sure it's
> working-:
>
> --------
> root@mail:~# telnet 192.168.0.2 80
> Trying 192.168.0.2...
> Connected to 192.168.0.2.
> Escape character is '^]'.
> ^]
> telnet>
> --------

A couple of suggestions:

1. Try a totally different port number (in the PREROUTING nat rule, and w=
hen=20
you telnet to test things) to see if there's some problem with 8080.   Yo=
u=20
know that port 80 can get to the firewall (because it's running its own w=
eb=20
server), so try TCP port 88 perhaps instead of 8080.

2. Remove the PREROUTING nat rule, make sure any dropped packets on INPUT=
 are=20
getting LOGged, and then telnet from the outside to port 8080 again - and=
=20
make sure you see them in the log output.   This is just one way of makin=
g=20
sure that the requests to port 8080 are making it as far as the netfilter=
=20
machine so that it can nat them on to the real server.

Also, what does "iptables -L -nvx; iptables -L -t nat -nvx" tell you in t=
he=20
packet / byte counters?   Does it look like any packets are getting natte=
d=20
and/or forwarded?

Regards,

Antony.

--=20
The first fifty percent of an engineering project takes ninety percent of=
 the=20
time, and the remaining fifty percent takes another ninety percent of the=
=20
time.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


