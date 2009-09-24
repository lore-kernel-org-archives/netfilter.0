From: Daniel Huhardeaux <daniel.huhardeaux@tootai.com>
Subject: Re: Port forwarding on host interface
Date: Thu, 24 Sep 2009 10:17:51 +0200
Message-ID: <4ABB2B2F.8050902@tootai.com>
References: <4ABA00DD.70205@tootai.com> <4ABA2C20.30800@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ABA2C20.30800@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Pascal Hambourg a =E9crit :

Good day,
> Daniel Huhardeaux a =E9crit :
>> I would like to redirect an external port to another port on the sam=
e=20
>> machine.
>
> REDIRECT is your friend.
Thanks to Mart and you I got it work :-)
>> I read on some documents that the kernel doesn't allow DNAT to=20
>> 127.0.0.1 so I ended up with following setup:
>
> This is not exactly right. NAT allows any address you like, but the
> kernel routing prohibits packets with an address in the loopback rang=
e
> on a non-loopback interface, regardless of NAT. It might be worth
> mentionning that the routing decision occurs after the PREROUTING cha=
in
> and does not know about the original destination address. However DNA=
T
> to 127.x.y.z works fine in the OUTPUT chain because the packets are
> rerouted through the loopback interface and don't leave the host.
My rules are:
            [snip]

            [ -z $IP   ] &&=20
IP=3D$EXTERNAL_MAIN_IP                                                 =
                                  =20

            [ -z $PORT ] &&=20
PORT=3D$EXT_PORT                                                       =
                                  =20


            $IPTABLES -t mangle -A PREROUTING   -p tcp  -i=20
$EXTERNAL_MAIN_DEVICE -d $EXTERNAL_MAIN_NET  --dport $PORT           -j=
=20
                    DROP

            if [ "$IP" =3D=3D "$EXTERNAL_MAIN_IP" ]; then
                $IPTABLES -t nat        -A PREROUTING   -p tcp  -i=20
$EXTERNAL_MAIN_DEVICE -d $IP         --dport $EXT_PORT       -j        =
=20
                REDIRECT --to-port $PORT
                $IPTABLES               -A INPUT        -p tcp  -i=20
$EXTERNAL_MAIN_DEVICE -d $IP         --dport $PORT           -j        =
=20
                ACCEPT                =20
            else
                # To inhibed when IP is 127.0.0.1              =20
                $IPTABLES -t nat -A PREROUTING  -p tcp  -i=20
$EXTERNAL_MAIN_DEVICE -d $EXTERNAL_MAIN_NET  --dport $EXT_PORT       -j=
=20
                        DNAT --to $IP:$PORT   =20
                $IPTABLES        -A FORWARD     -p tcp  -m=20
tcp                                          --dport $PORT           -j=
=20
                        ACCEPT                =20
                # Test for redirection to localhost, to activate when I=
P=20
is 127.0.0.1                                =20
                #$IPTABLES -t nat -A OUTPUT     -p tcp  -o=20
$EXTERNAL_MAIN_DEVICE        -d $IP          --dport $EXT_PORT       -j=
=20
                        DNAT --to $IP:$PORT
                #$IPTABLES       -A [INPUT|FORWARD]     -p tcp  -m=20
tcp                                  --dport $PORT           -j        =
=20
            ACCEPT
            fi

This is working fine when $IP is the public one or the Intranet one. Bu=
t=20
when I put the localhost 127.0.0.1 and activate the right stuff, it's=20
not working (tried with both INPUT and FORWARD). Telnet to the EXT_PORT=
=20
shows try to connect ... From the host, telnet localhost $PORT is worki=
ng.

Concerning mark of packets, as I told in my original mail, they are=20
already marked in the mangle table, prerouting rule for my 2 ISP. I=20
tried to find a solution with save/restore but problem is that mangle=20
can't use user define target, so how to restore original mark AND accep=
t=20
the packet?

Thanks to you and Mart for your time

--=20
Daniel Huhardeaux       _____ ____ ____ _____ _____ _
enum   +33 368 460 088 (_  __) _  ) _  (_  __) _  _(_)  +48 222 472 472
iaxtel  1-700-849-6983  / / / // / // / / / / /_/ / /  GIZMO,SKYPE,GTAL=
K
sip/iax:callto 101@sip./_/ ( ___( ___/ /_/ (_/ (_/_/.net   tootaiNET

