From: Silkk <crystaldrinker@yahoo.com>
Subject: iptables does not support chkconfig!
Date: Sun, 22 Dec 2002 20:39:39 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021223043939.54762.qmail@web40612.mail.yahoo.com>
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

Hello,

I installed iptables 1.2.7a with kernel 2.4.20. I tryed to get them to start when i boot
my pc but they are not starting. I created a firewall script named "firewall" in:
"/etc/init.d" 
---I ran:
chown root.root /etc/init.d/firewall
chmod u=rwx /etc/init.d/firewall
chmod 775 /etc/init.d/firewall
---And added this line to my "/etc/rc.d/rc.local" file
sh /etc/init.d/firewall

But that still dont get them started up. If i run 
sh /etc/init.d/firewall manually then my rules properly.

I tryed using 
"chkconfig levels 23456 iptables on" but get this 
service iptables does not support chkconfig

And i get an error when i re-boot my computer on start up after redhat network dameon
starts something about iptables i check my logs but cant see it in there! 
Any help how i can get my rules to start when my PC starts up???

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

