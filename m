From: Natasha Smith <natasha3641@yahoo.com>
Subject: iptables: execvp: Permissions Denied
Date: Sat, 21 Sep 2002 00:18:27 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020921071827.3856.qmail@web20305.mail.yahoo.com>
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

Ok...i have my own iptables script trying to get it
going...here what i have soo far in it...just starting
 
SPECS: 
RedHat 7.2 
2.4.19 Kernel 
iptables-1.2.3 

####################################### 
#!/bin/bash 

echo 1 = > /proc/sys/net/ipv4//ip_forward 
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 

# Remove any existing rules from all chains. 
iptables --flush 
iptables -t nat --flush 

# Unlimited access on the loopback interface 
iptables -A INPUT -i lo -j ACCEPT 
iptables -A OUPUT -o lo -j ACCPET 

# Set the fefault policy to Drop 
iptables --policy INPUT DROP 
####################################### 
Now... to get this to run on start-up here is what i
did but it didnt start up it gave me an error. 
chown root.root /etc/init.d/firewall 
chmod u=rwx /etc/init.d /firewall 

And when i restart: THE ERROR IS-
"iptables: execvp: Permission Denied 
rc. Starting iptables: Failed"  
I also have this line sh /etc/init.d/firewall at the
end of my "rc.local" file 
How can i fix this??? Or get them to start up
propeply!!! 

 OOPPPPPPSS guys  i forgot to mention the original
iptables script that came installed already on my
system in the "/etc/init.d/" i moved that to somewhere
else.... was i suppose to do that or just leave them
there???




=====

Image by MackDaddy

__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com

