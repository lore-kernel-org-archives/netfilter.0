From: joel solanki <jnsolanki@d2visp.com>
Subject: ff:ff:ff:ff:ff:ff mac problem
Date: Thu, 24 Jun 2004 13:15:13 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088063112.3839.8.camel@joel.d2visp.com>
Reply-To: jnsolanki@d2visp.com
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hi all,

I am having problem in my linux server.
I am using redhat 9.0 with default iptables rpm.
I have Nat of this server. 
ff:ff:ff:ff:ff:ff This mac address is creating problem in my network.
Coz i cant find the ip address  of this mac address device.
I tried to block mac address with iptables in INPUT and FORWARD chain
but still it is connected to my linux server.

when doing # iptraf
Here is the result of iptraf

Ethernet HW addr: ffffffffffff on eth4
1906                  22             116205               86.6         
	                                                                                                here 22 is the download speed ..he is using bandwidth even though i havent allowed him.
when doing # ip neigh ...i cant found this mac address.

Can any one tell me for stop this mac address or solve the problem.

Regards

-- 
Joel n.solanki
Systems Administrator
(M) 91-9825500258
D2V ISP PVT LTD
http://www.d2visp.com



