From: =?ISO-8859-2?Q?M=E9sz=E1ros?= Gergely <monk@chello.hu>
Subject: Masquarede stalls?
Date: Tue, 10 Aug 2004 20:20:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040810202045.6f8681b3.monk@chello.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hi!

Are there any issues about netfilter in kernel 2.4.25 ?

I tried to make a masquerading setup, but all connections from the internal=
 network what is larger than a minimal size are stalls, and just waits wait=
s waits...

What can it be?=20

My ultra-simplified ipfilter (for debugging purpose) is:

	iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
	iptables -A FORWARD -j ACCEPT=20


. I have a simple two-network-card-gateway server and 192.168.* internal ne=
t setup.
. from the server everything is perfect.
. from the internal net, one can ping everything correctly (masquerade is w=
orking, just buggy)
. from the internal net every connection initialised correctly, however=20
	large enough (larger than 1 packet?) data is buggy and stalls.

So, i can reach very short homepages, and can ping from the int net but=20
everything else will stall.

Can you help me?

thx,
1 MonK / Gergely M=E9sz=E1ros

