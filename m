From: Patrick Schaaf <bof@bof.de>
Subject: Re: Rule question
Date: Sat, 22 Jun 2002 09:46:08 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622094607.H5183@oknodo.bof.de>
References: <200206220935.12908.captain.nuke@gmx.at>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200206220935.12908.captain.nuke@gmx.at>; from captain.nuke@gmx.at on Sat, Jun 22, 2002 at 09:35:12AM +0200
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
To: Patrick Petermair <captain.nuke@gmx.at>
Cc: netfilter@lists.samba.org

> So far I think I understand everything except this line:
> $IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT
> 
> How can an OUTPUT of the internal interface have the external IP address as 
> source IP ?? And why would it be accepted?

OUTPUT is for packets from local processes on the firewall machine,
which are going out to one or the other network interface. If you have
a userlevel process bind()ing the external IP of your firewall, and it
happens to connect() to a machine on the internal network, that rule
makes it work. If you do not want that, do not use that rule.

> As far as I understand it, the masquerading and stuff is all done in the 
> FORWARD chain.

Wrong. masquerading and all kind of NAT is done in one or the other
chain of the NAT table.

In the FORWARD chain, you just police the _results_ of the NAT action.
NAT itself is in the NAT table.

> I can't think of an example where a packet originating from 
> the internal interface of my firewall can have the external IP as source.

Be careful with your imagination: it becomes larger every year.

best regards
  Patrick

