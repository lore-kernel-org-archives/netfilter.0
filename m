From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 20:59:19 +0200
Message-ID: <20090420185918.GA1158@internet24.de>
References: <op.uslkl80px1lyi3@localhost> <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost> <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost> <145d4e1a0904200148p23d66274h8c0eb0a28ccf568b@mail.gmail.com> <1240227862.27336.43.camel@enterprise.ims-firmen.de> <145d4e1a0904200608i45d9cf09sce1c38ab42cd316@mail.gmail.com> <1240234658.27336.66.camel@enterprise.ims-firmen.de> <145d4e1a0904200815q3176c9e2m2dfef314b205f348@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <145d4e1a0904200815q3176c9e2m2dfef314b205f348@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Javier =?iso-8859-1?Q?G=E1lvez?= Guerrero <javier.galvez.guerrero@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Apr 20, 2009 at 05:15:21PM +0200, Javier G=E1lvez Guerrero wrot=
e:
> $ sudo iptables -L -t mangle
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> CONNMARK   tcp  --  anywhere             anywhere            state NE=
W
> tcp spt:rtsp CONNMARK set 0x1

If you are forwarding packets via this host you need the CONNMARK resto=
re
here as well, then you can also drop the CONNMARK restore from the INPU=
T chain,
PREROUTING is also traversed for packets destined for the local host.

> With this environment I get the same results. I send the first TCP
> packet (SYN, dport 8554) through the interface ra1 (OK) with the IP
> bound to this interface (SNAT OK) and I get the (SYN,ACK) to the same
> IP and through the same interface (OK!), but my application does not
> send the final acknowledgement to the TCP connection establishment
> (ACK), so the RTSP messages are not sent and the client retries over
> and over again the TCP session establishment.=20

Your application does not send the ACK in the 3 way handshake, the
client kernel does. Somehow it doesn't receive the SYN,ACK or
the ACK does not reach the point where you're tcpdumping packets.=20
Try to sniff as  close to your client app as possible. Could be
a NAT issue. Or maybe rp_filter or something else is breaking
it for you, you could try to enable /proc/sys/net/ipv4/conf/*/log_marti=
ans
to see any issues.

> messing up old connections with other videos. I can't understand how
> this can be so difficult to configure. I must be missing something in
> my rules...

=46ind another general purpose OS where you can do this AT ALL without =
additional
products. Then we'll talk about what is difficult or not ;=3D)

