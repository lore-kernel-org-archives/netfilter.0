From: ads nat <adsnat@yahoo.com>
Subject: RE: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 04:58:27 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031223125827.25400.qmail@web60402.mail.yahoo.com>
References: <001701c3c950$a50b6560$2d64a8c0@pcjka>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001701c3c950$a50b6560$2d64a8c0@pcjka>
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
To: Jan Kaastrup <jka@protego.dk>, netfilter@lists.netfilter.org

I have setup initial rules as follows:

*filter
-F INPUT
-F OUTPUT
-F FORWARD

-A INPUT -p tcp ! --syn -m state --state NEW -j LOG
--log-prefix "New not syn:"
-A INPUT -p tcp --tcp-flags SYN,ACK SYN,ACK -m state
--state NEW -j REJECT
-A INPUT -p tcp ! --syn -m state --state NEW -j DROP
-A INPUT -p all -s 192.168.0.0/24 -i eth0 -j REJECT
-A INPUT -p all -s 192.168.1.0/24 -i eth0 -j REJECT
-A INPUT -p all -s localhost -i eth0 -j REJECT
-A INPUT -p tcp --syn -j ACCEPT
-A INPUT -p tcp -m state --state ESTABLISHED,RELATED
-j ACCEPT

Rule No. 1) I want to send ! --syn and NEW packet to
log file.
Rule No. 2) New packets from outside should be
rejected.
Rule No.3) To avoid spoofing, packets from 192.168.0.1
and 192.168.1.0 going to eth0 (Internet eth0)
Rule No.4) To avoid packets from localhost going to
eth0 (Internet eth0)
RULE 5) TO accept syn packets initiated form LAN user
and having Estabilshed connection.

Please guide about rules.
Thanks

 
Here I want to reject New packets

--- Jan Kaastrup <jka@protego.dk> wrote:
> What do you want to do with this rule?
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On
> Behalf Of ads nat
> Sent: 23. december 2003 12:47
> To: netfilter@lists.netfilter.org
> Subject: IPTABLES syntax problem.
> 
> 
> Hi,
> I am trying to setup IPTABLES rules. I am newbe to
> this.
> 
> One of the rule in filter table is 
> #######
> -A INPUT -p tcp ! --syn -m state --state NEW -j LOG
> --log-prefix "New not syn:"
> #############
> 
> I am getting following error :
> 
> 
> [root@allweb root]# /etc/init.d/iptables restart
> Flushing all current rules and user defined chains: 
>  
>     [  OK  ]
> Clearing all current rules and user defined chains: 
>  
>     [  OK  ]
> Applying iptables firewall rules: iptables-restore
> v1.2.6a: Unknown arg `--syn'
> Try `iptables-restore -h' or 'iptables-restore
> --help'
> for more information.
> 
> I am using /etc/init.d/iptables restart to apply
> iptables rules.
> 
> I think I have used proper syntax "--syn" from Oskar
> Anderson IPTABLES tutorials.
> 
> Looking for support.
> Thanks
> 
> __________________________________
> Do you Yahoo!?
> Protect your identity with Yahoo! Mail AddressGuard
> http://antispam.yahoo.com/whatsnewfree
> 
> 


__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

