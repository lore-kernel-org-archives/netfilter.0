From: ads nat <adsnat@yahoo.com>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 05:37:03 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031223133703.24761.qmail@web60409.mail.yahoo.com>
References: <1072185580.3572.350.camel@grendel>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072185580.3572.350.camel@grendel>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

I modified rules as follows :

###########
-A INPUT -p tcp ! --tcp-flags SYN SYN -m state --state
NEW -j LOG --log-prefix " New not syn: "

-A INPUT -p tcp ! --tcp-flags SYN SYN -m state --state
NEW -j DROP

-A INPUT -p all -s 192.168.0.0/24 -i eth0 -j REJECT
-A INPUT -p all -s 192.168.1.0/24 -i eth0 -j REJECT

-A INPUT -p all -s localhost -i eth0 -j REJECT


#
# allowed chain
#


-A INPUT -p tcp -m state --state ESTABLISHED,RELATED
-j ACCEPT


##########

Get following error :
[root@allweb root]# /etc/init.d/iptables restart
Flushing all current rules and user defined chains:   
    [  OK  ]
Clearing all current rules and user defined chains:   
    [  OK  ]
Applying iptables firewall rules: iptables-restore
v1.2.6a: Unknown arg `--tcp-flags'
Try `iptables-restore -h' or 'iptables-restore --help'
for more information.
                                                      
    [FAILED]


--- Chris Brenton <cbrenton@chrisbrenton.org> wrote:
> On Tue, 2003-12-23 at 06:47, ads nat wrote:
> > Hi,
> > I am trying to setup IPTABLES rules. I am newbe to
> > this.
> > 
> > One of the rule in filter table is 
> > #######
> > -A INPUT -p tcp ! --syn -m state --state NEW -j
> LOG
> > --log-prefix "New not syn:"
> 
> Try:
> iptables -A INPUT -p tcp ! --tcp-flags SYN SYN -m
> state --state NEW -j
> LOG --log-prefix " New not syn: "
> 
> Note the change in specifying flags from ipchains to
> iptables. Also note
> I added spaces around your prefix. This will make it
> easier to read in
> the logs.
> 
> HTH,
> C
> 
> 


__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

