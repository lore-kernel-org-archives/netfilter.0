From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables configuration help
Date: Fri, 5 Nov 2004 10:42:09 -0500
Message-ID: <20041105154209.GA1245@bender.817west.com>
References: <1099669284.891.131.camel@dhanush.intranet.calsoft.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1099669284.891.131.camel@dhanush.intranet.calsoft.com>
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

On Fri, Nov 05, 2004 at 09:11:24PM +0530, Vijay Kumar wrote:
> Hello,
> 
> I have a firewall with three nic ( external ip, DMZ ip, LAN ip ) 
> I have added a subinterface on the external interface ( public ip with a public ip address ) 
> 
> There is 1 machine on the internal LAN and I want it to go out using the IP of the sub interface,
> i.e access the internet using the exteral sub interface IP which I have added. 
> 
> I have done the following : 
> 
> iptables -t nat -I POSTROUTING -s 172.16.0.119 -o eth1:0 -j SNAT --to-source <external_ip> 

i really wish this question would come up more often...

add your secondary IP address to eth1 like so:

  ip addr add <external_ip> dev eth1

and write your NAT rule like so:

  iptables -t nat -I POSTROUTING -s 172.16.0.119 -o eth1 \
    -j SNAT --to-source <external_ip>

> After adding this I also added the below mentioned rules : 
> 
> iptables -A INPUT -s 172.16.0.119 -d 0.0.0.0/0.0.0.0 -j ACCEPT 

INPUT is only for packets who's destination IP is local to the firewall
itself--so this will allow you to access the firewall machine from
172.16.0.119.

> iptables -I FORWARD -s 172.16.0.119 -j ACCEPT 

ok.  make sure you've also enabled IP forwarding:

  sysctl -w net.ipv4.ip_forward=1

and make sure you're allowing reply packets back through your FORWARD
chain:

  iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

<snip>

if only there were a way to search the archives of this mailing list to
see how people have solved this riddle of the sphinx in the past...oh
wait...

  http://marc.theaimsgroup.com/?l=netfilter&r=1&w=2

-j

--
"Lisa, if the Bible has taught us nothing else, and it hasn't, it's
 that girls should stick to girls sports, such as hot oil wrestling
 and foxy boxing and such and such."
        --The Simpsons

