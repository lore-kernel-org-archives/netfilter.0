From: Joe Riley <irie@networks.org>
Subject: Re: iptables and connlimit
Date: Fri, 7 May 2004 13:17:10 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040507201710.15E03395A@sitemail.everyone.net>
Reply-To: irie@networks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

my only suggestion is that when a '!' is used in bash or any shell you must prefix it like this : \!
so it would be
iptables -I INPUT 1 -p tcp --syn --dport 80 -m connlimit \! --connlimit-above 2 -j ACCEPT

or enclosed with quotes " and "

good luck,
joe riley

--- Null Device <nulldevice83@yahoo.com> wrote:
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



_____________________________________________________________
Proud member of United Networks Email, visit or report abuse at  http://networks.org/

