From: "Navneet" <navneetkc@gmail.com>
Subject: Ethernet port redirection
Date: Wed, 5 Jan 2005 20:52:06 +0530
Message-ID: <000d01c4f33a$5ac1f590$eaab9385@gagan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi,

Now, pease check this out :-
I was trying to run squid in transparent mode(Transparent Proxying) ?

System details:
RedHat Linux 9
eth0 133.147.171.169/8 [Internal NIC]
eth1 172.21.133/14        [External NIC]

All http request get REDIRECTED to squid  at eth0(Internal).It should work
as Gateway by means of eth1(External).

i've done this:
1.Enabled IP forwarding
#echo "1" >/proc/sys/net/ipv4/ip_forward
2.iptables (Netfilter) PORT REDIRECTION:
#iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 3128

Port not getting REDIRECTED as per above iptables rule?.
Why it so?

Thanks

Regards,
Navneet

"Learning Linux"

Reference:
http://www.ibiblio.org/pub/Linux/docs/HOWTO/TransparentProxy
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
http://www.iptablesrocks.org/



