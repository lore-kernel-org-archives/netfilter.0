From: "zze-Proxy_Corveller ball001 exterieur FTRD" <proxycorveller.ball001@rd.francetelecom.com>
Subject: Problem of NAT with VLAN
Date: Wed, 9 Apr 2003 11:16:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8C19E3FBB6467846AFF97E366D34CB6055A017@lanmhs20.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I've got n VLANs that arrive on a Linux machine. I'm using vconfig to
receive packets from those VLANs.

I want to perform DNAT on packets between my physical interface (eth2)
and the virtuals devices
created by vconfig (vlan00xx, where xx is the VLAN ID of the associated
VLAN).
I've place some rules at the PREROUTING chain in the nat table to
perform the address
translation.

My problem is that netfilter seems don't see packets between eth2 and
vlan00xx.=20

I've tried some rules such as '-A PREROUTING -i eth2' or '-A PREROUTING
-i vlan0010' but
the packet counters stay equal to 0.

Any idea ?

