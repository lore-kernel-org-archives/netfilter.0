From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: HELP! Transparent Proxy using bridging 2.6.9 and REDIRECT on
 different subnet
Date: Wed, 23 Mar 2005 17:50:40 -0600
Message-ID: <424200D0.4090700@riverviewtech.net>
References: <2F413D5F33545D4A8465BBEE900238CC3FA777@cymmail.cymphonix.com>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <2F413D5F33545D4A8465BBEE900238CC3FA777@cymmail.cymphonix.com>
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
To: Trevor Paskett <tpaskett@cymphonix.com>
Cc: coreteam@netfilter.org, netfilter@lists.netfilter.org

Well as fate would have it, I did apparently have a need for something like this over the horizon.  What am I talking about?  My boss came to me today and asked me to set up something very similar to what you are doing and I ran in to the same problem that you are.  Well sort of that is.  As I had been thinking about a solution for your problem I tried what I was going to email you about this evening and it seems to be working for me so give it a shot and see what it does for you.  Below is a description of my scenario.

We have had an employ going to web sites that we have deemed inappropriate and thus want banned.  The obvious solution is to put an ACL in our Squid proxy.  The problem is that I wanted to deny (transparent proxy) any one who tried to bypass the proxy.  The typical transparent proxying options that are out there assume that you will just REDIRECT to Squid on the same box.  This is great save for the fact that Squid is not running on our firewall as it is running on an internal system thus REDIRECT will NOT work.  So I had to come up with a slightly different solution and it *may* work for you as well.

Here is my network layout:

Clients on internal LAN <-> Router <-> INet
  Squid on internal LAN

My internal network is a 172.30.0.0/24 (eth1) network and all client and server (Squid) systems are on it.  I access the internet on eth0.

Below are the pertinent iptables lines for this problem:

LAN="eth1"
INet="eth0"
SyslogPrefix="Proxy_Bypas_Attempt"
Subnet="172.30.0.0/24"
RouterIP="172.30.0.249"
SquidProxyIP="172.30.0.246"
SquidProxyPort="3128"
iptables -t nat -A PREROUTING -i ${LAN} -s ! ${SquidProxyIP} -p tcp --dport 80 -j LOG --log-prefix ${SyslogPrefix}
iptables -t nat -A PREROUTING -i ${LAN} -s ! ${SquidProxyIP} -p tcp --dport 80 -j DNAT --to-destination ${SquidProxyIP}:${SquidProxyPort}
iptables -t nat -A POSTROUTING -o ${LAN} -s ${Subnet} -d ${SquidProxyIP} -p tcp --dport ${SquidProxyPort} -j SNAT --to-source ${RouterIP}:${SquidProxyPort}

What this does is to take any traffic that would pass through the router that is destined to TCP port 80 and DNATs it to the Squid Proxy on the port that it is listening on.  As the traffic is going out of the router on it's way to the proxy it gets SNATed to appear as if it is from the router it's self so the traffic will come back to the router where it will be unSNATed and then unDNATed back to the client systems that made the request in the first place.  The problem that was seen before hand of just DNATing the traffic to the Squid Proxy box where Squid would see traffic coming from the client systems and just reply is avoided by SNATing the traffic to appear as if it is coming from the router.  The LOG target line is just so you have the internal IP and MAC address of the system that is attempting to bypass the proxy thus giving you information to go on a (wo)man hunt.

Give this a try and see if you can make it any further with it.  I don't know if it will be directly applicable in your situation or not.  I'll still do some more chewing on your scenario and see if I think this will work for you or not.  I just know that I was handed a problem that was very similar to yours this afternoon and only because I've been thinking about your scenario did I have a solution to test as quickly as I did.  So in a way I suppose that I should say thank you, so "Thank you!", as you gave me a reason to preemptively solve my problem too.  :)  I'll let you know what I come up with regarding bridging and firewalling traffic.



Grant. . . .

Trevor Paskett wrote:
> Thanks for your reply. Our product is a Linux based product that uses
> netfilter. We have Squid and a filtering engine on our box. We are
> strong supporters of netfilter. Our customers have many subnets behind
> our box because of where it is placed in their network. Bringing up
> alias's on br0 for each of their subnets that are not even on that
> broadcast domain is a big band aid :). I think this is somehow a bug in
> ip_nat_core.c and will investigate that further and have cc'd
> coreteam@netfilter.org and hopefully that will get to Rusty who wrote
> it.
> 
> As for the SNAT I think Jason Opperisano's response is correct.
> Everything works great, except somewhere in ip_nat_core.c the src port
> is getting changed to 1 from 80. I have attached an ethereal dump to
> show this happening and a dump when it does what it is supposed to.
> Everything between the 2 is the same, except after I captured the
> no_work.cap, I did
> 
> ifconfig br0:0 192.168.255.165
> 
> So it had an IP on the test machine's subnet. Of course it worked fine
> and that capture is work.cap
> 
> Thanks for all your help.
> 
> Trevor Paskett
> Cymphonix Programmer - CCNA, CWNA
> P: 801-938-1500 F: 801-938-1501


