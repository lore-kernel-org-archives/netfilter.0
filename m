From: "Anuradha Kalyan" <anuradk@erivasystems.com>
Subject: Oulook express not working on client machine
Date: Thu, 29 Jul 2004 00:36:48 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407290036.AA99483926@erivasystems.com>
Reply-To: <anuradk@erivasystems.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, 

Sorry for asking a well known question. My squid configuration seems to be fine too. but the outlook express at client machine is not working. 

My configuration: 

eth0: 192.168.1.97 (My Public IP) 
eth1: 192.168.5.1 (My Lan IP) 

I have declared 25 and 110 as the safe ports also but still :(( 

Based on therad i saw at linux solve, I tried to do 

/sbin/iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/24 -j MASQUERADE 

But this also having no effect. 

After lot of trials i even tried to disable iptables(https://phone.cs.columbia.edu/cinema/help/Online_documentation/Install/Troubleshoot4.html) and checked for the outlook but still it is not working.

plz guide me to make my pop3 and smtp connections as transparent. 

regards, 
Anuradha 
 
             

