From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: traffic distribution not happening on 40G ethernet card.
Date: Mon, 05 Jan 2015 06:19:01 +0200
Message-ID: <54AA10B5.10504@ngtech.co.il>
References: <CAFat2-h0n=Cuka0-UPjE3tyL1dU13bwF-D_fRTZ+c2AQq9Q5_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <CAFat2-h0n=Cuka0-UPjE3tyL1dU13bwF-D_fRTZ+c2AQq9Q5_Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org
Cc: Varun Sharma <vsdssd@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hey,

Did you found any direction about the issue?

Eliezer

On 05/05/2014 12:39 PM, Varun Sharma wrote:
> Hi,
>=20
> I am using nfqnl_test.c code available on netfilter org. I have=20
> generated two binaries (queue0 and queue1) using that nfqnl_test.c=20
> sample code. These binaries are working as per expected behaviour
> in case of 10G Ethernet but with 40G Ethernet only one queue is
> receiving network traffic.
>=20
> I am not able to understand why only one queue is receiving
> network traffic in case of 40G Ethernet whereas same network
> traffic is being distributed in both the queues with 10G Ethernet.
>=20
> Machine configuration for 40G Ethernet:-
>=20
> kernel -: 2.6.32-431.el6.x86_64
>=20
> libmnl-1.0.3-4.el6.x86_64
>=20
> libnfnetlink-1.0.1-1.el6.x86_64
>=20
> libnetfilter_queue-1.0.2-1.el6.x86_64
>=20
> Command used for iptables:-
>=20
> iptables -A INPUT =E2=80=93i eth4 -j NFQUEUE --queue-balance 0:1
>=20
>=20
> Output:-
>=20
> [varun@exp2 ~]$ ./queue0
>=20
> opening library handle
>=20
> unbinding existing nf_queue handler for AF_INET (if any)
>=20
> binding nfnetlink_queue as nf_queue handler for AF_INET
>=20
> binding this socket to queue '0'
>=20
> setting copy_packet mode
>=20
> pkt received
>=20
> queue0 hw_protocol=3D0x0800 hook=3D1 id=3D0
> hw_src_addr=3Dfc:4d:d4:d3:7f:73 indev=3D2 payload_len=3D40
>=20
> entering callback
>=20
> pkt received
>=20
> queue0 hw_protocol=3D0x0800 hook=3D1 id=3D1
> hw_src_addr=3Dfc:4d:d4:d3:7f:73 indev=3D2 payload_len=3D40
>=20
> entering callback
>=20
> pkt received
>=20
> queue0 hw_protocol=3D0x0800 hook=3D1 id=3D2
> hw_src_addr=3Dfc:4d:d4:d3:7f:73 indev=3D2 payload_len=3D40
>=20
> entering callback
>=20
> pkt received
>=20
> queue0 hw_protocol=3D0x0800 hook=3D1 id=3D3
> hw_src_addr=3Dfc:4d:d4:f1:e1:5f indev=3D2 payload_len=3D78
>=20
> entering callback
>=20
>=20
>=20
> [varun@exp2 ~]$ ./queue1
>=20
> opening library handle
>=20
> unbinding existing nf_queue handler for AF_INET (if any)
>=20
> binding nfnetlink_queue as nf_queue handler for AF_INET
>=20
> binding this socket to queue '1'
>=20
> setting copy_packet mode
>=20
>=20
>=20
>=20
> Please let me know if more information is required.
>=20
> Regards Varun -- To unsubscribe from this list: send the line
> "unsubscribe netfilter" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
>=20

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUqhC1AAoJENxnfXtQ8ZQUCGQH/0Ppfg9wPbsgvTx6X18/qYSH
+RbX29QUBkZWVxHPvDAEjMf6IMUh3KiTxoWSZ2XlZnvf54+sm4ynsCS7OCgQUV7I
nIJJx9h4Ww3FIuRQBaEpN5CJ5GCbY2PG0ZgpkFXFhWW6pdFTwoIQvmVVRIBLkXs0
WpeKbh2VRgauogy9gXhrQ5oLYKHrWucJs4iU63TGA06i3hHh0QE3PIwaWlkb60Lb
RMxsgeEjTWSicTfeCYJblfaOfwtHScuLy0Lln/5jtVAGP5ONfY2ovrlWKylq4HuL
37IFMurQhTRbWLFNYB64sdWl45oHvYcPlGLyqi9gTvCXYZWEA1YITaAsxlnSrSU=3D
=3Dqc01
-----END PGP SIGNATURE-----
