From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: U?LOG filters?
Date: Mon, 23 Sep 2002 15:36:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209231536.21751.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

hi all

I've been using iptables for a while now, logging connection attempts to=20
illegal/closed ports. but. The logs fill up with old/broken http/whatever=
=20
connections (SPT 80 DPT lots).

Today I have the rules
ACCEPT
ACCEPT
ACCEPT
etc.
DROP (don't log this)
LOG        all  --  anywhere             anywhere           LOG level \
=09warning  prefix `Attack: '

can I set a --state here to only log the 'true' attacks?

roy
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


