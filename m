From: Kim Jensen <kimj@dawn.dk>
Subject: Re: SSH and NAT
Date: Mon, 24 Mar 2003 23:14:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303242314.13073.kimj@dawn.dk>
References: <20030324182922.GF8391@netinertia.co.uk> <NABBJOOEOFODEALNMJAJCEFEHOAA.B-Morgan@concentric.net> <20030324203629.GH8391@netinertia.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030324203629.GH8391@netinertia.co.uk>
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
To: James O'Gorman <james@netinertia.co.uk>, netfilter@lists.netfilter.org

On Monday 24 March 2003 21:36, James O'Gorman wrote:
> What I thought, was if I set up box1.domain.com and box2.domain.com as =
A
> records of my external IP with my ISP, then get iptables to read
> 'box1.domain.com' from a string in the header it might work, but
> obviously not. Does the IP packet header only contain IP, or address as
> well?
>
The IP packet only contain some primitive information - if you wish to de=
al=20
with names, then you have to use DNS. You can't store the name informatio=
n in=20
the packet header.

I can recommend that you read about IP headers if you wish to know more a=
bout=20
the construction of these magic little packets :-)

/Kim


