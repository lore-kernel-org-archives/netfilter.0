From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Transparent Remote Proxy Server
Date: Fri, 24 Sep 2004 14:01:55 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41546F23.2010601@pbl.ca>
References: <666183F7-0DA7-11D9-99BA-000A95C71776@freezone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <666183F7-0DA7-11D9-99BA-000A95C71776@freezone.co.uk>
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

ms419@freezone.co.uk wrote:
> I'm setting up a transparent proxy to a remote proxy server & can't 
> figure out why it doesn't work.
> 
> My gateway is tor; it's running Debian unstable, iptables 1.2.11-2, & a 
> custom 2.4.27 kernel. My proxy server is wum; it's also running Debian 
> unstable, squid 2.5.6-8, iptables 1.2.11-2, & a custom 2.6.7 kernel.
> 
> Physically, tor is connected by each of 3 NICs to an ADSL modem, to wum 
> by a crossover cable, & to the rest of the network by a hub.
> 
> Logically, tor & wum are in 192.168.103.0/24; tor & the rest of the 
> network are in 192.168.179.0/24.

Haven't done something like that myself, but wouldn't it be much simpler 
to implement it like this (using filter table for filtering, and nat 
table for NATing, as they were intended to be used):

replace:
   int_if with tor's internal interface
   ext_if with tor's external interface
   wum_if with tor's interface to wum
   tor_if with wum's interface to tor

On tor:
iptables -t nat -A PREROUTING -i int_if -s 192.168.179.0/24 \
    -p tcp --dport 80 -j DNAT --to-destination wum:3128
iptables -t nat -A POSTROUTING -o ext_if -s 192.168.0.0/16 -j MASQUERADE
iptables -A FORWARD -i int_if -o wum_if -s 192.168.179.0/24 -d wum \
    -p tcp --dport 3128 -m state --state NEW -j ACCEPT

On wum:
iptables -A INPUT -i tor_if -s 192.168.179.0/24 -d wum \
    -p tcp --dport 3128 -m state --state NEW -j ACCEPT

Assuming chains in filter table have default policy set to DROP, and 
chains in nat&mangle tables to ACCEPT.

These are just hints, you are advised not to cut&paste them into your 
configuration (tm).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

