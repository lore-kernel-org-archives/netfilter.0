From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Iptables problem on DNS Server
Date: Fri, 21 Jun 2002 16:46:53 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0206211641140.14381-100000@dns.toxicfilms.tv>
References: <002701c219ad$bfffe390$6500a8c0@systemsadmin>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002701c219ad$bfffe390$6500a8c0@systemsadmin>
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
To: "Joe de Vera Jr." <jhoedv@we-amuse.com>
Cc: netfilter@lists.samba.org

> named.conf {  query-source port 53; } .. what else do i forgot to do here so
> that when i can run the DNS server with firewall on it... can some one show
> me the door thru it.. thanks...
In order to let a DNS work you have to:
- allow it to send packets to port 53 on UDP and TCP to other DNS servers.
- allow it to receive request on port 53 on UDP and TCP from hosts and
  others DNS servers.


Also, i recomend upgrading to 9.2.1 (9.2 contains a bug that allows
someone to down your named) and use ACLs in named.conf, to specify who
is allowed to request a zone transfer, normal request and who is not
allowed anything at all.

Regards,
Maciej Soltysiak



