From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: [OT] Strange bash phenomenon
Date: Mon, 13 Feb 2006 10:50:59 -0500
Message-ID: <NEBBLLCNFOFHMALJMDDEKEOPBNAB.pablo@blueoakdb.com>
References: <1139665492.21361.37.camel@localhost>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139665492.21361.37.camel@localhost>
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
To: Netfilter users list <netfilter@lists.netfilter.org>



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of John A.
> Sullivan III
> Sent: Saturday, February 11, 2006 8:45 AM
> To: Netfilter users list
> Subject: [OT] Strange bash phenomenon
>=20
> Case #1
> -------
> FILES=3D/etc/config/iptables*
>
> [ snipped ]
>
> Case #2
> -------
> FILES=3D$(echo /etc/config/iptables*)
>=20
> Any ideas why the latter one works fine but the other does not? Just
> curious.

Hi John,

It has to do when the shell does the expansion.  In the first case when =
you assign 'FILES=3D', you're assigning it the string and it's not =
expanded by the shell.  If you want to change the behavior, you can do =
this:

	FILES=3D${/etc/config/iptables*}

btw, Ilove the ${FILES%% *} trick.  I didn't know about it.  The shell =
is quite nifty.

-pablo


