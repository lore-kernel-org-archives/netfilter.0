From: Martijn Klingens <mklingens@ism.nl>
Subject: Re: Remote Desktop between two NATted computers
Date: Mon, 7 Oct 2002 09:56:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210070956.56219.mklingens@ism.nl>
References: <20021004095756.10588.qmail@wunjo.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021004095756.10588.qmail@wunjo.lan>
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

On Friday 04 October 2002 11:57, Stijn Derudder wrote:
> I'm trying to connect from work to my home computer through Windows XP
> Remote Desktop. Both my work computer and home computer are natted. From
> my work, I can only send outgoing packets through tcp ports 80 and 443,
> so I'm using both port-redirecting and port-forwarding on my home
> firewall like so:
> 
> iptables -t nat -A PREROUTING -i ppp0 -p tcp --sport 1024: --dport 443 -j
> DNAT --to 192.168.0.101:3389 

I haven't done this through NAT, but why are you redirecting incoming traffic 
to port 445 to port 3389? MS Win2k Terminal Services requires port 3389 for 
its desktop protocol and can use port 445 (Active Directory) for the 
integrated windows authentication. This is however not required (on win2k, 
don't know about XP).

Try using

iptables -t nat -A PREROUTING -i ppp0 -p tcp --sport 1024: --dport 443 -j DNAT 
--to 192.168.0.101:445 
iptables -t nat -A PREROUTING -i ppp0 -p tcp --sport 1024: --dport 3389 -j 
DNAT --to 192.168.0.101:3389 

(the first line being optional) and see if that works better. If terminal 
services is nat-able at all that should be the trick.
-- 
Martijn


