From: Patrick Nelson <pnelson@neatech.com>
Subject: RE: Local rule for Port Forward
Date: 30 Apr 2003 14:04:27 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051736666.14478.4.camel@il.npn>
References: <20030426173540.JVCG1380.lakecmmtao03.coxmail.com@vaio>
Reply-To: pnelson@neatech.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030426173540.JVCG1380.lakecmmtao03.coxmail.com@vaio>
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
To: 'Netfilter List' <netfilter@lists.samba.org>

On Sat, 2003-04-26 at 10:35, Andy Wood wrote:
> 	...perhaps it is self-governing.  Best practices would dictate that
> instant messaging on a firewall is a bad idea.  The idea for a FW is minimal
> packages, no permanent compilers, certainly not X and all of its user-ware.
> It's remote-code-execution waitin' to happen.
> 
> 	Question, why do you SNAT external Jabber traffic to your FW's
> internal IP?  In doing that your server sees the traffic as originating from
> $InIP, vice its true source.
> 
> 
> >  I'm doing port forwarding to a server that runs jabber and everything  
> > works fine, I did notice that if I bring up a jabber client on the  
> > firewall itself I do not get connected.  While this isn't really  
> > needed... I don't totally understand why it doesn't work.  Being  
> > inquisitive... well I just gots to know why!  Can anyone shed some  
> > light?
> > 
> >  My rules for the jabber port forward are:
> > 
> >  iptables -A FORWARD
> >           -i $ExIF -d $JabIP -p tcp --dport $JabPort
> >           -j ACCEPT
> >  iptables -A PREROUTING
> >           -t nat -d $ExIP -p tcp --dport $JabPort
> >           -j DNAT --to-destination $JabIP  iptables -A POSTROUTING
> >           -t nat -d $JabIP -p tcp --dport $JabPort
> >           -j SNAT --to-source $InIP
> 

Well good question.  At first I was going to say because it's the only
thing that made it work...  I tried dropping the snat and this shut
everything down.  So at first I was going to say, not sure why but its
the only way it works...  However...

I did notice that the jabber server itself locked up too.  But this time
I left just the 2 rules in place with out the snat, when I restarted the
server.  Oh my all systems were able to connect.  All in all I guess I
just put that rule in there because someone said... these are what I
use.

I think I understand a bit better how the dnat and snat stuff works.
Thanks for questioning it.


