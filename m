From: "=?ISO-8859-1?Q?Bj=F6rn=20Reese?=" <ReeseB@minimax.de>
Subject: Server crash after LIST_DELETE in Log
Date: Wed, 24 Mar 2004 17:04:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <s061bfaf.021@odnw1.minimaxgmbh.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

** Low Priority **

Hello,

 I have a strange Problem with (I guess) the Netfilter. I have a Proxy-Serv=
er running, that is dual-homed with a transparent Squid on one Interface =
listening. After some time, the syslog lists these messages:

Mar 24 15:36:18 Proxy kernel: LIST_DELETE: net/ipv4/netfilter/ip_conntrack_=
core.c:299 `&ct->tuplehash[IP_CT_DIR_REPLY]'(e96c0d64) not in &ip_conntrack=
_hash[hr].
Mar 24 15:36:39 Proxy kernel: LIST_DELETE: net/ipv4/netfilter/ip_conntrack_=
core.c:299 `&ct->tuplehash[IP_CT_DIR_REPLY]'(dd67fd24) not in &ip_conntrack=
_hash[hr].
Mar 24 15:36:55 Proxy kernel: LIST_DELETE: net/ipv4/netfilter/ip_conntrack_=
core.c:299 `&ct->tuplehash[IP_CT_DIR_REPLY]'(dc976864) not in &ip_conntrack=
_hash[hr].

5 seconds more...
and the server freezes...

Sometimes the machine runs well for a whole week, sometimes a few hours.

I've googled around for it, and saw some other people having equal =
Problems, most of the time with older kernels.

The Hardware I use is a Compaq ProLiant DL 380, OS is S.u.S.E Linux 9.0 =
with a self-compiled 2.63 Kernel, and iptables 1.2.9. I've had earlier =
versions of iptables & Linux running, but the Problem stayed the same.

It'd be really nice, if someone's got a clue about that.

Best Regards and thanks in advance for any hints.

bj=F6rn







