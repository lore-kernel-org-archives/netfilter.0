From: Null Device <nulldevice83@yahoo.com>
Subject: iptables and connlimit
Date: Fri, 7 May 2004 09:09:49 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040507160949.71532.qmail@web41906.mail.yahoo.com>
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

helloo list,

i was just working with iptables and connlimit and
facing a little bit of problem i hope u peep can help
me out very well.

pls have a look on the command that i executed after
fresh installation of iptables from rpm.

[root@MDK10 firewall]# iptables -I INPUT 1 -p tcp
--syn --dport 80 -m connlimit ! --connlimit-above 2 -j
ACCEPT
iptables: No chain/target/match by that name.

but have a look at this toooo

[root@MDK10 firewall]# iptables -I INPUT 1 -p tcp
--syn --dport 80 -m connlimit -j ACCEPT
iptables v1.2.9: You must specify `--connlimit-above'

so connlimit is there and modules gets loaded ( i
suppose, coz it shows me the error for incomplete
parameters in the second command).

any ideas where i am slipping?

thx a lot in advance.


	
		
__________________________________
Do you Yahoo!?
Win a $20,000 Career Makeover at Yahoo! HotJobs  
http://hotjobs.sweepstakes.yahoo.com/careermakeover 

