From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: Re: icmp gaps
Date: Thu, 26 Aug 2004 07:07:35 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <004301c48b5c$e4b5d370$0200a8c0@floydian>
References: <a0f69e504082521196c31a01a@mail.gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Askar <askarali@gmail.com>, netfilter <netfilter@lists.netfilter.org>

Hi Askar,
These gaps indicate PING DROPS. If you stop the pinging, the last line =
before the command prompt will show you the statistics. You will see =
what the success %age was and how many packets were dropped. Do a =
traceroute and see at what node in your network the packets get dropped =
or experience a great delay.
I hope this helps.
Thank you,
Deepak

  ----- Original Message -----=20
  From: Askar=20
  To: netfilter=20
  Sent: Thursday, August 26, 2004 12:19 AM
  Subject: icmp gaps


  hi all

  Below is the output of ping to our billing server from on one of
  another server, when one look into "icmp_seq" sometime there is gap
  between two packets for example in icmp_seq=3D25 <---> icmp_seq=3D28 =
and
  icmp_seq=3D21 <---> icmp_seq=3D23.
  I just wants to know these gaps are normal or something to worried =
about?

  regards
  Askar


  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D0 ttl=3D61 =
time=3D6.65 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D2 ttl=3D61 =
time=3D22.5 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D3 ttl=3D61 =
time=3D9.77 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D4 ttl=3D61 =
time=3D26.9 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D5 ttl=3D61 =
time=3D22.6 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D8 ttl=3D61 =
time=3D13.1 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D9 ttl=3D61 =
time=3D40.4 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D10 ttl=3D61 =
time=3D24.0 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D11 ttl=3D61 =
time=3D18.9 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D12 ttl=3D61 =
time=3D5.80 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D13 ttl=3D61 =
time=3D26.1 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D14 ttl=3D61 =
time=3D26.6 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D15 ttl=3D61 =
time=3D16.9 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D16 ttl=3D61 =
time=3D7.64 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D17 ttl=3D61 =
time=3D8.67 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D18 ttl=3D61 =
time=3D8.04 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D19 ttl=3D61 =
time=3D5.86 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D21 ttl=3D61 =
time=3D6.14 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D23 ttl=3D61 =
time=3D5.82 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D24 ttl=3D61 =
time=3D5.84 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D25 ttl=3D61 =
time=3D11.1 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D28 ttl=3D61 =
time=3D5.89 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D29 ttl=3D61 =
time=3D5.81 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D30 ttl=3D61 =
time=3D5.79 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D31 ttl=3D61 =
time=3D13.3 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D32 ttl=3D61 =
time=3D5.79 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D33 ttl=3D61 =
time=3D8.52 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D35 ttl=3D61 =
time=3D25.1 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D36 ttl=3D61 =
time=3D8.17 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D38 ttl=3D61 =
time=3D5.97 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D39 ttl=3D61 =
time=3D6.04 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D40 ttl=3D61 =
time=3D13.4 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D41 ttl=3D61 =
time=3D29.1 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D42 ttl=3D61 =
time=3D26.0 ms
  64 bytes from ab.abc.net (xxx.xxxx.xx.xx): icmp_seq=3D43 ttl=3D61 =
time=3D12.9 ms
  --=20
  "If you really want something in this life, you have to work for it.
  Now, quiet! They're about to announce the lottery numbers..."
  - Homer Simpson

