From: "Jan Kaastrup" <jka@protego.dk>
Subject: RE: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 13:31:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c3c950$a50b6560$2d64a8c0@pcjka>
References: <20031223114701.977.qmail@web60405.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031223114701.977.qmail@web60405.mail.yahoo.com>
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
To: 'ads nat' <adsnat@yahoo.com>, netfilter@lists.netfilter.org

What do you want to do with this rule?

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of ads nat
Sent: 23. december 2003 12:47
To: netfilter@lists.netfilter.org
Subject: IPTABLES syntax problem.


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



