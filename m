From: "Manikandan.P" <linuxmani@myrealbox.com>
Subject: Re: strange
Date: 08 Nov 2002 20:49:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036768809.16762.58.camel@mani.cybernetsoft.com>
References: <20021108145227.GA20828@myrealbox.com> 
	<032d01c28737$3ae2fa60$13fcc5cb@nextto>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <032d01c28737$3ae2fa60$13fcc5cb@nextto>
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
To: hare ram <hareram@sol.net.in>
Cc: netfilter@lists.samba.org

On Fri, 2002-11-08 at 20:27, hare ram wrote:
> hi
> 
> can you just type 
> iptables -nL -t nat
> and paste here, or
> just do iptable -F and check and u able to ping ?
> 
i hv set the default policy as drop hence if i flush 
the rules i cannot ping it.
moreover the problem is only with the linux boxes ,all my windows
machines happily use the gateway.

Manikandan P. 
> hare
> ----- Original Message ----- 
> From: "Manikandan.P" <linuxmani@myrealbox.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Friday, November 08, 2002 8:22 PM
> Subject: (no subject)
> 
> 
> > Hi all,
> > 
> >  In my n/w iam using iptables firewall in my gateway and now the problem
> > is iam able to use that machine as a default gateway for all the
> > windows machines in my network but i cannot even ping the
> > gateway/firewall from linux machine.
> >  the strange thing is if i ping a client linux machine from the firewall
> > it pings and from then onwards i can ping/use the gateway to browse the
> > net even from a linux machine.
> >  every time if i want to use that g/w from a linux  machine i had to
> > ping the client machine from the firewall to enable it.
> >  iam using iptables 1.2.5/Redhat Linux 7.3
> >  
> > 
> >  can any body help me out to resolve this strange problem
> > 
> > Manikandan P.
> >  
> > -- 
> >  # get Subject header, but remove initial "Subject: " portion
> >  sed '/^Subject: */!d; s///;q'
> > 
> > 
> 
> 
-- 
 # add a leading angle bracket and space to each line (quote a message)
 sed 's/^/> /'


