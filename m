From: "Jeff Saremi" <jeffsaremi@yahoo.com>
Subject: SO_ORIGINAL_DST returning bogus port number
Date: Mon, 19 Apr 2010 15:36:07 -0400
Message-ID: <003f01cadff7$8ebeb720$ac3c2560$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
References: 
In-Reply-To: 
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org


I=92m not sure what i=92m doing wrong or whether my expectations of net=
filter
are correct or not.
But i basically had the NAT extension forward all incoming tcp traffic =
to a
local socket. I tested it and it worked fine.
However I still need the original destination IP and port number for my=
 code
to function properly.
I get the original destination IP correctly but the port number is neve=
r
what I expect.
Below are the setup steps, my code and tracing that I did:

Setup:

iptables -A INPUT -p tcp -i eth0 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp -j REDIRECT --to-port 9000

Code:

=A0=A0=A0 cli_fd =3D accept(fd, (struct sockaddr *) &cli_addr, &cli_len=
);

=A0=A0=A0 dst_len =3D sizeof(dst_addr);
=A0=A0=A0 if(getsockopt(cli_fd, IPPROTO_IP, SO_ORIGINAL_DST, &dst_addr,=
 &dst_len)
!=3D 0)
=A0=A0=A0=A0=A0=A0=A0 printf("getsockopt() returned error");
=A0=A0=A0 else
=A0=A0=A0=A0=A0=A0=A0 printf("original destination address: %s:%d\n",
inet_ntoa(dst_addr.sin_addr), dst_addr.sin_port);

The above server is listening on port 9000 on ANY address. When hit by =
a
call from a telnet client (telnet 10.10.10.1 33000) it prints the follo=
wing:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 original destination addr=
ess: 10.10.10.1:59520

I have tried changing the port in the telnet command but everytime I do=
 that
a completely different value is reported out.

While the listening socket was running and the telnet client was
communicating, I ran =93tcpdump=94 and below are a few lines from that =
which
confirm the ports I expected.
There are no traces of port number 59520! (note that 192.168.1.100 is t=
he
telnet machine and 192.168.1.101 is the =93intercepting=94 machine runn=
ing
netfilter:

Trace:

13:45:01.688156 IP 192.168.1.100.51961 > 10.10.10.1.33000: P 1:2(1) ack=
 1
win 256
13:45:01.688256 IP 10.10.10.1.33000 > 192.168.1.100.51961: . ack 2 win =
183
13:45:01.688418 IP 10.10.10.1.33000 > 192.168.1.100.51961: P 1:19(18) a=
ck 2
win 183
13:45:01.688585 IP 10.10.10.1.33000 > 192.168.1.100.51961: F 19:19(0) a=
ck 2
win 183
13:45:01.688750 IP 192.168.1.100.51961 > 10.10.10.1.33000: . ack 20 win=
 256
13:45:01.693081 IP 192.168.1.100.51961 > 10.10.10.1.33000: F 2:2(0) ack=
 20
win 256
13:45:01.693130 IP 10.10.10.1.33000 > 192.168.1.100.51961: . ack 3 win =
183



