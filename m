From: "Michael Schoen" <michael@schoen.de>
Subject: Feature Request: -j LOGFIN, ConnTrack Byte Counter
Date: Fri, 29 Oct 2004 02:41:16 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041029004117.855782305C@ds9.ddns.anduras.de>
Reply-To: michael@schoen.de
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi there,

i'd like to start an discussion for a feature, to be integrated into the
netfilter code.=20

Let's assume a connection would have two additional fields, e.g.

uint32 	uCounter
boolean 	bLOGFIN

you could easily count the bytes for each connection within uCounter.
Additionally the log flag could be used for logging purposes, when the
connection is destroyed (either through FIN or through conntrack =
timeout),
to mark that connection should be logged when it will be removed from
memory.=20

Basically I'm thinking of a kernel-LOG output like this:

Oct 29 02:26:55 goethe kernel: DIR=3Dout IN=3Deth0 OUT=3Dppp0 =
SRC=3D10.10.10.4
DST=3D64.12.161.185 ID=3D10971 PROTO=3DTCP SPT=3D4732 DPT=3D5190 =
LEN=3D47123

Which is nothing new for a modern conntrack system.

I can not oversee the consequences for other netfilter modules if the
connection struct would be extended. So any core developer's comment =
would
also be appriciated...

I=B4d also like to hear comments or maybe any other ideas to realize =
this
behaviour without pumping every pkt to the userspace or using a time
consuming libpcap implementation.


Greetings from Germany

	Michael



+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
Yesterday is history,
Tomorrow is a mystery
but Today is a gift.
That's why they call it present..
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+



