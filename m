From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Is ip_conntrack_ftp needed for 1:1 nat?
Date: Wed, 07 Jun 2006 21:10:17 +0200
Message-ID: <44872499.7050608@plouf.fr.eu.org>
References: <A78C6C481BFAE949BC5990E1EEB2FE1257C7@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A78C6C481BFAE949BC5990E1EEB2FE1257C7@q.LeBlancNet.us>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Robert LeBlanc a =E9crit :
> the FTP protocol contains the source IP and port,

The _destination_ address and port.

> which wouldn't
> make sense since it is a private address. At least that is what I
> understand of the FTP protocol.
>=20
> Are there any other protocols that have issues like this that I'm not
> aware of?

You can have an idea by looking at the available conntrack/NAT helper=20
modules (ip_conntrack_* and ip_nat_*) for the Linux kernel : IRC DCC=20
(file transfer and peer to peer communication with an IRC client), TFTP,=20
PPTP, some communication/multimedia/peer to peer protocols such as=20
H.323/Netmeeting, RTSP, SIP, MSN Messenger, DirectX, MMS (Microsoft=20
Streaming Media), Talk...

