From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: Dynamicly Updating Rules
Date: Thu, 27 Jun 2002 14:50:34 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJIEIPDOAA.jpatterson@asgardgroup.com>
References: <200206271331.09893.lee@ricis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206271331.09893.lee@ricis.com>
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
To: lee@ricis.com, netfilter@lists.samba.org

I came up with an interesting method for doing this recently.  I haven't
tried it out yet, and it may or may not work for you, but the general method
would be something like:

$IPT -A INPUT -p tcp --tcp-flags ALL SYN,ACK -m state --state ESTABLISHED -m
recent --name validconn --set

$IPT -A INPUT -m recent --name validconn -rcheck --seconds 20 -p tcp --dport
113 -j REJECT --reject-with tcp-reset

with rules specifically for what you want being something more like:

$IPT -A INPUT -p tcp --tcp-flags ALL SYN,ACK -m state --state ESTABLISHED -m
recent --name validconn --set -p tcp --sport 22 -s $SERVER_IP

$IPT -A INPUT -m recent --name validconn -rcheck --seconds 20 -p tcp --dport
113 -j ACCEPT

It's not exactly what you're asking for, but it's fairly close.  Whenever
you make a tcp connection to port 22 on the server, it'll open up port 113
from that server for the next 20 seconds.  (20 seconds was chosen randomly,
put whatever value you want there.)

If you try it and it works, let me know.

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Lee Leahu
> Sent: Thursday, June 27, 2002 2:31 PM
> To: netfilter@lists.samba.org
> Subject: Dynamicly Updating Rules
>
>
> Is there a way to dynamically add and remove rules to an iptables
> live configuration?
>
> For example:
>
> I have a server and a workstion.  the workstation is locked down
> tightly.  I would like for
> when i ssh to a remote server, that iptables automatically opens
> the ident port on the workstation
> to that remote server, and after a connection is made, to
> automatically close it back up again.
>
> Is this possible???
>
> --
> Lee Leahu
> Internet Technologies Specialist
> RICIS, Inc.
>
> email--> lee@ricis.com
> voice--> 708-444-2690
> fax--> 708-444-2697
>
>
>
>


