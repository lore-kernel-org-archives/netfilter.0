From: "SILES,RAUL (HP-Spain,ex1)" <raul_siles@hp.com>
Subject: Netfilter high availability module?
Date: Tue, 4 Jun 2002 16:39:24 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <6428DE54F23B2E44BAE5EF7D53FF67D10110CF53@gaudi.spain.hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
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
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>
Cc: "SILES,RAUL (HP-Spain,ex1)" <raul_siles@hp.com>

Hi all,
I=B4m trying to find a Linux (kernel 2.4) software module that will =
allow to
create a firewall cluster based on netfilter/iptables.

- Is there any software to create a high availability firewall solution
based on Linux (netfilter)?
I would like to get something similar to the Nokia Firewall-1 solution =
(it
is based on VRRP).

- Does anyone know if the VRRPd module from
http://w3.arobas.net/~jetienne/vrrpd/FAQ works fine with netfilter?

- Does anyoe know if other High Availability Linux solutions work fine =
with
netfilter, for example, the RedHat Piranha software
(http://www.redhat.com/support/wpapers/piranha/) or perhaps the LVS,
http://www.linuxvirtualserver.org.

The idea will be to create a 2 node cluster, both systems filtering =
network
traffic using netfilter, and the desired features will be:
- fault tolerance (if one node falut down, the other will take its
connections, without loosing them).
- load sharing (both nodes are working and filtering traffic at the =
same
time).

I would like to get both, open source and commercial references, if =
any.

Regards,
Ra=FAl

