From: Patrick Schaaf <bof@bof.de>
Subject: Re: Rule question
Date: Sat, 22 Jun 2002 10:08:24 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622100824.J5183@oknodo.bof.de>
References: <200206220935.12908.captain.nuke@gmx.at> <20020622094607.H5183@oknodo.bof.de> <20020622075338.KGUZ19225.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020622075338.KGUZ19225.mta07-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Sat, Jun 22, 2002 at 08:53:35AM +0100
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

Hi Anthony,

> Why would you have a process specifically binding to the ext.IP, independent 
> of the route it's communicating to the client system ?

See my second mail (reply to myself) for one situation where I want that.
In general, I _like_ my internal machines to easily be able to look at
a source IP, and see whether it originated internally, or externally.
IOW, I like the incoming TCP connections through my application level
proxy to use the firewall's external IP address as the source, for the
sake of packet filters on my internal nodes.

> Maybe there's a good reason for this somewhere, but it's not the way I've 
> ever run things...

I do. It's very nice to have iptables so capable that it supports all our
different ways of doing things.

all the best
  Patrick

