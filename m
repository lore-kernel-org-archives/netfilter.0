From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Re: Problem seperating FTP & ms-streaming traffic
Date: Mon, 15 Mar 2004 01:57:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004801c40a28$7a8a2560$de0aa8c0@comp>
References: <000d01c40a0e$450f0a50$de0aa8c0@comp> <200403142221.55622.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

> > I have a problem allowing forwarding of passive internal ftp traffic =
and,
> > at the same time disallowing ms-streaming (port 1755).
> >
> > Whenever I allow the passive ftp, it also allows ms-streaming going
> > through.
> >
> > My rules are:
> >
> > iptables -A FORWARD -m state --state NEW,ESTABLISHED -s local_lan =
--sport
> > highports --dport ftp -j ACCEPT
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -s =
local_lan
> > --sport highports --dport highports -j ACCEPT
>=20
> Those cannot be all of your rules.
>=20
> Show us the rest of the rules and we might be able to suggest =
something.
>=20
> Antony.
>=20

You are right, of course, there are a lot more rules, but those are the =
ones=20
that opens up ms-streaming traffic. Well, the complete set of rules I =
use=20
for passive ftp is actually:

# Accept port 21 out
iptables -A FORWARD -p tcp -m state --state NEW,ESTABLISHED -s local_lan =

--sport highports -d all_hosts --dport ftp -j ACCEPT -i eth1    # eth1 =
=3D Internal nic

#Accept reply on port 21 in
iptables -A FORWARD -p tcp -m state --state ESTABLISHED -d local_lan=20
--dport highports -s all_hosts --sport ftp -j ACCEPT -i eth0    # eth0 =
=3D External nic


# Accept high-port to high-port out
iptables -A FORWARD -p tcp -m state --state ESTABLISHED,RELATED -s =
local_lan
--sport highports -d all_hosts --dport highports -j ACCEPT -i eth1

# Accept high-port to high-port reply in
iptables -A FORWARD -p tcp -m state --state ESTABLISHED -d local_lan
--dport highports -s all_hosts --sport highports -j ACCEPT -i eth0


When I uncomment these four iptables commands, ms-streaming passes=20
through. When commented out, it does not.

I have looked at the iptables -L output, and there is no other rules =
that has both
source-ports and dest-ports set to highports (1024:65535).


Bo


