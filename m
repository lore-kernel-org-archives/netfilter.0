From: Jason Opperisano <opie@817west.com>
Subject: Re: multiple webservers behind iptables
Date: Wed, 09 Feb 2005 17:45:13 -0500
Message-ID: <1107989113.4619.14.camel@hubcap.ljm.dom>
References: <420A5564.7020000@unp.edu.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <420A5564.7020000@unp.edu.ar>
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

On Wed, 2005-02-09 at 13:24, Raul I. Becette wrote:
> Hello list
> 
> This is my first post.
> I am in charge of a LAN connected to internet through a firewall box 
> PIII 500MHz with iptables 1.2.10.
> 
> There are different internal webservers that I don't adminnister and are 
> located physically in different parts of the building.
> There is an internal DNS server which I administer to resolve internal 
> www queries.
> 
> My problem is that from the outside I cannot access those webservers 
> when I type www.xxx.unp.edu.ar (xxx being the name of the server).
> My net schema is the following

um--not to be silly, but does www.xxx.unp.edu.ar resolve to an IP
address externally?

>                                      INTERNET
> Mail Relay            Main Web Server             Router
> 
> 
> -------------------------Firewall--------------------------------
> 
> 
> POP Server         Proxy         Webserver1      Webserver2
>                                          LAN
> 
> My question is how can I use iptables rules to be able to access those 
> servers from the outside.

depends on whether you need to use NAT to make the servers accessible
from the Internet (i will assume you do not).  for each webserver IP,
add a rule like:

  iptables -A FORWARD -i $EXT_IF -p tcp --syn -d $WEB_SRV_IP \
    --dport 80 -j ACCEPT

this assumes that somewhere above this rule you have:

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

-j

--
"Me fail English? That's unpossible."
	--The Simpsons


