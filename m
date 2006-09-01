From: Jonas Meurer <jonas@freesources.org>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Fri, 1 Sep 2006 03:20:55 +0200
Message-ID: <20060901012054.GB23094@freesources.org>
References: <20060831151130.GA32342@freesources.org>
	<000601c6cd14$e07a28a0$0101000a@tanjian>
	<20060831155749.GC32342@freesources.org>
	<44F711D4.5090002@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <44F711D4.5090002@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Netfilter-Users <netfilter@lists.netfilter.org>

On 31/08/2006 Pascal Hambourg wrote:
> >in other words, this module is unusable for ftpservers on non-standard
> >ports, if it's compiled into the kernel?
> 
> Well, I guess you can edit the default port list in the kernel source 
> before compiling.

no, i didn't find any way to do this.

> >how can i open the ports for those ftp-servers without using
> >ip_conntrack_ftp?
> 
> There is a workaround, which requires that the FTP server software be 
> "cooperative". For instance, it must be able to set a range of local 
> ports to use for data transfer connections in passive mode.

i don't know wether the zope ftp-servers support this.

> >iptables -A INPUT -i eth0 -m state --state NEW,ESTABLISHED,RELATED \
> >	-m multiport -p tcp --dports 9621,9721 \
> >	-d **.**.***.**/31 -j ACCEPT
> >
> >iptables -A OUTPUT -o eth0 -m state --state ESTABLISHED,RELATED \
> >	-m multiport -p tcp --sports 9621,9721 \
> >	-d **.**.***.**/31 -j ACCEPT
> >
> >iptables -A OUTPUT -o eth0 -m state --state NEW \
> >	-m multiport -p tcp --sports 9620,9720 \
> >	-d **.**.***.**/31 -j ACCEPT
> 
> What do the "-d **.**.***.**/31" address ranges represent ?

it is 62.75.128.98/31, which should be 62.75.128.98 and 62.75.128.99.

> >but obviously this doesn't work. i still cannot connect to the
> >ftpservers on port 9621 and 9721. what am i missing?
> 
> The first two rules may allow to establish an incoming control 
> connection, although the RELATED state is not needed. But the third rule 
> is not sufficient to allow the server to establish an outgoing data 
> connection in active mode. You need to add the ESTABLISHED state to 
> allow outgoing packets once the connection is established. You also need 
> to create another rule in the INPUT chain as its counterpart for the 
> return traffic, in the ESTABLISHED state.

how would this look like?

let's say, ftp-servers are on port 9621 and 9721. then i need to open
9620 and 9720 as well for ftp, correct?

so what i am missing here:
iptables -A INPUT -i eth0 -m state --state NEW,ESTABLISHED,RELATED \
  -m multiport -p tcp --dports 9621,9721 -d 62.75.128.98/31 -j ACCEPT
iptables -A OUTPUT -o eth0 -m state --state ESTABLISHED,RELATED \
  -m multiport -p tcp --sports 9621,9721 -d 62.75.128.98/31 -j ACCEPT
iptables -A INPUT -i eth0 -m state --state NEW,ESTABLISHED,RELATED \
  -m multiport -p tcp --dports 9620,9720 -d 62.75.128.98/31 -j ACCEPT
iptables -A OUTPUT -o eth0 -m state --state NEW,ESABLISHED \
  -m multiport -p tcp --sports 9620,9720 -d 62.75.128.98/31 -j ACCEPT


after using exactly these commands, i'm still not able to connect to the
ftp-servers.

if i try to login with lftp, it says [Connecting...], then
[FEAT negotation...] and then it hangs forever at
[Making data connection...].

ftp login from localhost works perfectly well, so the ftp-server is not
the problem here.

...
 jonas

