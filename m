From: David Cannings <lists@edeca.net>
Subject: Re: Firewall Script Help
Date: Mon, 8 Mar 2004 20:12:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403082012.34162.lists@edeca.net>
References: <JKELJHHMDHPOLKFBOEGHMECLFDAA.cldavis@speakeasy.net>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <JKELJHHMDHPOLKFBOEGHMECLFDAA.cldavis@speakeasy.net>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Monday 08 March 2004 19:19, Christopher Davis wrote:
> David:
> > Just a quick point, it is (in my opinion at
> > least) far easier to read your
> > firewall rules if they're output from iptables
> > itself.  Following through
> > the script is harder.
> Here it is!  If it is easier to read, I can forward indivual
> txt docs with the same information -- I didn't want to
> attach anything being sent to the list.

Only a few comments, your script seems fairly comprehensive.

> Chain INPUT (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 DROP       all  --  any    any     anywhere
> anywhere           state INVALID
>     0     0 ACCEPT     all  --  any    any     anywhere
> anywhere           state RELATED,ESTABLISHED
>     0     0 ACCEPT     all  --  lo     any     anywhere
> anywhere
>     0     0 DROP       tcp  --  any    any     anywhere
> anywhere           tcp flags:FIN,ACK/FIN
>     0     0 DROP       tcp  --  any    any     anywhere

As I understand it, this means "check the flags FIN and ACK, only match if 
FIN is set and ACK isn't".  This would match packets that only have the 
FIN flag set, which I am fairly sure are valid.  I may need correcting on 
this issure, however.

> anywhere           tcp dpt:ssh
>     0     0 DROP       tcp  --  any    any     anywhere

Do you really want anybody in the world able to connect to your SSH 
server?  Personally, I only allow from IP addresses ranges that I know.  
If you're on DHCP on your home connection, allow the whole /24 or 
even /16 address pool the IP comes from.  That still leaves a few billion 
hosts unable to connect to you.

I say this purely from a paranoid point of view.  As soon as a remote 
exploit is found in SSH malicious people can possibly take advantage of 
it.

> anywhere           tcp flags:SYN/SYN
>     0     0 DROP       tcp  --  any    any     anywhere

Perhaps use the NEW keyword here, it might help.

> Chain BADIP (0 references)
>  pkts bytes target     prot opt in     out     source
>   destination

You don't reference this chain anywhere.  Perhaps you should -I a 
reference to it at the top of the INPUT and OUTPUT chains.

Blocking INVALID packets may do what you do with manual --tcp-flags 
checks, as I do not know the specific internals of it.  In short, it 
blocks packets that aren't related to existing connections but I am 
unsure whether it will also block "illegal" packets so I cannot comment.

David

