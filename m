From: "Ray Anderson" <rsa@rb-com.com>
Subject: RE: identical scripts, 2 boxes, different behavior - what else should i look for?!
Date: Tue, 16 Mar 2004 11:31:14 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004d01c40b8d$3f363d30$2405010a@rsa>
References: <20040316191101.41549.qmail@web10207.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040316191101.41549.qmail@web10207.mail.yahoo.com>
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
To: 'arif' <djreef@yahoo.com>, netfilter@lists.netfilter.org

Check the gateway on the internal machine you're trying to forward to.

Internal box a will only talk through 1 firewall at a time, or correct =
me if
I'm wrong.

Firewall1             ,        firewall 2
   .
  /|\
   |

Box A =20
Gateway is=20
firewall 1

Incoming packet to internal box A through firewall 2 will not work =
because
box A tries to respond through firewall 1, not firewall 2.

Or did I completely misunderstand the question?

-=3DRay
+-----------------------------------------------------------+
|                         | Ray Anderson                    |
|           |             | Systems Development Manager     |
|           |             | 916.788.2444 (Office)           |
|          (O)            | 916.798.9439 (Mobile)           |
|X--------<_._>--------X  | PRIDE Industries                |
|         (___)           | rsa at prideindustries.com      |
|                         | http://www.prideindustries.com  |
+-----------------------------------------------------------+
It's the little things that cost you victories.
Group Captain Reade Tilley, RAF


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of arif
> Sent: Tuesday, March 16, 2004 11:11 AM
> To: netfilter@lists.netfilter.org
> Subject: identical scripts, 2 boxes, different behavior -=20
> what else should i look for?!
>=20
>=20
> ok, after being super frustrated trying to figure out
> why i can't forward ports properly, i decided to just
> take the script we currently are using on the soon to
> be old firewall, and load it onto the new one. It
> loaded fine, but I get different behavior with the two
> machines! I compared the rules line by line using
> iptables -L, and theyre identical. But I do not get
> forwarded to the internal hosts like I should, when I
> try with the new machine! The routing tables are
> identical also, and they both have the same kernel
> modules loaded... the original is a 2.4.20 precompiled
> redhat kernel, and the new one is 2.4.25 that i
> compiled myself - could it be something i am missing
> in the kernel?? or is there something else i should
> check? i have  /proc/sys/net/ipv4/ip_forward set to 1
> of course.. i dont know what else to look for!!!
> HELP!!! :)
>=20
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail - More reliable, more storage, less spam
> http://mail.yahoo.com
>=20


