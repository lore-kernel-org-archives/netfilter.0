From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: sub interface filtering
Date: Wed, 2 Apr 2003 21:38:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c2f94f$7ac57a10$0401000a@sterenborg.info>
References: <000b01c2f947$feb84a80$8b01a8c0@win2k.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000b01c2f947$feb84a80$8b01a8c0@win2k.com>
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

> Hi guys I have the following setup and rules. And I cant seem to get
the filtering to work.
> eth2:0
>=20
> <routeable internetIP/28>
>=20
> eth2:1
>=20
> <routeable internetIP/28>

AFAIK it is because you cannot filter eth<x>:y (but you can filter the
IP address of course).


Rob


