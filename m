From: Salman Ahmed <syd_salman@yahoo.com>
Subject: Some confuisions about following script
Date: Fri, 23 May 2003 15:19:48 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030523221948.60971.qmail@web11508.mail.yahoo.com>
Reply-To: syd_salman@yahoo.com
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

I have downloaded one script from internet which some
parts are making confusion which are:

####################################################
#----Create logging chains-----#

##These are the logging-chains. They all have a
certain limit of log-entries/sec to prevent
log-flooding
##The syslog-entries will be fireparse-compatible (see
http://www.fireparse.com)

#Invalid packets (not ESTABLISHED,RELATED or NEW)
	$IPTABLES -N LINVALID
	$IPTABLES -A LINVALID -m limit --limit $LOGLIMIT
--limit-burst $LOGLIMITBURST -j LOG --log-prefix
"fp=INVALID:1 a=DROP " $IPTABLES -A LINVALID -j DROP

#####################################################


I am having following confusions.

What is LOGLIMIT 
What is LOGLIMITBURST and
What is --log-prefix "fp=INVALID:1 a=DROP "

How can we only block mns messenger and yahoo
messenger?

How can we block all communications except www. 


Please help me out.

Best Regards
Salman

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

