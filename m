From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: PPTP through iptables firewall
Date: Fri, 7 Feb 2003 19:58:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030207195811.5aa9da41.arnt@c2i.net>
References: <E88493086664D511A1E4000103330E82027FE05C@mail.maconomy.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E88493086664D511A1E4000103330E82027FE05C@mail.maconomy.dk>
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

On Fri, 7 Feb 2003 09:43:22 +0100, 
Niels Bach <NB@maconomy.dk> wrote in message 
<E88493086664D511A1E4000103330E82027FE05C@mail.maconomy.dk>:

> I have an MS PPTP server (win2k) behind a linux firewall (kernel
> 2.4.20 / iptables 1.2.7a) this does not work very well. You can only
> connect from one source at a time. Then there is a 10 minute (600
> seconds) timeout before the next connection from a different source
> can be made. If you come from a LAN that is NAT'ed to one IP address
> (the firewalls) then all these clients can connect simultaneously. So
> it is either one client with a public ip address or several clients
> sharing a public IP address. But once their is a connection (either
> type) everybody else is blocked out.


..we went with poptop servers instead, 2 (soon 3) for an isp 
business, to control access, trottle bandwidth and wrap 802.11 
traffic into tunnels, some of his too cheap nodes are limited 
256 connections, and the 257'th cause a reboot, and, he 
preferred poptop because of his wintendo 9x clients.  

..'http://poptop.org/', we use it on both public and private ip's.
 
> I have tried to patch the kernel (patch-o-matic-20030107) with the
> pptp-conntrack-nat.patch. With this patch the firewall is able to
> recognize the GRE protocol. This can be seen in /proc/net/ip_conntrack
> where the connections involving GRE has changed from UNKNOWN to GRE.
> But with this patch it is not possible to connect, now the windows
> client only reach"verifying username and password" and then times out.

..how do I patch-o-matic Red Hat's 2.4.18-24.8.0 rpm 
kernel source without impossible rejects?  Or, generate 
good old fashion vanilla style patches, so I can _see_ 
what the hell is going on in my boxes.

> Without the patch it is possible to connect to the server one at a
> time and wait 10 minutes before the next connection from a different
> location
> 
> With the patch it is not possible to connect at all.
> 
> I run Debian 3.0 (woody) Kernel 2.4.20 and iptables 1.2.7a with the
> patched version and 1.2.6a with the unpatched version of the kernel.
> 
> I have seen more people talking about this issue on the web, but no
> one seems to have at solution. 
> 
> regards Niels

..my problem is I don't know _why_ poptop works, but my (business) 
client tells me it _does_!?!?!?  And he went ahead and sold a box!

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


