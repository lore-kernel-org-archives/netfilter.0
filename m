From: Raphael Jacquot <raphael.jacquot@imag.fr>
Subject: Re: multiple webservers behind iptables
Date: Thu, 10 Feb 2005 15:15:26 +0100
Message-ID: <420B6C7E.3090407@imag.fr>
References: <420A5564.7020000@unp.edu.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Raul I. Becette" <raulbecette@unp.edu.ar>
Cc: netfilter@lists.netfilter.org

Raul I. Becette wrote:
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
> 
> 
>                                     INTERNET
> Mail Relay            Main Web Server             Router
> 
> 
> -------------------------Firewall--------------------------------
> 
> 
> POP Server         Proxy         Webserver1      Webserver2
>                                         LAN

depending on if your multiple web servers have a public IP or not, you 
may have to set up a proxy to redirect the requests to the right box

> My question is how can I use iptables rules to be able to access those 
> servers from the outside.
> 
> Any info you need just ask
> 
> Thank you for your time
> 


