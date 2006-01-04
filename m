From: =?ISO-8859-1?Q?Jorge_Ner=EDn?= <jnerin@gmail.com>
Subject: Re: Leap Second Kernel Panic??
Date: Wed, 4 Jan 2006 01:15:01 +0100
Message-ID: <30df48470601031615p48575ae1i@mail.gmail.com>
References: <000001c6100e$bb06a800$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c6100e$bb06a800$2801a8c0@MBRC40>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael D. Berger" <m.d.berger@ieee.org>
Cc: netfilter <netfilter@lists.netfilter.org>

I have a mix of boxes 2.6.14, 2.4.23-ck1 and 2.6.12-gentoo-r10, those
are at my home now, all three of them where on at 23:59:60 UTC and
inserted the leap second ok, in fact I logged it with ntptime and the
result was two 23:59:59 moments.

I logged this with a crude shell:
while true ; do ntptime ; echo ; sleep 1 ; done

The result was:

ntp_gettime() returns code 1 (INS)
  time c76199fe.9f8fa000  Sun, Jan  1 2006  0:59:58.623, (.623285),
  maximum error 830140 us, estimated error 362 us
ntp_adjtime() returns code 1 (INS)
  modes 0x0 (),
  offset 879.000 us, frequency -60.010 ppm, interval 4 s,
  maximum error 830140 us, estimated error 362 us,
  status 0x11 (PLL,INS),
  time constant 5, precision 1.000 us, tolerance 512 ppm,
  pps frequency 0.000 ppm, stability 512.000 ppm, jitter 200.000 us,
  intervals 0, jitter exceeded 0, stability exceeded 0, errors 0.

ntp_gettime() returns code 1 (INS)
  time c76199ff.a091b000  Sun, Jan  1 2006  0:59:59.627, (.627223),
  maximum error 830652 us, estimated error 362 us
ntp_adjtime() returns code 1 (INS)
  modes 0x0 (),
  offset 879.000 us, frequency -60.010 ppm, interval 4 s,
  maximum error 830652 us, estimated error 362 us,
  status 0x11 (PLL,INS),
  time constant 5, precision 1.000 us, tolerance 512 ppm,
  pps frequency 0.000 ppm, stability 512.000 ppm, jitter 200.000 us,
  intervals 0, jitter exceeded 0, stability exceeded 0, errors 0.

ntp_gettime() returns code 3 (OOP)
  time c76199ff.a197b000  Sun, Jan  1 2006  0:59:59.631, (.631221),
  maximum error 831164 us, estimated error 362 us
ntp_adjtime() returns code 3 (OOP)
  modes 0x0 (),
  offset 879.000 us, frequency -60.010 ppm, interval 4 s,
  maximum error 831164 us, estimated error 362 us,
  status 0x11 (PLL,INS),
  time constant 5, precision 1.000 us, tolerance 512 ppm,
  pps frequency 0.000 ppm, stability 512.000 ppm, jitter 200.000 us,
  intervals 0, jitter exceeded 0, stability exceeded 0, errors 0.

ntp_gettime() returns code 4 (WAIT)
  time c7619a00.a2b8b000  Sun, Jan  1 2006  1:00:00.635, (.635631),
  maximum error 831676 us, estimated error 362 us
ntp_adjtime() returns code 4 (WAIT)
  modes 0x0 (),
  offset 878.000 us, frequency -60.010 ppm, interval 4 s,
  maximum error 831676 us, estimated error 362 us,
  status 0x11 (PLL,INS),
  time constant 5, precision 1.000 us, tolerance 512 ppm,
  pps frequency 0.000 ppm, stability 512.000 ppm, jitter 200.000 us,
  intervals 0, jitter exceeded 0, stability exceeded 0, errors 0.

ntp_gettime() returns code 4 (WAIT)
  time c7619a01.a3a25000  Sun, Jan  1 2006  1:00:01.639, (.639195),
  maximum error 832188 us, estimated error 362 us
ntp_adjtime() returns code 4 (WAIT)
  modes 0x0 (),
  offset 878.000 us, frequency -60.010 ppm, interval 4 s,
  maximum error 832188 us, estimated error 362 us,
  status 0x11 (PLL,INS),
  time constant 5, precision 1.000 us, tolerance 512 ppm,
  pps frequency 0.000 ppm, stability 512.000 ppm, jitter 200.000 us,
  intervals 0, jitter exceeded 0, stability exceeded 0, errors 0.

Perhaps your code expected always a time increment and when faced the
second 23:59:59 moment failed?.


--
Jorge Ner=EDn
<jnerin@gmail.com>

