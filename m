From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Control outbound access on a per-application level
Date: 02 Oct 2002 17:38:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033573113.735.45.camel@elendil>
References: <1033569217024171@spray.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1033569217024171@spray.se>
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
To: Gustav Svensson <gurra16@spray.se>
Cc: netfilter@lists.netfilter.org

Le mer 02/10/2002 =E0 17:23, Gustav Svensson a =E9crit :
> Is it possible to set "outbound" rules based on what binary application=
 it is that
> wants to access the Internet?

You can use --cmd-owner switch from owner module (lastest patch-o-matic)
which provides you the ability to choose a command name.

But unfortunately, it just match the command name, and does not check
binaries location in the filesystem. If I authorize ping command, anyone
who launch a command called ping will be granted (e.g. ln -s
/usr/bin/ssh ping), whatever it is. Which means it is imho quite
uneffective on systems where users can build and/or install their own
stuff, even if you considerer hardening command filtering with other
stuff :

	iptables -A OUTPUT -m owner --cmd-owner ping -p icmp \
		--icmp-type echo-request -j ACCEPT

I am still to launch to tool that communicate over ICMP, as an example.

I was considering a device/inode check, but I am afraid it is far over
my skills to add this to that very module. You would give iptables the
complete path and tool will get device ID and inode number for the
binary and store it as match. Then, Netfilter checks the file that owns
the socket, check it device ID and inode number and take the decision.

My 2 cents of euro.

--=20
C=E9dric Blancher
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

