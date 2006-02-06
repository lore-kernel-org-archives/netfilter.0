From: David Vogt <beunlovable@gmail.com>
Subject: ipq_set_verdict() does not shorten packets
Date: Mon, 6 Feb 2006 08:04:56 +0100
Message-ID: <859616420602052304g45d0a704g@mail.gmail.com>
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

I am using iptables and queue packets to user space. Packets are
either augmented (with a signature) or shortened (removal of
signature). The augmentation works.
 However, when removing the signature, the resulting packet contains
the correct data, but its overall size is equal to the original
(signed) packet. (i.e. original packet size: 83, signed packet size:
163)

 I checked this using ethereal on the receiving machine, which lists
packets with the additional bytes (163-83=3D79) as trailer for the
ethernet frame. (So, actually, the packet is processed correclty on
the other side, however, the additional bytes seem odd to me)

 Any help would be great.

 P.S. I am new to mailing lists, I tried to be prepared and hope I did
not make any major mistakes, appart from my bad english.

