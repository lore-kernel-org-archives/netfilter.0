From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Conntrack not matching properly - producing serious outages
Date: Thu, 11 Aug 2011 22:41:09 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1108112221410.8518@blackhole.kfki.hu>
References: <1313055975.3628.56.camel@denise.theartistscloset.com>  <1313057465.3408.12.camel@tiger.regit.org> <1313080553.3628.80.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1313080553.3628.80.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: Eric Leblond <eric@regit.org>, netfilter@vger.kernel.org

On Thu, 11 Aug 2011, John A. Sullivan III wrote:

> I've just begun to wade my way through SACK as Jozsef suggested after
> getting some sleep but I was able to catch a live one with logging
> enabled:
> 
> Aug 11 11:56:24 fw01 kernel: nf_ct_tcp: bad TCP checksum IN= OUT=
> SRC=95.172.228.42 DST=208.a.b.8 LEN=260 TOS=0x00 PREC=0x00 TTL=52
> ID=29203 DF PROTO=TCP SPT=46721 DPT=441 SEQ=2834861284 ACK=3682327577
> WINDOW=1002 RES=0x00 ACK PSH URGP=0 OPT (0101080A01249B0846B0F23B)

That's Noop, Noop and Timestamp options and not SACK.

But the TCP checksum checking in conntrack says that the TCP checksum of 
the received packet is invalid, therefore it assings the INVALID 
state to the packet.
 
> Aug 11 11:56:24 fw01 kernel: INPUT INVALID IN=bond3 OUT=
> MAC=00:15:17:90:3c:0b:00:1c:58:ea:79:ff:08:00 SRC=95.172.228.42
> DST=208.a.b.8 LEN=260 TOS=0x00 PREC=0x00 TTL=52 ID=29203 DF PROTO=TCP
> SPT=46721 DPT=441 WINDOW=1002 RES=0x00 ACK PSH URGP=0
> 
> Aug 11 11:56:24 fw01 kernel: No Match: IN=bond3 OUT=
> MAC=00:15:17:90:3c:0b:00:1c:58:ea:79:ff:08:00 SRC=95.172.228.42
> DST=208.a.b.8 LEN=260 TOS=0x00 PREC=0x00 TTL=52 ID=29203 DF PROTO=TCP
> SPT=46721 DPT=441 WINDOW=1002 RES=0x00 ACK PSH URGP=0
> 
> Is this telling me that the reason the packet has been classified as
> INVALID is because the TCP checksum is bad? We are doing checksum
> offloading so I would think the checksum in the packet evaluated by the
> kernel would be irrelevant.  We also have no problem if the users run
> their sessions through an OpenVPN tunnel.

TCP checksum offloading does not discard incoming packets with invalid 
checksum.
 
> I'll be digging into SACK next but wonder if I'm staring at the smoking
> gun and just don't recognize it.  I can try disabling offloading but not
> right now as the system is in heavy production.  Thanks - John

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
