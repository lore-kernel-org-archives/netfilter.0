From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: INCOMPLETE [ 8bytes] with two src addresses!
Date: Fri, 27 Feb 2004 19:15:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077905740.2526.41.camel@anduril.intranet.cartel-securite.net>
References: <20040227175608.666a0e38.Information-Cascade@ntlworld.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040227175608.666a0e38.Information-Cascade@ntlworld.com>
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
To: Graham Swallow <Information-Cascade@ntlworld.com>
Cc: netfilter@lists.netfilter.org

Le ven 27/02/2004 =E0 18:56, Graham Swallow a =E9crit :
> I've never seen this log before (split lines).
> Is it simply someones modem noise
> How can it have two SRC addresses?

This log is an ICMP error. And, as such, it contains a citation from the
IP packet that have raised it.

> Feb 27 17:50:37 sky1 kernel: fw-drop IN=3Deth1
> OUT=3D MAC=3D....
> SRC=3D216.200.115.66

ICMP error source : level3-mfn.fra1.de.mfnx.net

> DST=3D80.5.144.39

Destination : probably you  :)

> LEN=3D56
> TOS=3D0x00
> PREC=3D0x00
> TTL=3D247
> ID=3D0
> PROTO=3DICMP
> TYPE=3D11
> CODE=3D0

Type 11, code 0 is TTL exceeded in transit.

> [SRC=3D80.5.144.39 DST=3D200.179.192.14 LEN=3D40 TOS=3D0x00 PREC=3D0x00=
 TTL=3D1
> ID=3D12701 PROTO=3DTCP INCOMPLETE [8 bytes] ]

This is original packet citation so your kernel can associate the error
to the right sent IP packet.

The source is 80.5.144.39 (normal) and the destination 200.179.192.14
(dns1.rjo.virtua.com.br). As you can see, packet was received with
TTL=3D1. That's why the error was raised. Then we know the payload was TC=
P
but the citation was truncated at 8 bytes although we need 20 to analyse
TCP header (RFC says at least IP header + 8 bytes). By the way, it could
have been cool if theses 8 bytes were shown ;)

For more information on Netfilter logging, you can see :

	http://logi.cc/linux/netfilter-log-format.php3

You can also paste your trace in the online analyser :

	http://logi.cc/linux/NetfilterLogAnalyzer.php3

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

