From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: adding counters
Date: Mon, 16 Sep 2002 14:49:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209161449.58221.roy@karlsbakk.net>
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

hi

I've created a new table with the following lines, and inserted a -j coun=
ters=20
on top of INPUT. Wouldn't this allow me to count packets per port? All I =
get=20
is the -j counters line increasing it's byte count, but none of the below=
=20
does...

roy

Chain counters (1 references)
target     prot opt source               destination
RETURN     tcp  --  anywhere             anywhere           tcp dpt:pop3s
RETURN     tcp  --  anywhere             anywhere           tcp dpt:ircs
RETURN     tcp  --  anywhere             anywhere           tcp dpt:https
RETURN     tcp  --  anywhere             anywhere           tcp dpt:imap
RETURN     tcp  --  anywhere             anywhere           tcp dpt:pop3
RETURN     tcp  --  anywhere             anywhere           tcp dpt:http
RETURN     tcp  --  anywhere             anywhere           tcp dpt:smtp

and=20
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


