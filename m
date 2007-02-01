From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: SSHBrute Force: False Postives
Date: Thu, 1 Feb 2007 07:06:48 -0500
Message-ID: <20070201120648.GA19604@animx.eu.org>
References: <02a601c745a8$9f7e1110$2904b00a@au.schpac.local>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <02a601c745a8$9f7e1110$2904b00a@au.schpac.local>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominic Caputo <jec6jec6@gmail.com>
Cc: netfilter@lists.netfilter.org

Dominic Caputo wrote:
> I have been reading up on iptables and i am by no means an expert but i 
> have a problem with SSH brute force attacks on port 22. I am currently 
> using the config below to minimise these threats but i am constantly 
> getting false positives (logs actually say that my connection has been 
> flagged as a brute force connection even on the on the first attempt-but 
> then on others it connects first time with no problems)
> 
> #SSH Brute-Force Scan Check
> $IPTABLES -N SSH_Brute_Force
> $IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name 
> SSH --set --rsource -j SSH_Brute_Force
> $IPTABLES -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 
> 4 --name SSH --rsource -j ACCEPT
> $IPTABLES -A SSH_Brute_Force -j LOG --log-level info --log-prefix "SSH 
> Brute Force Attempt:  "
> $IPTABLES -A SSH_Brute_Force -p tcp -j DROP
> 
> Any help with this problem would be great

I do it a little differently:
I have a chain called "internet" which is basically jumped to from INPUT and
FORWARD if the card it came in on is the one facing the internet.  Prepend
iptables to the following lines (I still use iptables-restore)

-A internet -j ACCEPT -m conntrack --ctstate ESTABLISHED
... <other rules>
-A internet -j REJECT -m recent --update --seconds 600 --reject-with icmp-admin-prohibited
... <other rules>
-A internet -j ACCEPT -p tcp -m limit --limit 5/min --dport 22
-A internet -j LOG -p tcp --dport 22 --log-prefix "SSH FLOOD:"
-A internet -j REJECT -p tcp -m recent --set --dport 22 --reject-with icmp-admin-prohibited

This allows 5 new connections to port 22 in a minute.  After which, that
rule no longer matches and goes to the next rule.  Then the packet is logged
once and then the recent module is updated with the perpetrator's IP and the
2nd rule above catche it.  They have to be quiet for 10 minutes before they
are allowed to attempt again.

This works very well for me since I don't have many people sshing into me
that often.  I went from ~1000 lines in my logs to about 30.

I also add IPs when someone connects to various other ports that are common
attacks so I would probably never see an SSH attack from them.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

