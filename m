From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 09:00:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FE84A7D.801@Loudoun-Fairfax.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Holy Moly, all the smart people are here today! I can see ads nat is in 
good hands so I'm going to keep my mouth shut for once. ;-)

ads nat wrote:

>Hi,
>I am trying to setup IPTABLES rules. I am newbe to
>this.
>
>One of the rule in filter table is 
>#######
>-A INPUT -p tcp ! --syn -m state --state NEW -j LOG
>--log-prefix "New not syn:"
>#############
>
>I am getting following error :
>
>
>[root@allweb root]# /etc/init.d/iptables restart
>Flushing all current rules and user defined chains:   
>    [  OK  ]
>Clearing all current rules and user defined chains:   
>    [  OK  ]
>Applying iptables firewall rules: iptables-restore
>v1.2.6a: Unknown arg `--syn'
>Try `iptables-restore -h' or 'iptables-restore --help'
>for more information.
>
>I am using /etc/init.d/iptables restart to apply
>iptables rules.
>
>I think I have used proper syntax "--syn" from Oskar
>Anderson IPTABLES tutorials.
>
>Looking for support.
>Thanks
>
>__________________________________
>Do you Yahoo!?
>Protect your identity with Yahoo! Mail AddressGuard
>http://antispam.yahoo.com/whatsnewfree
>
>
>  
>



