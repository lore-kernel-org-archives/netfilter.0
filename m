From: "Raul I. Becette" <raulbecette@unp.edu.ar>
Subject: Re: multiple webservers behind iptables (SOLVED)
Date: Mon, 14 Feb 2005 09:00:00 -0300
Message-ID: <421092C0.3070601@unp.edu.ar>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Raul I. Becette wrote:

> Hello list
>
> This is my first post.
> I am in charge of a LAN connected to internet through a firewall box 
> PIII 500MHz with iptables 1.2.10.
>
> There are different internal webservers that I don't adminnister and 
> are located physically in different parts of the building.
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
>
> My question is how can I use iptables rules to be able to access those 
> servers from the outside.
>
> Any info you need just ask
>
> Thank you for your time
>
Hello list

I solved the problem installing squid on the firewall and configuring it 
as a reverse proxy as described in 
http://squid.visolve.com/squid/reverseproxy.htm

The only line I had to add to my firewall script is in the INPUT chain 
allowing incoming connections on port 80 on the public interface.

Also, every www.xxx.unp.edu.ar on my external DNS server points to my 
firewall public IP.

Thanks everyone for your help

-- 


-----------------------------------------------------------------
Raul I. Becette
E-mail: raulbecette@unp.edu.ar
REPAC, Red Patagonica de  Comunicaciones
Univ. Nac. de la Patagonia San Juan Bosco
Ciudad Universitaria - Km.4.
9000 - Comodoro Rivadavia - Chubut
Tel/Fax : (0297) - 4550073
------------------------------------------------------------------


