From: Simone Sestini <simone.sestini@eutelia.it>
Subject: NAT Box
Date: Wed, 16 Jun 2004 15:07:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D045F8.9070101@eutelia.it>
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
To: netfilter@lists.netfilter.org

Hi all..

I'm developing a nat box for some special Internet Value Added Services.
I have a lot of NAS boxes that receives calls and then the default 
router for all is the nat box.
The box has 2 ethernet interfaces, one public for internet acces and one 
over my intranet lan.
I have just done a lot of special configuration but right now i'm in 
front of a problem..
Normaly a /23 subnet is always natted with a public ip address.
Now.. i need to resolve a problem..

A special /23 need to browse only on some specific destination.. but if 
one client with the ip into the /23 try to
browse out of the range of the ip permitted i need to redirect the 
request automatically to 1 or more specific
ip address.


This is the example that is working correct without the automatically 
redirection.
The 10.30.14.0 /23 can browse some public ip addresses but if it try to 
go out of the range the REJECT rules
block the packet and the final client will not browse..

/usr/local/sbin/iptables -t nat -A POSTROUTING -s 10.30.14.0/23 -o eth0 
-j SNAT --to PUBLIC_IP_FOR_NAT

/usr/local/sbin/iptables -N PERSONAL_RULES
/usr/local/sbin/iptables -A PERSONAL_RULES -j ACCEPT -s 10.30.14.0/23 -d 
First_Public_IP
/usr/local/sbin/iptables -A PERSONAL_RULES -j ACCEPT -s 10.30.14.0/23 -d 
Second_Public_IP
/usr/local/sbin/iptables -A PERSONAL_RULES -j ACCEPT -s 10.30.14.0/23 -d 
Third_Public_IP
/usr/local/sbin/iptables -A PERSONAL_RULES -j ACCEPT -s 10.30.14.0/23 -d 
Other_Public_IP
/usr/local/sbin/iptables -A PERSONAL_RULES -j ACCEPT -s 10.30.14.0/23 -d 
Other_Public_IP
/usr/local/sbin/iptables -A PERSONAL_RULES -j REJECT -s 10.30.14.0/23 -d 0/0

/usr/local/sbin/iptables -A FORWARD -s 10.30.14.0/23 -p tcp --dport 80 
-j PERSONAL_RULES

Now i have to do something that permit me to add a new feature..
I have to remove the REJECT rules and have to find the way to redirect 
the request to a specific ip.. maybe with a DNAT ??

Any idea ? all is appreciated..

Best Regards.

