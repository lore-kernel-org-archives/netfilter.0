From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rule question
Date: Sat, 22 Jun 2002 08:53:35 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622075338.KGUZ19225.mta07-svc.ntlworld.com@there>
References: <200206220935.12908.captain.nuke@gmx.at> <20020622094607.H5183@oknodo.bof.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020622094607.H5183@oknodo.bof.de>
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

On Saturday 22 June 2002 8:46 am, Patrick Schaaf wrote:

> OUTPUT is for packets from local processes on the firewall machine,
> which are going out to one or the other network interface. If you have
> a userlevel process bind()ing the external IP of your firewall, and it
> happens to connect() to a machine on the internal network, that rule
> makes it work. If you do not want that, do not use that rule.

Why would you have a process specifically binding to the ext.IP, independent 
of the route it's communicating to the client system ?

Surely if you want to run a daemon for access by internal and external 
clients, then you would just let it bind to both interfaces and handle 
requests on a "sensible" address ?

If you only allow a daemon to bind to the ext.IP, surely you would do that 
because you only want it to respond to external requests ?

Maybe there's a good reason for this somewhere, but it's not the way I've 
ever run things...

 

Antony.

