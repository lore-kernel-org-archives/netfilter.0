From: bjorn@ruberg.no (=?iso-8859-1?q?Bj=F8rn?=)
Subject: Re: ssh rule
Date: 13 Jan 2006 11:11:57 +0100
Message-ID: <uiz7j94fnde.fsf@false.linpro.no>
References: <20060113100740.53076.qmail@web33407.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060113100740.53076.qmail@web33407.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Britto <britto_antony@yahoo.com> writes:

> Hi=20
>=20
> Can you pls anyone help me correct it if i am wrong. I
> have the following entries in the iptables=20
>=20
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> iptables -A INPUT -p tcp --dport 22 -j ACCEPT
>=20
> but still i can not do ssh to linux box from the PC
> which is sitting in the internal network.

How do you think the server's response to your login attempts will
find the way back to you when you tell it to drop all output traffic?

Hint: Check out the ESTABLISHED and RELATED states. When you
understand what they do, use them in your output rules.

--=20
Bj=F8rn


