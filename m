From: Geffrey Velasquez <g_netfilter@netfids.com>
Subject: IP Alias and NAT problems
Date: Mon, 08 Dec 2003 23:17:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FD54CCC.5080904@netfids.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi Friends,

Actually I have a firewall running RedHat 8 with almost the latest=20
kernel (from RH).
The interface eth0 has many aliases and there is a nat rule:

iptables -t nat -A POSTROUTING -s 10.x.x.x/16 -j SNAT --to-source=20
200.x.x.10-200.x.x.21

(200.x.x.10-200.x.x.21 are IP aliases)

Everthing works fine, but when I try to do the same on RedHat9 (other=20
box) running the latest kernel it doesnt works. Only works with the IP=20
address of the interface (no alias), like this:

iptables -t nat -A POSTROUTING -s 10.x.x.x/16 -j SNAT --to-source 200.x.x=
.9

What is happening? why dont works SNAT with aliases? or maybe is not a=20
netfilter problem?


Thanks in advance.

Geffrey Vel=E1squez.





