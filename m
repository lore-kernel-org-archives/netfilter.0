From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Iptables
Date: Tue, 28 Sep 2004 09:09:13 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41597089.9050900@pbl.ca>
References: <MAIL5urjNnTNG33J7pq00000024@mail.netscan.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <MAIL5urjNnTNG33J7pq00000024@mail.netscan.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Contact wrote:
> This helps a bit, but still way out of my league - there is a lot of stuff
> to remember. In the many sites, including the one you list below, they talk
> of various configurations before ever getting to the rules - is this
> necessary?
> 
> i.e.
> 
> INET_IP="194.236.50.155"
> INET_IFACE="eth0"
> INET_BROADCAST="194.236.50.255"

Those are variables in shell script.  Basically they are there to make 
your life easier when you need to modify something.  These two will do 
the same:

iptables -A INPUT -i eth0 .....

INET_IFACE="eth0"
iptables -A INPUT -i "$INET_IFACE" .....

> Then a bunch of modules are loaded....

Most of them you don't need to load by hand (they'll get loaded 
automatically).  There are few exceptions, such as ip_nat_ftp module 
that needs to be loaded explicitly (if you need it, that is).

> Are <if_lan>, <net_lan> and <if_inet> reserved commands or do I need to put
> something in here. I am assuming these are variables and tie in with the
> above - not sure though.

Those are the places in Rob's examples where you need to fill in your 
data.  For example you would chage <if_inet> to eth0 or "$INET_IFACE".

> One last thing. Is there a way to block an entire domain i.e. domain.com or
> an entire IP block i.e 24.168.1.0/24.

You can block only by IP address (host or network).  You can't block by 
domain name (which would be an useless feature even if it was possible, 
lurking people into false sense of security).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

