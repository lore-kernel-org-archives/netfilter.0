From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ftp connection tracking
Date: 29 Jul 2003 13:41:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059478900.844.18.camel@elendil.intranet.cartel-securite.net>
References: <200307291322.04698.heinrici76@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307291322.04698.heinrici76@gmx.de>
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
To: Axel Heinrici <heinrici76@gmx.de>
Cc: netfilter@lists.netfilter.org

Le mar 29/07/2003 =E0 13:22, Axel Heinrici a =E9crit :
> I have problem connecting to a ftp-server on a non-standard port.
[...]
> What options do I have to aply when inserting the modules?

As far as I can remember :

	modprobe ip_conntrack_ftp port=3D21,2121

You can track 8 ports this way.

As a more general way to get modules options, use modinfo command.
Unfortunately, I do not have ip_conntrack_ftp built as module, but this
what you can get :

cbr@elendil:~$ modinfo bonding
filename:    /lib/modules/2.4.20/kernel/drivers/net/bonding.o
description: <none>
author:      <none>
license:     "GPL"
parm:        max_bonds int, description "Max number of bonded devices"
parm:        miimon int, description "Link check interval in
milliseconds"
parm:        mode int, description "Mode of operation : 0 for round
robin, 1 for active-backup, 2 for xor"
parm:        arp_interval int, description "arp interval in
milliseconds"
parm:        arp_ip_target string, description "arp target in n.n.n.n
form"
parm:        updelay int, description "Delay before considering link up,
in milliseconds"
parm:        downdelay int, description "Delay before considering link
down, in milliseconds"

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

