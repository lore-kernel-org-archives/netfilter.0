From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: Routing problem
Date: Fri, 13 Feb 2004 09:16:20 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040213171620.97236.qmail@web13904.mail.yahoo.com>
References: <003301c3f24e$a8683b80$1530a8c0@HUSH>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003301c3f24e$a8683b80$1530a8c0@HUSH>
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
Content-Transfer-Encoding: 7bit
To: Carlos Fernandez Sanz <cfs-netfilter@nisupu.com>, netfilter <netfilter@lists.netfilter.org>

AH, I think I get what you are saying.  
You have a linux doing NAT, 1 public IP on the outside
and 1 private on the inside.  You also have a spare
public IP which you want to put on a client so they
can do some funky things which requires them having a
real IP address.
1 question about your statement.  Where you say
"carrier expects traffic to come from one WAN IP"
kinda goes against what you implied by "public IP 2". 
If you have 2 pubic IPs, they they cannot expect your
traffic to come from 1 WAN IP.  Even if you NAT a
private address explicitly to the 2nd public IP
address that counts as 2.  Do you have 1 or 2 public
IP addresses?  
If you are given 2, then you should be able to do the
config mentioned, putting the client on the same side
as the router's public IP (since they are both in the
same class C).  If you have 1, well you are SOL.








--- Carlos Fernandez Sanz <cfs-netfilter@nisupu.com>
wrote:
> > >
> > > Before you ask: I can't connect this special
> computer to the same place
> I
> > > connect the linux box (which would be the
> obvious solution) because the
> > > carrier expects traffic to come from one WAN IP,
> owned by the linux box.
> >
> > How do they expect you to use any of the other IPs
> in the pool they have
> given
> > you?
> 
> I do use them by redirecting traffic from the linux
> box to the destination
> boxes (such as all trafic for public IP 2 goes to
> 192.168.21.2, for
> example). This works fine, *except* in this
> particular case, where any
> NATing is not an option. I need the computer behind
> the linux box to
> actually own the public address, because it signs
> packets with it.
> 
> 


__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html

