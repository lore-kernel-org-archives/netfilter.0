From: Lee Leahu <lee@ricis.com>
Subject: Dynamicly Updating Rules
Date: Thu, 27 Jun 2002 13:31:09 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206271331.09893.lee@ricis.com>
Reply-To: lee@ricis.com
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Is there a way to dynamically add and remove rules to an iptables live co=
nfiguration?

For example:

I have a server and a workstion.  the workstation is locked down tightly.=
  I would like for
when i ssh to a remote server, that iptables automatically opens the iden=
t port on the workstation
to that remote server, and after a connection is made, to automatically c=
lose it back up again.

Is this possible???

--=20
Lee Leahu
Internet Technologies Specialist
RICIS, Inc.

email--> lee@ricis.com
voice--> 708-444-2690
fax--> 708-444-2697


