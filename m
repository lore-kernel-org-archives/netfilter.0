From: Andre Correa <andre.correa@pobox.com>
Subject: Re: firewall rules for subinterfaces
Date: Fri, 15 Oct 2004 12:25:46 -0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <416FDDEA.20209@pobox.com>
References: <20041015035535.GA19170@clifford.headnut.org>
	<416FCE80.9090801@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <416FCE80.9090801@pbl.ca>
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


Hi, there is really no meaning on setting rules for subinterfaces, If 
you need to segment your network and can't plug new NICs look for VLANs. 
You can apply rules indicating VLAN interfaces (-i and -o) like this: 
eth0.100, eth0.200, etc...

Somebody correct me if I'm wrong but this was made possible under >= 2.6 
kernel versions, on 2.4.x you can't do it too.

Hope it helps.

Andre



Aleksandar Milivojevic wrote:
> Chris Verges wrote:
> 
>> Hey,
>>
>> Is there a way to add firewall rules for subinterfaces?  I'm
>> trying to do the equivalent of:
>>
>>   eth0   Intel Pro 10/100
>>     eth0:0   192.168.1.1
>>     eth0:1   192.168.2.1
>>
>>   iptables -A INPUT -p icmp -i eth0:0 -j DENY
>>   iptables -A INPUT -p icmp -i eth0:1 -j ACCEPT
> 
> 
> Nope you can't do that.  There's no point in doing it.  Just as you 
> added virtual interfaces to your firewall box, so can any node on your 
> network, effectively bypassing such firewall rules.  If you have a need 
> for such rules, than you really have a need for two separate physical 
> networks (otherwise, you are implementing security by obscurity, which 
> doesn't really work).
> 
> If all you wanted to do is to force clients to use specific IP address 
> on your firewall box, then do it by specifying destination IP address 
> ("-i eth0 -d 192.168.1.1 -j DROP" and "-i eth0 -d 192.168.2.1 -j 
> ACCEPT").  BTW, dropping all ICMP traffic might not be a good idea.
> 


