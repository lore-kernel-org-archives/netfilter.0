From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: DNAT to another Network?
Date: Wed, 7 Jul 2004 13:07:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407071307.17282.gdh@acentral.co.uk>
References: <200407071129.i67BTbP22745@ps0.linanet.is>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407071129.i67BTbP22745@ps0.linanet.is>
Content-Disposition: inline
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

On Wednesday 07 July 2004 12:51, Svavar =D6rn Eysteinsson wrote:
> Hi everybody.
>
> I have one question about DNAT.
>
> I have a computer foo.com on an ipaddress xxx.xxx.xxx.xxx
>
> Is there any way for me to DNAT all traffic with destination to foo.com
> to another server out-of-town, e.g. computer foobar.com with
> zzz.zzz.zzz.zzz that
> is not on my public network.?

Yes, basically using Computer A to be an IP-level proxy. Note that the sour=
ce=20
address as seen by Computer B will always be that of Computer A. If this is=
=20
not a problem, you can use:

$IPTABLES -t nat -A PREROUTING -p tcp --dport 80 -d xxx.xxx.xxx.xxx -j DNAT=
=20
=2D-to zzz.zzz.zzz.zzz
$IPTABLES -A FORWARD -p tcp --dport 80 -d xxx.xxx.xxx.xxx j ACCEPT
$IPTABLES -t nat -A POSTROUTING -p tcp --dport 80 -d zzz.zzz.zzz.zzz -j SNA=
T=20
=2D-to xxx.xxx.xxx.xxx

Drop the '--dport 80' bits if you want all traffic, not just HTTP to be=20
proxied.

Cheers,
Gavin.


