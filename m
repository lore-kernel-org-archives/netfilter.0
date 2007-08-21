From: "Mike" <catchall@stengele.biz>
Subject: Firewall Issues
Date: Tue, 21 Aug 2007 08:05:10 -0400
Message-ID: <F354ED761879468F86DCB19505DD6DB5@mikePC>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi all,
I have an issue with my linux iptables firewall and cannot figure out what 
to do.
I will make this as short and sweet as I can.
My Network is setup as follows:
Static IP: 24.106.xxx.xx
Firewall IP ETH1:(Static points to this) 172.24.xxx.xx
All my servers are ETH0: 192.168.0.xx
I have 2 game servers, 1 mail server and a web server.
My problem is I cannot see my websites, or join game servers unless I put 
this firewall rule in: iptables -A PREROUTING -d 24.xxx.xxx.xx -i eth0 -j 
DNAT --to-destination 192.xxx.x.35 (192.xxx.x.35 being my web server IP 
Address)
With this rule I can from the inside of my network go to my website via 
www.xxx.com but cannot join any of my game servers unless I chnage the above 
rule to the game server IP.

Can anyone help me on this?

Thanks in advance,
Mike 


