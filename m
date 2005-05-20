From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: SSH Brute force attacks
Date: Fri, 20 May 2005 15:01:48 +0200
Message-ID: <428DDFBC.1080905@eccotours.dyndns.org>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>	<42898402.10507@eccotours.dyndns.org>	<4289E72F.7020901@wp.pl>	<428B3798.9050407@eccotours.dyndns.org>	<428C1C3F.9030600@riverviewtech.net>	<428C56C9.9000607@eccotours.dyndns.org>
	<428CA51D.4080206@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428CA51D.4080206@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Taylor, Grant wrote:
>> I understand what you are saying, but what was hoping for. Was a 
>> solution whereby the src ip is not part of my whitelist.
>>
>> For example, I have a dialup account (dynamic ip) at home. If I need 
>> to SSH into my linux box from home. I cant because the ip I have been 
>> allocted will not be in the whitelist.
> 
> 
> Can I ask why you would not be able to get in from your dynamic IP at 
> home?  The rule set will allow (how ever many NEW attempts you 
> designate) to connect for a specified number of times in a specified 
> amount of time.  You don't have to have your dynamic IP in the list as 
> any IP will still be able to initiate NEW connections a few times before 
> the rule starts TARPITing / DROPing the connection.  There is also the 
> fact that you could configure your SSH server to listen on a (2nd) port 
> at a higher port number that you would know about that most people would 
> not.  This port would not be processed by this script and thus you would 
> be able to connect from anywhere.

Hi all

Below is what I have. I basically copied and pasted the original from 
Grant Taylor

So... I cant see why I cant connect from a dynamically assigned ip.

Kind Regards
Brent Clark

===========================================

#!/bin/sh -
IPT=/sbin/iptables

echo 0 > /proc/sys/net/ipv4/ip_dynaddr
echo 0 > /proc/sys/net/ipv4/ip_forward

$IPT --flush
$IPT --flush INPUT              #Flush the INPUT chain
$IPT --flush OUTPUT             #Flush the OUTPUT chain
$IPT --flush FORWARD            #Flush the FORWARD chain
$IPT -t nat --flush             #Flush the nat table
$IPT -t mangle --flush          #Flush the mangle table
$IPT --delete-chain             #Delete any pre-existing chains
$IPT -t nat --delete-chain      #Delete any pre-existing chains from nat 
table
$IPT -t mangle --delete-chain   #Delete any pre-existing chains from the 
mangle table

$IPT --policy INPUT DROP        #Setting the default policy for INPUT chain
$IPT --policy FORWARD DROP      #Setting the default plicy for FORWARD chain
$IPT --policy OUTPUT DROP       #Setting the default policy for the 
OUTPUT chain

$IPT -t nat --policy PREROUTING ACCEPT
$IPT -t nat --policy OUTPUT ACCEPT
$IPT -t nat --policy POSTROUTING ACCEPT
$IPT -t mangle --policy PREROUTING ACCEPT
$IPT -t mangle --policy POSTROUTING ACCEPT

$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

$IPT -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t filter -A INPUT -m state --state INVALID -j LOG --log-prefix 
"INVALID input: " --log-tcp-options --log-ip-options
$IPT -t filter -A INPUT -m state --state INVALID -j DROP
$IPT -t filter -A INPUT -p tcp  --dport 113 -j REJECT --reject-with 
icmp-host-unreachable
$IPT -t filter -A INPUT -d 217.199.186.255 -j DROP
$IPT -t filter -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
$IPT -t filter -A INPUT -p tcp --dport 20 -m state --state NEW -j ACCEPT
$IPT -t filter -A INPUT -p tcp --dport 21 -m state --state NEW -j ACCEPT
$IPT -t filter -A INPUT -p tcp --dport 25 -m state --state NEW -j ACCEPT
#$IPT -t filter -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT

$IPT -N SSH_Brute_Force
#$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -s ! 196.31.9.82 
-j SSH_Brute_Force
#$IPT -A SSH_Brute_Force -m recent --set --name SSH
#$IPT -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60 
--hitcount 3 -j RETURN
#$IPT -A SSH_Brute_Force -m recent --name SSH --update
#$IPT -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
#$IPT -A SSH_Brute_Force -j DROP

$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -j SSH_Brute_Force
$IPT -A SSH_Brute_Force -s 196.31.9.82 -j RETURN
$IPT -A SSH_Brute_Force -m recent --set --name SSH --rsource
$IPT -A SSH_Brute_Force -m recent ! --update --seconds 60 --hitcount 8 
--name SSH --rsource -j RETURN
$IPT -A SSH_Brute_Force -m recent --update --name SSH --rsource
$IPT -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
$IPT -A SSH_Brute_Force -p tcp -j DROP

$IPT -t filter -A INPUT -p tcp --dport 10000 -m state --state NEW -j ACCEPT
$IPT -t filter -A INPUT -p tcp --dport 135 -j DROP
$IPT -t filter -A INPUT -p tcp  --dport 113 -j REJECT --reject-with 
icmp-host-unreachable
$IPT -t filter -A INPUT -p icmp --icmp-type source-quench -j ACCEPT
$IPT -t filter -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT
$IPT -t filter -A INPUT -p icmp --icmp-type destination-unreachable -j 
ACCEPT
$IPT -t filter -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
$IPT -t filter -A INPUT -p icmp --icmp-type ! echo-request -j LOG
$IPT -t filter -A INPUT -j LOG --log-prefix "[INPUT  DROP]: " 
--log-tcp-options --log-ip-options
$IPT -t filter -A INPUT -j DROP

$IPT -t filter -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t filter -A OUTPUT -m state --state INVALID -j LOG --log-prefix 
"INVALID output: " --log-tcp-options --log-ip-options
$IPT -t filter -A OUTPUT -m state --state INVALID -j DROP
$IPT -t filter -A OUTPUT -m state --state NEW -j ACCEPT
$IPT -t filter -A OUTPUT -j LOG --log-prefix "[OUTPUT DROP]: " 
--log-tcp-options --log-ip-options
$IPT -t filter -A OUTPUT -j DROP

