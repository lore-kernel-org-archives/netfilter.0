From: "Preston Wade" <Preston_Wade@hilton.com>
Subject: Connection Tracking
Date: Fri, 21 Jun 2002 09:54:11 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <0B2759D401C1D211ACA500805FFE2C3F0636753D@cmxserv3.hilton.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

Hello All,

I am curious to get other peoples thoughts about the 5 Day timeout for the
following variable: TCP_CONNTRACK_ESTABLISHED.  This value seems high for
high traffic firewalls.  For instance if I wanted to use netfilter for a
firewall between my corporate network and my WAN, which has roughly 2300
nodes and 40000 users.  It seems to me like you would run out of STATE
memory and with most connection being TCP it would take 5 days before most
of them would timeout.  I realize I could modify the value and recompile...
although it would be nice to be able to modify these with sysctl.conf or via
the /proc filesystem.

Thanks,
Preston


