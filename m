From: Drew Weaver <drew.weaver@thenap.com>
Subject: allowing certain IP addresses.
Date: Sat, 17 May 2003 02:26:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <75634F04BFCFD511BF69009027DC8649484265@mailman.thenap.com>
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

I would like to disclude a /25 from accessing a server except for 1 ip
address on that /25 this is what I have in my rules.

/sbin/iptables -A INPUT -i eth0 -s 10.1.0.0/25 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 10.1.0.52/32 -j ACCEPT

the blocking works, the 10.1.0.0/25 network cannot reach this server,
however the 10.1.0.52/32 cant either.

I have one other question, this skeleton script I downloaded has these: 

/sbin/iptables -A INPUT -i eth0 -s 5.0.0.0/8 -j DUMP   
/sbin/iptables -A INPUT -i eth0 -s 10.0.0.0/8 -j DUMP   
/sbin/iptables -A INPUT -i eth0 -s 23.0.0.0/8 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 27.0.0.0/8 -j DUMP   
/sbin/iptables -A INPUT -i eth0 -s 31.0.0.0/8 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 68.0.0.0/6 -j DUMP  
/sbin/iptables -A INPUT -i eth0 -s 72.0.0.0/5 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 80.0.0.0/4 -j DUMP 
/sbin/iptables -A INPUT -i eth0 -s 96.0.0.0/3 -j DUMP 
/sbin/iptables -A INPUT -i eth0 -s 127.0.0.0/8 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 128.0.0.0/16 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 128.66.0.0/16 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 169.254.0.0/16 -j DUMP  
/sbin/iptables -A INPUT -i eth0 -s 172.16.0.0/12 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 191.255.0.0/16 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 192.0.0.0/16 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 192.168.0.0/16 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 197.0.0.0/8 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 201.0.0.0/8 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 204.152.64.0/23 -j DUMP
/sbin/iptables -A INPUT -i eth0 -s 224.0.0.0/3 -j DUMP 
/sbin/iptables -A INPUT -i eth0 -s 240.0.0.0/8 -j DUMP  

listed as unroutable, or private ip addresses but I know some of these are
actually being used on the net, NOW months after the skeleton was written,
anyone know or know how to find out which ones I should remove?

Thanks for any advice.
-Drew


