From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: Mangling IP Options fields
Date: Mon, 16 May 2005 08:38:07 -0400
Message-ID: <876ef97a05051605385987cc50@mail.gmail.com>
References: <42889068.4010307@hoole.biz>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42889068.4010307@hoole.biz>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Quinton Hoole <quinton@hoole.biz>
Cc: netfilter@lists.netfilter.org

On 5/16/05, Quinton Hoole <quinton@hoole.biz> wrote:
> This newbie needs to add and/or rewrite data in the IP Options fields.
> The MANGLE chain looks like the place to do this, but I don't see the
> appropriate target extensions to achieve it.  It seems easy to mangle
> most other fields (DSCP, ECN, TOS, TTL etc) but no mention of the
> OPTIONS fields.
>=20
> Is mangling of IP options fields supported by netfilter/iptables?

Which IP options are you looking to be able to mangle? If you just
need to be able to mangle the MSS, then check out the TCPMSS target
included in the vanilla Linux kernel. This would also be a good place
to start if you need to create an iptables target that mangles an IP
option of another type. You might also check out the IPV4OPTSSTRIP
target in patch-o-matic (http://svn.netfilter.org), but I don't know
how much utility this will have for you.

--=20
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

