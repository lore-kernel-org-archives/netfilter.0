From: "Joe de Vera Jr." <jhoedv@we-amuse.com>
Subject: Iptables problem on DNS Server
Date: Fri, 21 Jun 2002 22:29:13 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <002701c219ad$bfffe390$6500a8c0@systemsadmin>
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
To: netfilter@lists.samba.org

hello...

I'm having problem on my linux box running named (BIND 9.2) when I also run
the iptables...

I'm using the latest version of iptables and a 2.4.12 version of kernel.

the scenario is this.. my DNS can't resolve when i activate the firewall on
this machine.. i'm running my iptables in default and with all the blocking
stuff .. for the sites.. and i also activate the commented code in the
named.conf {  query-source port 53; } .. what else do i forgot to do here so
that when i can run the DNS server with firewall on it... can some one show
me the door thru it.. thanks...

joe


