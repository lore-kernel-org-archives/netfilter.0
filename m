From: ads nat <adsnat@yahoo.com>
Subject: Re: iptables-restore help
Date: Sun, 28 Sep 2003 02:18:02 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030928091802.5218.qmail@web20705.mail.yahoo.com>
References: <3F768DFF.1040802@smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-672477449-1064740682=:5144"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F768DFF.1040802@smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

--0-672477449-1064740682=:5144
Content-Type: text/plain; charset=us-ascii

Please guide me how to do this otherwise.
Thanks.

Daniel Chemko <dchemko@smgtec.com> wrote:
iptables doesn't inherently save state data. Redhat 8.0 might do something along those lines, but if you are really trying to play with the iptables rules, it is probably best to disable the redhat stuff and build your own startup / shutdown scripts so that you really know what is going on under the hood.

ads nat wrote:
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

---------------------------------
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
--0-672477449-1064740682=:5144
Content-Type: text/html; charset=us-ascii

<DIV>Please guide me how to do this otherwise.</DIV>
<DIV>Thanks.<BR><BR><B><I>Daniel Chemko &lt;dchemko@smgtec.com&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">iptables doesn't inherently save state data. Redhat 8.0 might do something along those lines, but if you are really trying to play with the iptables rules, it is probably best to disable the redhat stuff and build your own startup / shutdown scripts so that you really know what is going on under the hood.<BR><BR>ads nat wrote:<BR>
<BLOCKQUOTE cite="mid20030928065817.34041.qmail@web20714.mail.yahoo.com" type="cite">
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
<DIV>&nbsp;</DIV>
<HR SIZE=1>
Do you Yahoo!?<BR><A href="http://shopping.yahoo.com/?__yltc=s%3A150000443%2Cd%3A22708228%2Cslk%3Atext%2Csec%3Amail">The New Yahoo! Shopping</A> - with improved product search </BLOCKQUOTE></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://shopping.yahoo.com/?__yltc=s%3A150000443%2Cd%3A22708228%2Cslk%3Atext%2Csec%3Amail">The New Yahoo! Shopping</a> - with improved product search
--0-672477449-1064740682=:5144--

