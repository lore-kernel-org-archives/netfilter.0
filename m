From: 'Jonas Meurer' <jonas@freesources.org>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Thu, 31 Aug 2006 17:57:49 +0200
Message-ID: <20060831155749.GC32342@freesources.org>
References: <20060831151130.GA32342@freesources.org>
	<000601c6cd14$e07a28a0$0101000a@tanjian>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000601c6cd14$e07a28a0$0101000a@tanjian>
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
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: Netfilter-Users <netfilter@lists.netfilter.org>

On 31/08/2006 Rob Sterenborg wrote:
> > where can i set the ports for ip_conntrack_ftp?
> > 
> > if i load it as module, i can use
> > 'modprobe ip_conntrack_ftp ports=21,31,41'
> > 
> > but if the module is compiled into the kernel, i have no idea how to
> > set the ports. i didn't find anything in either /proc or
> > kernel-source/Documentation. 
> 
> AFAIK you can't: you can only do that when it's compiled as a module.

in other words, this module is unusable for ftpservers on non-standard
ports, if it's compiled into the kernel?

what reason does this have?

i run several zope instances on a server, all of them providing a
ftpserver.

i use firehol as firewall software.

how can i open the ports for those ftp-servers without using
ip_conntrack_ftp?

what i'm currently doing is:

iptables -A INPUT -i eth0 -m state --state NEW,ESTABLISHED,RELATED \
	-m multiport -p tcp --dports 9621,9721 \
	-d **.**.***.**/31 -j ACCEPT

iptables -A OUTPUT -o eth0 -m state --state ESTABLISHED,RELATED \
	-m multiport -p tcp --sports 9621,9721 \
	-d **.**.***.**/31 -j ACCEPT

iptables -A OUTPUT -o eth0 -m state --state NEW \
	-m multiport -p tcp --sports 9620,9720 \
	-d **.**.***.**/31 -j ACCEPT

but obviously this doesn't work. i still cannot connect to the
ftpservers on port 9621 and 9721. what am i missing?

...
 jonas

