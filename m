From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Possible to block ports by user group?
Date: Sun, 04 Jul 2004 16:59:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088953144.11637.57.camel@anduril.intranet.cartel-securite.net>
References: <opsal65hoe4evsfm@smtp.pacific.net.th>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <opsal65hoe4evsfm@smtp.pacific.net.th>
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
To: Michael Frank <mhf@linuxmail.org>
Cc: netfilter@lists.netfilter.org

Le dim 04/07/2004 =E0 15:16, Michael Frank a =E9crit :
> Would like to block ports depending on the group in use

See owner match :

cbr@anduril:~$ iptables -m owner --help
iptables v1.2.11
[...]
OWNER match v1.2.11 options:
[!] --uid-owner userid     Match local uid
[!] --gid-owner groupid    Match local gid
[!] --pid-owner processid  Match local pid
[!] --sid-owner sessionid  Match local sid
[!] --cmd-owner name       Match local command name

--gid-owner seems to satisfy your needs.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

