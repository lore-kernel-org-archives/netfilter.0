From: "Owen C. Creger" <owencreger@rocketmail.com>
Subject: POP3 Attachments
Date: Wed, 8 Sep 2004 17:00:19 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040909000019.5047.qmail@web52506.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Firewall:
Fedora Core 1
iptables 1.2.9-1.0

I am having trouble with email clients on the LAN being able to recieve
emails with attachments.  Attachment size doesn't matter.  The email
clients will just time out trying to recieve an email that has an
attachmentThe firewall is able to get emails with attachements using
Fetchmail from the same server, so I don't think it is a POP3 server
issue, and everything else works fine, browsing, ftp etc...

I'm using fwbuilder 2.0 to configure iptables.

I'm sure it's something simple...
iptables -L output:

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
DROP       all  --  10.2.0.1             anywhere
DROP       all  --  cablemodem.creger.net 
c-24-56-227-130.chrlmi.cablespeed.com
ACCEPT     all  --  10.1.1.0/24          anywhere            state NEW
RULE_4     tcp  --  anywhere            
c-24-56-227-130.chrlmi.cablespeed.com tcp dpt:ssh state NEW
RULE_5     all  --  anywhere             anywhere
 
Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
DROP       all  --  10.2.0.1             anywhere
ACCEPT     all  --  10.1.1.0/24          anywhere            state NEW
RULE_5     all  --  anywhere             anywhere
 
Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  c-24-56-227-130.chrlmi.cablespeed.com  anywhere    
       state NEW
ACCEPT     all  --  server.creger.net    anywhere            state NEW
ACCEPT     all  --  10.1.1.0/24          anywhere            state NEW
RULE_4     tcp  --  anywhere            
c-24-56-227-130.chrlmi.cablespeed.com tcp dpt:ssh state NEW
RULE_5     all  --  anywhere             anywhere
 
Chain RULE_4 (2 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere            LOG level
info prefix `RULE 4 -- ACCEPT '
ACCEPT     all  --  anywhere             anywhere
 
Chain RULE_5 (3 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere            LOG level
info prefix `RULE 5 -- DENY '
DROP       all  --  anywhere             anywhere


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

