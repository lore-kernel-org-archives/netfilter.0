From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: wiered problem
Date: Thu, 20 May 2004 21:57:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405202157.10726.Antony@Soft-Solutions.co.uk>
References: <BAY15-F12RLNTaFagA30009460e@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F12RLNTaFagA30009460e@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 20 May 2004 9:45 pm, azeem ahmad wrote:

> i m running iptables, squid proxy, bind, and samba on same machine. it
> works as a server for my LAN

Ugh!   So much for the security rule that you shouldn't run applications 
(which potentially have vulnerabilities) on a firewall :)

> the script that i ran is as follow but when i stat these rules the browsing
> stops. the squid proxy is listening on port 8080. what can be the problem.
> while netbios sharing is doing okey.
>
> iptables -P INPUT ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 8080 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT

I cannot see the purpose of any of the above rules, once you have stated the 
first one.

The default policy is ACCEPT.   That means all packets are going to be 
ACCEPTed.   There is no point in ACCEPTing specific packets after that, 
unless you also have some DROP or REJECT rules which you haven't shown us.

Regards,

Antony

PS: What is UDP port 8080 for?

-- 
Your work is both good and original.  Unfortunately the parts that are good 
aren't original, and the parts that are original aren't good.

 - Samuel Johnson

                                                     Please reply to the list;
                                                           please don't CC me.


