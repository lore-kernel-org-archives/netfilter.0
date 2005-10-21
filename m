From: =?iso-8859-1?Q?S=E9bastien_Bernard?= <sbernard@nerim.net>
Subject: pppoe with NAT not working
Date: Fri, 21 Oct 2005 15:50:02 +0200 (CEST)
Message-ID: <13248.1047105559$1129902722@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
I got a real big headache.

My DSL provider a few ago upgraded my line and for this changed the BAS m=
y
box used to connect with.

I had to reconfigure the ppp configuration.
Before, I was using :
pty "/usr/sbin/pppoe -I eth0 -T 80 -m 1452"
It ceased working.

The new configuration is using the rp-pppoe.so plugin as :
plugin /usr/lib/pppd/2.4.3/rp-pppoe.so

Since this modification, I'm not able to do any NAT or MASQUERADE with my
gateway.
My network architecture is :

Private lan (192.168.x.x) =3D> GW (public fixed address) =3D> DSl Modem =3D=
>
Internet

When any machine on the private LAN try make a connection to an outside
address, the connection made is ok.

The three-way handshake is OK with the packets correctly NATED.

When the outside peer tries to send data to the internal peer, the Gatewa=
y
sends a reset back to it without breaking the connection inside of course=
.

It looks like the netfilters didn't accept the incoming packets with
payload as part of the nated connection.

I had a look to the ip_conntrak connection and the faulty connection is
correctly tracked, with an entry.

I don't really understand what is happenning.

The configuration is nothing special and could resumed as :
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source <public addres=
s>

This was working before and I didn't touch anything to the configuration
but the public address that changed when I moved to a speedier DSL line.

If anyone could propose an explaination ...

  Seb




