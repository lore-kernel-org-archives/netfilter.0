From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: sendto: Operation not permitted
Date: Fri, 31 May 2002 00:58:32 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020531005832.K27307@funkyjesus.org>
References: <Pine.LNX.4.44.0205301011270.31451-100000@paix.pilosoft.com> <200205301955.g4UJtIA17159@Networker.rockstone.co.uk>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200205301955.g4UJtIA17159@Networker.rockstone.co.uk>; from Antony@Soft-Solutions.co.uk on Thu, May 30, 2002 at 08:55:17PM +0100
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

On Thu, May 30, 2002 at 08:55:17PM +0100, Antony Stone wrote:
> On Thursday 30 May 2002 3:13 pm, alex@pilosoft.com wrote:

> > > This type of ICMP message will be RELATED to an existing TCP
> > > connection, therefore it will be allowed through the firewall by the
> > > sort of rulset Claudio was using - if you recall, this was:
> >
> > Ah, I didn't know iptables are smart enough to realize that!
> 
> Yes, this is one of the beautiful things about netfilter / iptables - ICMP 
> packets are automatically recognised as being RELATED to the TCP packets 
> which they're, well, related to.

How does netfilter determine if the ICMP packet is RELATED to anything in
the state table?  Anyone suggest documentation that details this?

-- 
FunkyJesus System Administration Team


