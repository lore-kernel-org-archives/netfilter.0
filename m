From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Re: Newbie: need help with table rules
Date: Fri, 14 Feb 2003 16:16:32 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E4C97D0.7040201@mega-bucks.co.jp>
References: <B848917C9D07D71199C5005004D778B8017B4F@TELECOMS04>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eugene Joubert <eugenej@centratel.co.za>
Cc: netfilter@lists.netfilter.org

Eugene Joubert wrote:
> 
> First of all you're connection SSH doesn't work  because you have got 
> your OUTPUT policy as DROP. Now surely if you want the linux box to 
> return your request you need to allow it to do so:-)

Doh! So true. Ok, now I have fixed that but I still cannot get to SSH. 
The new rules are:

$IPT --policy INPUT   DROP
$IPT --policy OUTPUT  ACCEPT
$IPT --policy FORWARD DROP

# Loopback accepts everything

$IPT -A INPUT  -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

# Aceept ICMP
$IPT -A INPUT -p icmp -j ACCEPT

# Allow previously established connections

$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# HTTP, HTTPS, SSH

$IPT -A INPUT -p TCP -s 0/0 -i eth0 -d $IP --dport 80  -j ACCEPT
$IPT -A INPUT -p TCP -s 0/0 -i eth0 -d $IP --dport 443 -j ACCEPT
$IPT -A INPUT -p TCP -s 0/0 -i eth0 -d $IP --dport 22  -j ACCEPT

# DNS
$IPT -A INPUT -p tcp --dport 53 -j ACCEPT
$IPT -A INPUT -p udp --dport 53 -j ACCEPT


