From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TCP delay, solved
Date: Fri, 14 Jun 2002 08:55:56 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206140755.g5E7tuA26840@Networker.rockstone.co.uk>
References: <01b801c21373$340fe960$638317d2@pacific.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <01b801c21373$340fe960$638317d2@pacific.net.au>
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

On Friday 14 June 2002 8:15 am, David Luyer wrote:

> [ ident lookups causing tcpd to be slow ]
>
> > There's no satisfactory answer to this problem at present, I think.
>
> So it's a compile option on tcpd.  Recompile with it disabled.

Yes, but that would need to be done by everyone out on the Internet whose 
systems my clients try to contact, otherwise we're still going to get those 
long delays (or a hole in my firewall).

Not what I consider a "satisfactory solution" :-)

 

Antony.

