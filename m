From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TCP delay, solved
Date: Fri, 14 Jun 2002 10:18:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206140919.KAA11259@slate.rockstone.co.uk>
References: <000001c2137d$19b6b800$638317d2@pacific.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000001c2137d$19b6b800$638317d2@pacific.net.au>
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

On Friday 14 June 2002 9:25 am, David Luyer wrote:

> > Easy solution:
> >
> >   deny (connection reset) rather than drop the connections
>
> I meant reject.  From the man page:
>
> Why connection reset?  For idiots at the other end who firewall all
> ICMP.

Same problem.   Leaves me with a port on my Firewall which responds to nmap 
etc.   All other ports on my Firewall return nothing, so the machine is 
invisible - I don't want port 113 standing out by doing something different.

 

Antony.

