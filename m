From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: bidirectional forwarding
Date: Wed, 28 Jul 2004 09:13:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511FF@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Itrat Rasod Quadri <iquadri@ccse.kfupm.edu.sa>, netfilter@lists.netfilter.org

> PC1               R1           R2           R3           R4            =
PC2
> |---------------|   |-------|    |--------|   |--------|   =
|-----------|
> 192.168.10.2   .1  12.1    12.2 13.1     13.2 16.1    16.2 11.1       =
11.2
> e0             e0   e1     e0   e1        e0  e1       e0  e1          =
e0

assuming:

  default gw of pc1 is 10.1
  default gw of r1 is 12.2

  default gw of pc2 is 11.1
  default gw of r4 is 16.1

both r2 & r3 will need static routes telling them how to get to networks =
10 and 11:

on r2:

  192.168.10.0/24 via 192.168.12.1
  192.168.11.0/24 via 192.168.13.2

on r3:

  192.168.10.0/24 via 192.168.13.1
  192.168.11.0/24 via 192.168.16.2

the output of:

  ip route get 192.168.10.2
  ip route get 192.168.11.2

on r2 and r3 should clue you in to where the packets are going.

HTH...

-j

