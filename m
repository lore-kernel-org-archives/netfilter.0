From: Jason Opperisano <opie@817west.com>
Subject: Re: Dynamic Nat rules
Date: Fri, 21 Jan 2005 10:59:44 -0500
Message-ID: <20050121155944.GA21392@bender.817west.com>
References: <a4384574050119064978cdb9d0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <a4384574050119064978cdb9d0@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Wed, Jan 19, 2005 at 08:49:10AM -0600, Bracey Summers wrote:
> I am new to iptables and need some guidance.  I have done a good bit
> of reading over the past few days and have learned much.  With this
> knowledge I have come up with a solution for my task, but am not
> convinced that it is the most efficient approach.  I was hoping that I
> could get some guidance from someone who is more knowledgeable.
> 
> My Setup:
> Red Hat ES3
> uname -r = 2.4.21-20.0.1.ELsmp
> iptables -V = iptables v1.2.8
> ip -V = ip utility, iproute2-ss010824
> 
> Dual NIC server
>   eth1 - To Router (internet)
>   eth0 - Internal public space IP range
> 
> The Task:
> Block all traffic from the internal interface except port 80/443. 
> Forward 80/443 to my web server which will have a rewrite rule.  The
> user will then be shown a web page for authentication.  Once the user
> is validated they will be granted outbound access for a specified time
> period (on most ports).
> 
> For my test setup I did not have public IP space to play with so I
> created a private network (192.168.0.0).  I then created the following
> rule to get access to the external network.
> 
> MASQUERADE
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to external_network
> 
> This is the part that I am not to sure about.
> 
> NAT - [One entry for each ip address]
> iptables -t nat -A PREROUTING -p tcp -s 192.168.0.2 -i eth0 --d 0/0
> --dport 80,443 -j DNAT --to my_web_server
> iptables -t nat -A PREROUTING -p tcp -s 192.168.0.3 -i eth0 --d 0/0
> --dport 80,443 -j DNAT --to my_web_server
> iptables -t nat -A PREROUTING -p tcp -s 192.168.0.4 -i eth0 --d 0/0
> --dport 80,443 -j DNAT --to my_web_server
> ...
> 
> This rule should forward all internal web/ssl traffic to my web
> server.  I tested a command that was a similar and it worked.
> 
> Now the problem ???
> 
> If I had 500 internal IP addresses I would have to create a NAT for
> each one of them.  Once the user authenticated I would have to remove
> the NAT for that users IP for a specified time period.  Then I would
> have to create a filter to allow outbound access to the ports that I
> wanted to allow for that IP.  After their time has expired I would
> have to add the NAT back and delete the filter rule.  This seems like
> it would work, but it is a lot of management.  I tried to just make
> one NAT to forward any internal IP address on port 80/443 to my web
> server and that worked until the user authenticated.  Once the user
> was authenticated I had no way of getting around the NAT rule for
> 80/443.  If I understand what I have been reading correctly the NAT
> PREROUTING rule is evaluated first.  Therefore there is not way for me
> to allow an ip address in my internal network range to bypass this
> rule.
> 
> Any guidance is appreciated.

create a custom chain to hold the authenticated IP addresses which is
evaluated first in the nat PREROUTING chain, and have the DNAT rule as
the second rule; i.e.,

  iptables -t nat -N authips

  iptables -t nat -A PREROUTING -p tcp -m mport --dports 80,443 \
    -j authips
  iptables -t nat -A PREROUTING -p tcp -m mport --dports 80,443 \
    -j DNAT --to my_web_server

now--add and remove your rules in the authips chain.  i will not argue
that this is efficient, but it works just fine for relatively small
numbers of IPs (<512 IMHO).

--
"Mmmm...free goo."
	--The Simpsons

