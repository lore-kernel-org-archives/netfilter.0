From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: iptables-restore help
Date: Sun, 28 Sep 2003 00:30:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F768DFF.1040802@smgtec.com>
References: <20030928065817.34041.qmail@web20714.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010401050105050300050802"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030928065817.34041.qmail@web20714.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------010401050105050300050802
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

iptables doesn't inherently save state data. Redhat 8.0 might do 
something along those lines, but if you are really trying to play with 
the iptables rules, it is probably best to disable the redhat stuff and 
build your own startup / shutdown scripts so that you really know what 
is going on under the hood.

ads nat wrote:

> Hi,
> I am learning to use iptables.
> I have gone through FAQ and tutorials but have two problems :
>  
> 1) I can create rules, delete rules, save rules with "iptables-save" 
> command. But can not use "iptables-restore" properly. my iptables file 
> is in at /etc/sysconfig/iptables
> I am using Redhat Linux 8.0, iptables 1.2.6a version.
>  
> Whatever rule I have saved goes off when i reboot system. As I have 
> understood after using "iptables-restore" command, it should save 
> rules in /etc/sysconfig/iptables file. So that when system reboots 
> automatically it will be implimented.
>  
> 2) I have set rule "iptables -A INPUT -i eth0 -m state --state NEW -m 
> limit --limit 1 -j LOG" so that i can go through logs of NEW users 
> tryong to connect to server. These are saved in which file?
> Help appreciated.
>  
> Thanks 
>  
>  
> ------------------------------------------------------------------------
> Do you Yahoo!?
> The New Yahoo! Shopping 
> <http://shopping.yahoo.com/?__yltc=s%3A150000443%2Cd%3A22708228%2Cslk%3Atext%2Csec%3Amail> 
> - with improved product search 


--------------010401050105050300050802
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
iptables doesn't inherently save state data. Redhat 8.0 might do
something along those lines, but if you are really trying to play with
the iptables rules, it is probably best to disable the redhat stuff and
build your own startup / shutdown scripts so that you really know what
is going on under the hood.<br>
<br>
ads nat wrote:<br>
<blockquote type="cite"
 cite="mid20030928065817.34041.qmail@web20714.mail.yahoo.com">
  <div>Hi,</div>
  <div>I am learning to use iptables.</div>
  <div>I have gone through FAQ and tutorials but&nbsp;have two problems :</div>
  <div>&nbsp;</div>
  <div>1) I can create rules, delete rules, save rules with
"iptables-save" command. But can not use&nbsp;"iptables-restore" properly.
my iptables file is in at /etc/sysconfig/iptables</div>
  <div>I am using Redhat Linux 8.0, iptables 1.2.6a version.</div>
  <div>&nbsp;</div>
  <div>Whatever rule I have saved goes off when i reboot system. As I
have understood after using "iptables-restore" command, it should save
rules in /etc/sysconfig/iptables file. So that when system reboots
automatically it will be implimented.</div>
  <div>&nbsp;</div>
  <div>2) I have set rule "iptables -A INPUT -i eth0 -m state --state
NEW -m limit --limit 1 -j LOG" so that i can go through logs of NEW
users tryong to connect to server. These are saved in which file? </div>
  <div>Help appreciated.</div>
  <div>&nbsp;</div>
  <div>Thanks&nbsp;<br>
  </div>
  <div>&nbsp;</div>
  <div>&nbsp;</div>
  <hr size="1">Do you Yahoo!?<br>
  <a
 href="http://shopping.yahoo.com/?__yltc=s%3A150000443%2Cd%3A22708228%2Cslk%3Atext%2Csec%3Amail">The
New Yahoo! Shopping</a> - with improved product search
</blockquote>
</body>
</html>

--------------010401050105050300050802--


