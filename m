From: Michael Montero <mmontero@mail.communityconnect.com>
Subject: IP Aliasing
Date: Fri, 31 May 2002 12:55:57 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.04.10205311254170.5797-100000@lysa>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I'm trying to set up 2 IP aliases on my firewall box.  It's Redhat 7.2.  I
believe I have the 2 alias (eth0:0 and eth0:1) set up properly.  Is there
anything in particular I need to do with iptables to activate these 2
interfaces?  I've attempted to execute rules with the interface specified
as eth0:0 and iptables does not seem to like that.  Anyone have any docs I
can read about proper IP aliasing under Redhat and what I need to do for
iptables?

Thanks!



