From: Sander Sneekes <sander@dmdsecure.com>
Subject: doing prerouting/postrouting/output logfile problems
Date: 21 Oct 2002 15:57:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035208680.14664.26.camel@sander.dmdint.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi,

I got a firewall (redhat 7.2/iptables) with behind it a couple of
servers running apache/mail etc.

Now i have 36 public ip's and for the outside it seems like the
server are running public ip's i do that as followed :

firewall
eth0 = x.x.x.x (public ip)
eth1 = 192.168.2.1 (internal ip)

webserver

eth0 = 192.168.2.2

 ${IPTABLES} -t nat -A PREROUTING -p tcp -d x.x.x.x --dport 80 -j DNAT
--to-destination 192.168.2.2
        
 ${IPTABLES} -t nat -A POSTROUTING -p tcp -d 192.168.2.2 --dport 80 -j
SNAT --to-source 192.168.2.1
        
 ${IPTABLES} -t nat -A OUTPUT -p tcp -d x.x.x.x --dport 80 -j DNAT
--to-destination 192.168.2.2

This work perfect people from the outside using x.x.x.x are getting a
nice website. And also people inside the network using x.x.x.x also
getting a nice site.

But now here is my problem because in the logfile's of the site I get
all entry's coming from 192.168.2.1 instead off when a client viset
our site their ip. How can i solve it.? 

I also use these lines for do mail traffic and I had some problems with
open Relaying. Also because 192.168.2.1 was allowed to mail.

thanks for you help.

Cheers
Sander




