From: Vincent Blondel <vincent.blondel@chello.be>
Subject: Re: FTP Connection problems.
Date: Wed, 25 Aug 2004 17:51:15 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093449075.3120.77.camel@lbedlbxl.dev.xtra-net.org>
References: <1093352834.1894.16.camel@lbedlbxl.dev.xtra-net.org>
	<412B685E.2080000@pbl.ca>
	<1093428637.1781.17.camel@lbedlbxl.dev.xtra-net.org>
	<412C9E90.90902@pbl.ca>
Reply-To: vincent.blondel@chello.be
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <412C9E90.90902@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-08-25 at 16:13, Aleksandar Milivojevic wrote:
> Vincent Blondel wrote:
> > Thanks a lot for all the details but I still get some problems. As I
> > said it all the netfilter source code is compiled in a custom kernel
> > without any modules. 
> > 
> > Concerning the little iptables script I have written, I updated it with
> > your comments and now I get the next script 
> 
> [snip]
> 
> > if [ "$CONN_TRACK" = "1" ]; then
> >         $fw -A INPUT -m state --state ESTABLISHED -j ACCEPT
> >         $fw -A OUTPUT -m state --state ESTABLISHE -j ACCEPT
> >         $fw -A FORWARD -m state --state ESTABLISHED -j ACCEPT
> >         $fw -A INPUT -p icmp -m state --state RELATED -j ACCEPT
> > fi
> 
> Add these too:
> 
> $fw -A OUTPUT -p icmp -m state --state RELATED -j ACCEPT
> $fw -A FORWARD -p icmp -m state --state RELATED -j ACCEPT
> 
> > ... but the connection takes a long time to terminate. If I disable all
> > the rules, ftp connection goes directly but with iptables enabled it
> > takes such 8 seconds to accomplish the annonymomus connection ( with
> > data port and passive models ).
> > 
> > What is this all about ???
> 
> You could use a bit of logging.  Add these as last rules (at the very 
> end of your script):
> 
> iptables -A INPUT -j LOG --log-prefix "INPUT "
> iptables -A OUTPUT -j LOG --log-prefix "OUTPUT "
> iptables -A FORWARD -j LOG --log-prefix "FORWARD "
> 
> Logs will go wherever your kernel logs go.  Usually /var/log/messages.
> 
> Since these will be at the end of your rules, they will log all packets 
> dropped by policy just before they are dropped.  My guess is that you 
> will either find TCP SYN packets to port 113 (ident) or UDP packets to 
> port 53 (DNS).
> 
> To silently disable ident (incoming and outgoing) on FTP server, you 
> could do something like this (you can add line for FORWARDED packets, if 
> you wish):
> 
> iptables -A INPUT -p tcp --sport 1024: --dport 113 \
>     -j REJECT --reject-with tcp-reset
> iptables -A OUTPUT -p tcp --sport 1024: --dport 113 \
>     -j REJECT --reject-with tcp-reset
> iptables -A OUTPUT -p tcp --sport 113 --dport 1024: \
>     -m state --state RELATED -j ACCEPT
> 
> If you want your FTP server to be able to resolve names and reverse 
> lookup IP addresses:
> 
> iptables -A OUTPUT -p udp --sport 1024: --dport 53 \
>     -m state --state NEW -j ACCEPT
> iptables -A OUTPUT -p tcp --sport 1024: --dport 53 \
>     -m state --state NEW -j ACCEPT
> 
> (you can add IP address(es) of your DNS server(s) there)

ok great ... It works now. I just added a rule 

iptables -A FORWARD -i eth1 -o eth0 \
    -p tcp -s 192.168.125.1 -d 192.168.124.1 \
    --sport $UNPRIVPORTS --dport 131 \
    -j REJECT --reject-with tcp-reset

Thanks a lot to all of you for helping me to solve this problem. I will
now investigate on the net what is this IDENT protocol about and I can
now go further with my iptables configuration.

:)
Vincent


