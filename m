From: Pavel Mores <pvl@uh.cz>
Subject: how to delete *some* netfilter rules?
Date: Fri, 14 Jun 2002 18:18:00 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020614161800.GA6137@kostra.uh.cz>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


Hello,

the problem I'm facing now might well be already solved by someone else
so I thought I'd better ask.

My filter table is filled by several separate independent scripts, each
serving a distinct purpose.  Say that I use one script to generate
firewalling rules and another to enter a couple of packet accounting
rules needed by a monitoring subsystem.  Now, what if I want to flush
the firewalling rules *without* disturbing the traffic monitoring rules?

It certainly is possible to add to the firewall script a "delete_rules"
function that would basically mimic my "insert_rules" function, only
with -D instead of -A or -I.  But this tends to be ugly and avoiding the
need to edit 2 places for every single change is not easy in bash (can't
use perl there).

I thought about placing rules with different purpose into different user
chains, like, having a "FIREWALL-INPUT", "FIREWALL-FORWARD",
"TRAFFIC-MONITOR" etc. chains that would be called from the predefined
chains.  Resetting a subsystem would mean just flushing one or two
user-defined chains.  Well, this *is* simple but it assumes that rules
entered by different subsystems can't be traversed in arbitrary order -
which might turn out a severe limitation.

Basically, what I'm looking for is a way to mark rules with "owner" or
"user" id and then just say "delete any rule where the owner is
firewall".  Does anyone know a simple and robust way how to handle this?
Thanks in advance.

	pvl

P.S.  Please Cc: your replies to me since I'm not subscribed to this
list.


