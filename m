From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Destination NAT
Date: Thu, 29 Jan 2004 09:46:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401290946.21862.Antony@Soft-Solutions.co.uk>
References: <147E1D375819F44680C3E5BFB6424C52DFC450@bcexc01.bue299.comafi.com.ar> <200401290913.54045.Antony@Soft-Solutions.co.uk> <1075369661.1999.94.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075369661.1999.94.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thursday 29 January 2004 9:47 am, Ray Leach wrote:

> On Thu, 2004-01-29 at 11:13, Antony Stone wrote:
> >
> > No.   You cannot use netfilter to create duplicates of packets.  
> > Netfilter will perform various operations on the packets which exit, but
> > it won't make multiple versions of what was originally one packet.
>
> With the exception of the MIRROR patch ...

But even that only creates one packet out in response to one packet in (I 
think?).

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


