From: "Yan Li" <netfilterlist@hotmail.com>
Subject: About libipq
Date: Thu, 24 Oct 2002 17:52:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F130kEqM0uQcI92hZrl0000c946@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi all,

I wrote a small program which copy the input packets from the kernel to the=
=20
userspace using libipq. And the packets are stored in a buffer in userspace=
=20
which is actually an array, say buf.

Using:
ipq_packet_msg_t * m =3D ipq_get_packet(buf);

I can access some parameters of the packets like the packet ID, packet=20
length which are defined in the struct ipq_packet_msg_t. For example,=20
m->packet_id points to the packet ID. But how can I get other information o=
f=20
the packets, like the source and destination address, the protocol, etc. Is=
=20
there any function or should I read different unit of the array, buf, to do=
=20
that?

I am only a beginner. Many thanks for your kind reply.

Yan





_________________________________________________________________
Surf the Web without missing calls!=A0Get MSN Broadband. =20
http://resourcecenter.msn.com/access/plans/freeactivation.asp


