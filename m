From: Patrick Schaaf <bof@bof.de>
Subject: Re: Rule question
Date: Sat, 22 Jun 2002 09:55:20 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622095520.I5183@oknodo.bof.de>
References: <200206220935.12908.captain.nuke@gmx.at> <20020622094607.H5183@oknodo.bof.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020622094607.H5183@oknodo.bof.de>; from bof@bof.de on Sat, Jun 22, 2002 at 09:46:08AM +0200
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
To: Patrick Schaaf <bof@bof.de>
Cc: Patrick Petermair <captain.nuke@gmx.at>, netfilter@lists.samba.org

(replying to myself)
> OUTPUT is for packets from local processes on the firewall machine,
> which are going out to one or the other network interface. If you have
> a userlevel process bind()ing the external IP of your firewall, and it
> happens to connect() to a machine on the internal network, that rule
> makes it work.

For the record, there are methods available today [*] which permit you
to even _force_ select user level processes to be bound on the external IP.
In the context of firewalls, that may be a group of application level
proxies which accept "from the outside world". As usual for an application
level proxy, the next thing it does after accept()ing is making a connection
to an internal IP address.

[*] I am thinking of the chbind feature available with the vserver kernel
patches, found at http://www.solucorp.qc.ca/miscprj/s_context.hc
We are actively using that patch, and it makes a great companion to
iptables. The advantage of such "chbinding" is that even when somebody
happens to be able to exploit that application level gateway from the
outside, it will _not_ be able to impersonate any IP address (as a source)
except the one specified at "chbind" time. This keeps your iptables ruleset
intact and sane.

best regards
  Patrick

