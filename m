From: ads nat <adsnat@yahoo.com>
Subject: iptables-restore help
Date: Sat, 27 Sep 2003 23:58:17 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030928065817.34041.qmail@web20714.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-740554391-1064732297=:32352"
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
To: netfilter@lists.netfilter.org

--0-740554391-1064732297=:32352
Content-Type: text/plain; charset=us-ascii

Hi,
I am learning to use iptables.
I have gone through FAQ and tutorials but have two problems :
 
1) I can create rules, delete rules, save rules with "iptables-save" command. But can not use "iptables-restore" properly. my iptables file is in at /etc/sysconfig/iptables
I am using Redhat Linux 8.0, iptables 1.2.6a version.
 
Whatever rule I have saved goes off when i reboot system. As I have understood after using "iptables-restore" command, it should save rules in /etc/sysconfig/iptables file. So that when system reboots automatically it will be implimented.
 
2) I have set rule "iptables -A INPUT -i eth0 -m state --state NEW -m limit --limit 1 -j LOG" so that i can go through logs of NEW users tryong to connect to server. These are saved in which file? 
Help appreciated.
 
Thanks 

 
 


---------------------------------
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
--0-740554391-1064732297=:32352
Content-Type: text/html; charset=us-ascii

<DIV>Hi,</DIV>
<DIV>I am learning to use iptables.</DIV>
<DIV>I have gone through FAQ and tutorials but&nbsp;have two problems :</DIV>
<DIV>&nbsp;</DIV>
<DIV>1) I can create rules, delete rules, save rules with "iptables-save" command. But can not use&nbsp;"iptables-restore" properly. my iptables file is in at /etc/sysconfig/iptables</DIV>
<DIV>I am using Redhat Linux 8.0, iptables 1.2.6a version.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Whatever rule I have saved goes off when i reboot system. As I have understood after using "iptables-restore" command, it should save rules in /etc/sysconfig/iptables file. So that when system reboots automatically it will be implimented.</DIV>
<DIV>&nbsp;</DIV>
<DIV>2) I have set rule "iptables -A INPUT -i eth0 -m state --state NEW -m limit --limit 1 -j LOG" so that i can go through logs of NEW users tryong to connect to server. These are saved in which file? </DIV>
<DIV>Help appreciated.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks&nbsp;<BR></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://shopping.yahoo.com/?__yltc=s%3A150000443%2Cd%3A22708228%2Cslk%3Atext%2Csec%3Amail">The New Yahoo! Shopping</a> - with improved product search
--0-740554391-1064732297=:32352--

