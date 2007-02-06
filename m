From: Frank Petran <frank.petran@inpho.de>
Subject: Re: How to filter packets resulting from hosts with dynamic
	IP-address
Date: Tue, 6 Feb 2007 16:52:24 +0100
Message-ID: <200702061652.24892.frank.petran@inpho.de>
References: <200702061042.21497.frank.petran@inpho.de>
	<45C896E7.3010105@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C896E7.3010105@riverviewtech.net>
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

Thank you for your reply.

On Tuesday 06 February 2007 15:55, Grant Taylor wrote:
> Use some sort of port knocking setup that will trigger some 
> process on your firewall 
Port knocking is in my opinion a little bit clumsy to use especially if the 
users involved are no experts and something goes wrong.

> Another option might be to look at writing some sort of user space
> daemon that you could have IPTables pass the packets to and return a yes
> / no to the kernel.
I suspected that. 

> However, this would be duplicating some of / a lot 
> of the effort that has gone in to IPTables and thus again sub optimal as
> far as development is concerned.
Well, hooking up to the ip_queue module using the QUEUE target does not seem 
to be a too bad idea. I can still use iptables mechanisms to send only 
packets destined for a special port to the queue target. All that needs to be 
done by the user space deamon is to do a hostname lookup for allowed 
hostnames, compare the looked up IP with the incoming IP and return 
true/false depending on the match.

I know, that this method will not be usefull in very busy routers since 
hostname lookups generate additional traffic and CPU load. Traffic and CPU 
load however is usually not a problem on typical small business or home 
setups on a DSL line with dynamic IP assignment.

Frank
-- 
INPHO GmbH   *   Smaragdweg 1   *   70174 Stuttgart   *   Germany
phone: +49 711 2288 10  *  fax: +49 711 2288 111  *  web: www.inpho.de
place of business: Stuttgart    *   managing director: Johannes Saile
commercial register: Stuttgart, HRB 9586


