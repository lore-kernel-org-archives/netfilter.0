From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables Problem on DNS Server
Date: Sat, 22 Jun 2002 19:32:12 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622183214.LXSQ4626.mta02-svc.ntlworld.com@there>
References: <20020622173606.02EE74692@lists.samba.org> <000601c21a98$162eeb40$6500a8c0@systemsadmin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000601c21a98$162eeb40$6500a8c0@systemsadmin>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

On Sunday 23 June 2002 10:26 am, Joe de Vera wrote:

> > From: Antony Stone <Antony@Soft-Solutions.co.uk>
> >
> > Okay - the answer is simple, then.   You have no rule allowing udp pack=
ets
> > into the machine on port 53.

> oic... so now how will i going to add that udp packets allow to my rulese=
t?
> what parameter that i supposed to put on my iptables command...

In the middle of your listing earlier was:

ACCEPT =A0 =A0 tcp =A0-- =A00.0.0.0/0 =A0 =A0 =A0 =A0 =A0 =A00.0.0.0/0 =A0 =
=A0 =A0 =A0 =A0tcp dpt:53 state=20
NEW

which must be from a rule something like:

iptables -A INPUT -p tcp --dport 53 -m state --state NEW -j ACCEPT

find that rule, copy it, and change the tcp for a udp:

iptables -A INPUT -p udp --dport 53 -m state --state NEW -j ACCEPT

=20

Antony.

