From: ads nat <adsnat@yahoo.com>
Subject: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 03:47:01 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031223114701.977.qmail@web60405.mail.yahoo.com>
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
I am trying to setup IPTABLES rules. I am newbe to
this.

One of the rule in filter table is 
#######
-A INPUT -p tcp ! --syn -m state --state NEW -j LOG
--log-prefix "New not syn:"
#############

I am getting following error :


[root@allweb root]# /etc/init.d/iptables restart
Flushing all current rules and user defined chains:   
    [  OK  ]
Clearing all current rules and user defined chains:   
    [  OK  ]
Applying iptables firewall rules: iptables-restore
v1.2.6a: Unknown arg `--syn'
Try `iptables-restore -h' or 'iptables-restore --help'
for more information.

I am using /etc/init.d/iptables restart to apply
iptables rules.

I think I have used proper syntax "--syn" from Oskar
Anderson IPTABLES tutorials.

Looking for support.
Thanks

__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

