From: "Calvin Hubble" <calvin.hubble@gmail.com>
Subject: libipq, packet mangling and checksum calculations
Date: Tue, 11 Apr 2006 02:16:49 -0700
Message-ID: <3f0dd8f80604110216v7b2f858r4cb352211b6670be@mail.gmail.com>
Reply-To: chubble@cs.ucsd.edu
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
To: netfilter@lists.netfilter.org

I am having issues with libipq and checksum calculations, I apologize
if this has been explored space.

I am using libipq along with iptables to mangle incoming/outgoing
packets in an attempt to write a watered-down user-level nat.  For an
outgoing packet I change the source address and recalculate both the
IP and TCP checksums.  Now here is the weird thing, I don't seem to
have a problem with connection startup (SYN/SYN-ACK/ACK).  I am
tcpdumping on my outgoing link and see no errors.  When I send an
outgoing packet with actual data (i.e. an HTTP request), then tcpdump
keeps telling me I have a bad checksum.  For example :

 [bad tcp cksum 2072 (->768d)!]

Howerver, I verified my checksum calculation as well as the value
inside the payload which I pass back to the kernel using
ipq_set_verdict and in all cases the checksum value I have is
correctly set at 0x768d (in this case).  What is going on here?

Again, this is only for TCP checksum calculations on data packets, I
do not see this issue with IP checksums or TCP syn/syn-ack/ack
packets.

Thank you for the help.

-Calvin

