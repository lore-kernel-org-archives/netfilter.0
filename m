From: Wayne Topa <brittman@capital.net>
Subject: Re: I need help , please
Date: Fri, 5 Jul 2002 18:55:32 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705225532.GA7089@dmcom.net>
References: <NJEFLNJDIFFNMHDEBKMJAEKADOAA.jpatterson@asgardgroup.com> <20020705191417.UWDG4119.mta06-svc.ntlworld.com@there> <020c01c2242b$8c9565b0$8703000a@aid.inf.cu> <20020705201118.DFBE4626.mta02-svc.ntlworld.com@there> <024901c22432$8885a5a0$8703000a@aid.inf.cu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <024901c22432$8885a5a0$8703000a@aid.inf.cu>
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

david(david@aid.inf.cu) is reported to have said:
> Tony:
> 
> When I write these rules in the command line all is OK and  the rules works
> fine.
> But if I put the same rules in a script :
> 
> #!/bin/bash
Add
IPTABLES=/sbin/iptables  #(Or where your iptables binary is)
> # Standard default policies

Change iptables to $IPTABLES

$IPTABLES -P FORWARD ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P INPUT DROP

> iptables -P INPUT DROP
> 
> 
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
> 
-- 
I haven't lost my mind; it's backed up on tape somewhere.
_______________________________________________________

