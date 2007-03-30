From: Ray Leach <spoons@rchq.co.za>
Subject: Re: Debian 2.6.8/bridge/iptables/passive ftp
Date: Fri, 30 Mar 2007 16:56:37 +0200
Message-ID: <1175266597.16490.9.camel@rayw.internal>
References: <351646215@web.de>
Reply-To: spoons@rchq.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <351646215@web.de>
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
To: spaminator@web.de
Cc: netfilter@lists.netfilter.org

Hi

There are 2 kinds of ftp, viz. passive and active. You only cater for
one. See this link for the details: http://slacksite.com/other/ftp.html

Regards

Ray

On Fri, 2007-03-30 at 14:15 +0200, spaminator@web.de wrote:
> Hi there,
> 
> I'm experiencing a strange problem when trying to FTP through a firewalling bridge.
> 
> My FTP client connects to the FTP server ok. But when the client switches to passive mode to get the directory's file list I get 
> 
> stuck.
> 
> The bridge is running on a Debian Sarge box with kernel 2.6.8-3, iptables 1.2.11-10 and bridge-utils 1.0.4-1. The bridge is built from the physical devices eth0 and eth1.
> 
> The bridge is assigned an IP address too to be able to manage it remotely. Hence the INPUT and OUTPUT rules in my /etc/firewall.up.rules. As far as I understood, iptables only uses the FORWARD chain for the bridged packets.
> 
> Here is my /etc/firewall.up.rules:
> #
> # is invoked by /etc/network/interfaces as pre-up for br0
> #
> *filter
> #
> :INPUT DROP [0:0]
> # some input rules
> #
> :FORWARD DROP [0:0]
> -A FORWARD -m state --state INVALID -j DROP
> -A FORWARD -p icmp -j ACCEPT
> # client to server
> -A FORWARD -p tcp -s ! 217.17.69.18/255.255.255.224 --sport 1024:65535 \
> 	-d 217.17.69.18/255.255.255.224 --dport 21 \
> 	-m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -p tcp -s ! 217.17.69.18/255.255.255.224 --sport 1024:65535 \
> 	-d 217.17.69.18/255.255.255.224 --dport 1024:65535 \
> 	-m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
> # server to client
> -A FORWARD -p tcp -s 217.17.69.18/255.255.255.224 --sport 21 \
> 	-d ! 217.17.69.18/255.255.255.224 --dport 1024:65535 \
> 	-m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -p tcp -s 212.117.69.128/255.255.255.224 --sport 1024:65535 \
> 	-d ! 217.17.69.18/255.255.255.224 --dport 1024:65535 \
> 	-m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
> # logging
> -A FORWARD -j ULOG --ulog-nlgroup 1
> #
> :OUTPUT DROP [0:0]
> # some output rules
> #
> COMMIT
> #
> 
> 
> These are all rules in the FORWARD chain. Using "! --syn" or "-m state --state RELATED,ESTABLISHED" instead of "-m conntrack --ctstate RELATED,ESTABLISHED" leads to the same result:
> 
> When I look into the logfile I find an entry where my client:somehighport tries to tcp the server:somehighport. To me it looks like the client seems to want to establish a data-connection and iptables does not recognize these packet as RELATED or ESTABLISHED.
> 
> Just for the crack of it I temporarily added NEW to the second "client to server"-rule. With that it works fine, but leaves the boxes behind the bridge open for any attack on the high ports.
> 
> http, https or anything else is working properly, if I implement them in the FORWARD chain.
> 
> Any suggestions out there?
> 
> bye and TIA
> Jo
> 
> 
> 
> 
> _______________________________________________________________
> SMS schreiben mit WEB.DE FreeMail - einfach, schnell und
> kostenguenstig. Jetzt gleich testen! http://f.web.de/?mc=021192
> 
> 
> 
> 
-- 
Raymond Leach
RCHQ Hobbies (http://www.rchq.co.za/)
(T)+27-82-575-6975 (F)+27-86-652-2773


