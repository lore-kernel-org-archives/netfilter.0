From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: DNAT
Date: Tue, 26 Oct 2004 06:20:23 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041026102023.GA7941@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I want to access my internal machine from outside. But I am unable to do 
so. I tried,
# iptables -t nat -I PREROUTING -d <my_ext_ip> -p tcp --dport
8081 -j DNAT --to-destination 192.168.0.16:80
# iptables -I INPUT -p tcp --dport 8081 -j ACCEPT
# iptables -I FORWARD -s 192.168.0.16 -j ACCEPT

I know these are very crude but they are simple to start with. Also,
once I get one more public IP from my ISP, I will NAT it to the
internal machine.
Can anyone give pointers on this and above to why it is not working?
If this is right, is it possible that my ISP might be blocking 
traffic from outside to ports other than the few.

With warm regards,
-Payal


