From: Mariusz Kruk <kruk@rdc.pl>
Subject: Re: Confirm: letting certain packages pass through un-natted
Date: Mon, 26 Sep 2005 11:35:02 +0200
Message-ID: <4337C0C6.5040606@rdc.pl>
References: <4337A526.3@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4337A526.3@canada.com>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@lists.netfilter.org

David Leangen napisa=C5=82(a):
> Could somebody please confirm whether or not I'm doing this right?
>=20
> I am using, in my nat table:
>=20
> -A PREROUTING -s 192.168.0.0/16 -d 192.168.1.1 -j ACCEPT
>=20
> Shouldn't all packets, including ICMP packets, get passed through to=20
> 192.168.1.1 if originating from the local network?

Not necesarily.
Even if you pass the packet in nat table, you still might drop it in=20
filter table. I know the ACCEPT target may be used in every (?) table,=20
but it's a matter of good practice to filter packets in filter tables=20
and nat in nat tables and so on. So I would suggest moving this from nat=20
table to filter table and from PREROUTING to FORWARD.



