From: Mark Vevers <mark@vevers.net>
Subject: Re: finding out the culprit ip
Date: Fri, 5 Sep 2003 14:21:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309051421.34362.mark@vevers.net>
References: <20030905183420.GA1850@linux.local> <1062763138.1198.13.camel@india.nsecure.net>
Reply-To: mark@vevers.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1062763138.1198.13.camel@india.nsecure.net>
Content-Description: clearsigned data
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
Content-Type: Text/Plain; charset="us-ascii"
To: Payal Rathod <payal-iptables@staticky.com>
Cc: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Payal,
> On Sat, 2003-09-06 at 00:04, Payal Rathod wrote:

>     A particular machine in my LAN is affected by SoBig virus and is
> sending mails to remote sites. I need to find that IP. The only lead I ha=
ve
> is that it is that IP which is generating maximum SMTP traffic. How do I
> find it out and block it (or maybe clean it)?
IP tables doesn't seem quite the write mechanisme to=20
do this ... how about the obvious - tcpdump ?

tcpdump -i <inside interface> -n -v -s 1500 "(src or dst net <your subnet>/=
<subnetlen>) && tcp port 25"

The one that's not a mail server and is spewing smtp connections will
be the one infected by Sobig. =20

If you want to see the ASCII content add a -X, if you want to record
it use -w <logfile> to write it,  and -r <logfile> when analysing the dump.

Mark
=2D --=20
Mark Vevers.    mark@ifl.net / mark@vevers.net
Principal Internet Engineer, Internet for Learning,
Research Machines Plc. (AS5503)
=2D --
GPG Key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0xB08F3CA3
=46ingerprint: 85BA 30C4 9EC8 1792 4C8C   C31E 58B5 3D1C B08F 3CA3
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/WI3bWLU9HLCPPKMRArZ4AJkBG7XWbp7WNndJVjzkk4qXgvdLoQCfTO2H
C7csW2159/aTylvueQhn0uo=3D
=3DB9iy
=2D----END PGP SIGNATURE-----


