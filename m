From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: TCP redirect external to external host
Date: Tue, 9 Dec 2003 11:20:25 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567907D@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?=D6rjan_Persson?= <orange@fobie.net>, netfilter@lists.netfilter.org

As long as the host1 is the default route for host2, then you do not =
need the SNAT rule. Otherwise, you're SOL.

Maybe you could cook up something with BGP but I wouldn't have a clue on =
how that would work.


-----Original Message-----
From: =D6rjan Persson [mailto:orange@fobie.net]=20
Sent: Tuesday, December 09, 2003 11:04 AM
To: netfilter@lists.netfilter.org
Subject: TCP redirect external to external host


Hello,

I would like to redirect incoming traffic on host1:33 to host2:44!

Tried to find information about this for a day now but all I come up =
with is the DNAT/SNAT solution. The problem with this is when the final =
packet arrives at the host2 it thinks that host1 sends them.=20

Is there a way to keep the senders IP?

Thanks in advance,
=D6rjan


