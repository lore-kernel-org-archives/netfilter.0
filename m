From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: coming in through the outgoing hole?
Date: Mon, 21 Nov 2005 14:16:07 -0600
Message-ID: <200511211416.07334.rob0@gmx.co.uk>
References: <FAC4E024BF776842876169173CE2F01309A7B3@mailbox.vikus.com>
	<438222EB.6030702@media-solutions.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <438222EB.6030702@media-solutions.ie>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 2005-November-21 13:41, Keith Whyte wrote:
> Derick Anderson wrote:
> >>INPUT
> >>0     0 ACCEPT     tcp  --  eth0   any     anywhere
> >>anywhere           tcp spt:http dpts:1024:65535
> >>OUTPUT
> >>0    0 ACCEPT     tcp  --  any    eth0    anywhere
> >>anywhere           tcp spts:1024:65535 dpt:http
> >
> >You don't need the 1024:65535 bit in either rule once you use
> > connection tracking. If you're trying to restrict this particular
> > machine from connecting to web servers using a source port below
> > 1024, this is already done for you unless the user is root.
>
> no, i am trying to prevent a remote root user from making a
> connection to my machine.

I don't see the value in this, myself. Whilst it certainly would seem 
odd to have a privileged port on the client end of your httpd, how is 
that a threat to you?

> > If the user is root, then
> >OUTPUT filtering is meaningless (more so than if the user is not,
> > which is still quite a bit). Your OUTPUT filtering should really be
> > egress filtering in the FORWARD chain of your firewall. Hopefully
> > you aren't web surfing with your firewall.
> >
> >Stick around and I'm sure someone else will mention the general
> >pointlessness of OUTPUT filtering.

Usually that would be me, but I think Derick did a fine job of it. :)

> I should have made it more clear in my original post. The machine in
> this scenario is neither a firewall, nor a workstation. It's a
> server, a co-located remote machine. As such it is a kind of a
> workstation, or a potential workstation.
>
>  That doesn't take away from your agrument that OUTPUT filtering is
> pointless, but in this case, I decided to implement some OUTPUT
> filtering to be sure and avoid users (non-root of course) from using
> a shell account (or their php-enabled web account) to access certain
> services.

Sometimes, I will admit, targeted OUTPUT filtering makes sense. But to 
rein in shell users, I am not sure. If you cannot trust these users to 
abide by your ToS and AUP, you don't want them in on shell accounts. :) 
Well, *I* wouldn't. I'd worry about them trying to root me.

> Thanks very much for the rest of your response, and I think it
> answers more or less my question about using conntrack, but to try
> and make it more clear, the situation I wanted to avoid is the
> initiation of a connection, from source port 80 (by root, of course)
> to port 7775 on the server machine. With the current rules this would
> pass the firewall.
>
> >iptables -A OUTPUT -p tcp -m state --state NEW --dport 80 -j ACCEPT
> >
> >What happens is the first packet goes out (in the NEW state, you
> > could get even more restrictive and use the '--syn' or '--tcp-flags
> > SYN,RST,ACK SYN' to make sure it's a SYN packet) on port 80 and
> > hits the remote server. The return packet (now ESTABLISHED) hits
> > the ESTABLISHED match at the top of your INPUT ruleset there and
> > goes on its merry way. The next packet out from the machine (also
> > ESTABLISHED) hits the ESTABLISHED match in the OUTPUT chain and is
> > accepted as well. Everything else that happens until the connection
> > is closed goes through the RELATED,ESTABLISHED rules and not
> > through the '--dport 80' rule.
>
> I'm also using the rules for traffic counters, so I don't want to do
> that, but yes, it would simplify things as lot.

I'm not sure what you mean, but I think I have a good suggestion 
nonetheless. :) Put your --state RELATED,ESTABLISHED rule in a chain 
all by itself, and call that as a target after your counter rules.

> >>as a hypothetical example of the problem:
snip
> That's totally understood, I wasn't in anyway trying to use netfilter
> to protect the box from somebody who already has root!
> I am trying to protect it from root user on a remote attacker
> machine, I was referring to that remote machine when I mentioned a
> potential web client making connections from port 80.

Again, I am not understanding the threat. If you're running services 
like file sharing, I can see where the presence of a hostile root user 
behind your firewall might be cause for worry. But I guess you have 
some other reason for worry ...
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

