From: Patrick Nelson <pnelson@neatech.com>
Subject: Re: Local rule for Port Forward
Date: 26 Apr 2003 01:05:56 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051344354.14942.2.camel@il.npn>
References: <1051289143.14581.25.camel@il.npn>
	 <002d01c30b6f$70b1c600$0432cd84@sleepy>
Reply-To: pnelson@neatech.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002d01c30b6f$70b1c600$0432cd84@sleepy>
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
To: Netfilter List <netfilter@lists.samba.org>

On Fri, 2003-04-25 at 14:12, David Gaudine wrote:
> > I'm doing port forwarding to a server that runs jabber and everything
> > works fine, I did notice that if I bring up a jabber client on the
> > firewall itself I do not get connected.  While this isn't really
> > needed... I don't totally understand why it doesn't work.  Being
> > inquisitive... well I just gots to know why!  Can anyone shed some
> > light?
> > 
> > My rules for the jabber port forward are:
> > 
> > iptables -A FORWARD 
> >          -i $ExIF -d $JabIP -p tcp --dport $JabPort 
> >          -j ACCEPT
> > iptables -A PREROUTING 
> >          -t nat -d $ExIP -p tcp --dport $JabPort
> >          -j DNAT --to-destination $JabIP
> > iptables -A POSTROUTING
> >          -t nat -d $JabIP -p tcp --dport $JabPort
> >          -j SNAT --to-source $InIP
> 
> I'm new at this, but shouldn't you have INPUT and OUTPUT rules
> if you want to run something on the firewall?  Maybe not, since
> I've just mastered FORWARD, INPUT and OUTPUT and I haven't
> figured out where PREROUTING and POSTROUTING come in
> so maybe you're counting on them to do the job.
> 

Yes, and these are not the only rules to the script.  But these are the
only ones that pertain to Jabber.  Might be an INPUT OUTPUT issue... I
just don't see why seeing the local network has accept rights to the
firewall.


