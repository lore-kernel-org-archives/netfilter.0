From: "Joel Linuxdude" <linuxlists@hotmail.com>
Subject: DCC receive works fine but not SEND
Date: Mon, 25 Nov 2002 18:51:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F433eruQsLbtbS8oLhW00000e17@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I can not send files over IRC using DCC but I can receive
them just fine. I played with the firewall script and didnt
have any luck. Maybe its the ISP, but what can I do to ensure
that it will work?

eth0 = cable modem
eth1 = LAN

I make sure to do this;
$IPT -t nat -A POSTROUTING -o eth0 -j SNAT --to-source x.x.x.x

For ports that seem to not get forwarded right I do this;
$IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 6699 -j DNAT --to 
192.168.0.9-192.168.0.20  (WinMX stuff)

I can not find any specs to tell me what IRC DCC is all about!
Is it TCP or UDP? What port?

Thanks!!

Joel




_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail


