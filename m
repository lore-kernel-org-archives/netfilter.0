From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Fwd: Critque of IPTables Firewall
Date: Fri, 13 Oct 2006 10:34:09 +0200
Message-ID: <452F4F81.5050200@freemail.hu>
References: <f22ceeb10610110654j7372e4afs2ec81cdd9ce18e43@mail.gmail.com>
	<f22ceeb10610110657x24d2979bxeb3f0e2e08f9ae11@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f22ceeb10610110657x24d2979bxeb3f0e2e08f9ae11@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Idgarad <idgarad@gmail.com>
Cc: netfilter@lists.netfilter.org

Idgarad =EDrta:
> There are many guides on how to write a firewall script functionally,
> but form is disregarded. Is the following a decent, well written
> firewall (Form, not function)? It's is clear and easy to follow? In
> the event that I get hit by a bus would someone else with IPTables
> experience be able to pick up where I left off?
Hopefully an experienced firewall professional would understand it... :)
Not because it is too complicated but not everyone uses the same=20
programing technics and style.

> Has anyone from the Netfilter's list thought about writing a
> Best-Practices guide not from the functional side, but rather the form
> side of writing IPTABLES scripts and what not?
Well... I published my firewall script two months before...
( https://lists.netfilter.org/pipermail/netfilter/2006-August/066404.html=
 )

Let me quote Jan Engelhardt's reply:

"No one ever reads through that mess, really. There are so many scripts f=
loating
around, the number is just too outstanding, and it makes tired after a wh=
ile.

Jan Engelhardt"

Well... I think this is okay but anyway I would be glad if a guide would =
exist.
So I am a bit interested ...
=20


For example I would propose the following format:

iptables -t <table> <command> -j <jump_target> [filters]

table: mangle, nat, filter...
command: -A, -I, -P...
jump_target: ACCEPT, DROP ...
filters: -p tcp, -p tcp -s 192.168.0.1....

There could be other rules like separating the tables and so on...

Swifty

