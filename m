From: =?iso-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: RE: Weird nat/conntrack Problem with PASV FTP upload
Date: Mon, 9 Jun 2008 12:36:10 +0200
Message-ID: <E350C77ABFDBD242BDD51F5DA07905C102825E31@SONNE.gw.bringe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:
> On Mon, 9 Jun 2008, Thomas B=E4tzler wrote:
>> In any case I'm wondering why netfilter doesn't consider
>> these packets  to be part of a connection. Is there a
>> known problem with netfilter and TCP SACK?
>=20
> In these cases usually there is a device sitting between the=20
> firewall running netfilter and the server/client machine,=20
> which randomizes the TCP sequence numbers but fails to=20
> propagate the changes to the SACK fields.=20
> Thus the SACK values are totally bogus and therefore=20
> netfilter marks them as INVALID.

I thought of that, too, but it doesn't seem to be the case.
Let's have a look at an excerpt (tcpdump -S):

22:37:44.830784 IP gateway.41803 > server.37890: SWE 1599996997:1599996=
997(0) win 5840 <mss 1460,sackOK,timestamp 495055487 0,nop,wscale 7>
22:37:44.846411 IP server.37890 > gateway.41803: SE 23582050:23582050(0=
) ack 1599996998 win 5792 <mss 1460,sackOK,timestamp 49338617 495055487=
,nop,wscale 7>
22:37:44.846533 IP gateway.41803 > server.37890: . ack 23582051 win 46 =
<nop,nop,timestamp 495055488 49338617>

[...]

22:37:44.974253 IP gateway.41803 > server.37890: . 1600282667:160028411=
5(1448) ack 23582051 win 46 <nop,nop,timestamp 495055501 49338649>

[...]

22:37:44.989794 IP server.37890 > gateway.41803: . ack 1600281219 win 8=
92 <nop,nop,timestamp 49338653 495055501>
22:37:44.990228 IP gateway.41803 > server.37890: . 1600358775:160036022=
3(1448) ack 23582051 win 46 <nop,nop,timestamp 495055502 49338653>

[...]

22:37:44.990397 IP server.37890 > gateway.41803: . ack 1600281219 win 8=
92 <nop,nop,timestamp 49338653 495055501,nop,nop,sack 1 {1600282667:160=
0284115}>
22:37:44.990417 IP gateway.41803 > server.37890: R 1600281219:160028121=
9(0) win 0

As you can see, the SACK data matches a previously sent segment,
so it's not scrambled.

HTH,
Thomas
