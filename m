From: Thanos Panousis <pthanos@gmail.com>
Subject: BUG in NetPacket::IP perl library
Date: Wed, 11 Jan 2006 15:18:11 +0100
Message-ID: <4dcb3660601110618q9995a50nf10bf4c257f6710f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter List <netfilter@lists.netfilter.org>

This may sound off topic, but it can be very helpful for ppl messing
with QUEUE perl scripts.

The QUEUE target hands packets to a userspace process that can alter
and set verdicts to them. This can be done using libipq for C, but
there is fortunately a perl library that enables the use of perl
script for packet mangling. This is the IPTables::IPv4::IPQueue perl
library.

In order to make developing easier, you will definetely need
NetPacket::IP (and TCP and whatever..). I post this to report that
there is a BUG in NetPacket::IP-0.0.3, which has been around for quite
a long time. Encoding packets with NetPacket::IP unpatched, results in
packets with BAD checksum, which will in turn be rejected on their way
to the kernel leaving you wondering we are your packets going.

I am totaly new to perl and patching processes, but with some help
from Charlie Brady of this list(many thanks again) I managed to patch
the library and verify that the patch works.

From his email:
>>
Here's the patch:

--- /usr/local/lib/perl5/site_perl/5.6.1/NetPacket/IP.pm        Fri Jan 11
20:10:25 2002
+++ /usr/local/lib/perl5/site_perl/5.6.1/NetPacket/IP.pm.new    Fri Jan 11
20:10:35 2002
@@ -224,7 +224,7 @@

     # make the entire packet
     $packet =3D pack('CCnnnCCna4a4a*a*', $tmp, $self->{tos},$self->{len},
-         $self->{id}, $self->{foffset}, $self->{ttl}, $self->{proto},
+         $self->{id}, $offset, $self->{ttl}, $self->{proto},
          $self->{cksum}, $src_ip, $dest_ip, $self->{options},
          $self->{data});

Run: locate IP.pm
That will probably tell you where IP.pm is located on your system. If not,
this will:
find /usr/local/lib/perl5 /usr/lib/perl5 -name IP.pm
OK, let's say it is at:
/usr/lib/perl5/site_perl/5.8.5/NetPacket/IP.pm
Edit that file. Go to about line 226.
Change:
 $self->{foffset}
to
 $offset
>>

