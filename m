From: jon west <lwsivad@yahoo.com>
Subject: Logging to separate file
Date: Tue, 9 Dec 2003 12:45:23 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209204523.29020.qmail@web40406.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1141590856-1071002723=:20327"
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

--0-1141590856-1071002723=:20327
Content-Type: text/plain; charset=us-ascii

I'm trying to get logging working, again.  It was logging to /var/log/messages and I tried to move it to /var/log/iptables.  Now I can't get it to log to either.
 
Redhat 9 on Intel box
sysconfig.conf:
(first or last line, didn't work either way)
kern.=debug   /var/log/iptables
 
IPTables Configuration:
 ... -j LOG --log-level debug
 
I also tried:
syslog.conf
*.=debug  /var/log/iptables
 
IPTables configuration:
... -j LOG --log-level debug
 
I also tried to delete all the things I added to syslog.conf then set the IPTables configuration to just "-j LOG" but it doesn't work either.
 
When I do an /sbin/iptables -L -vn, it says the packets are logged (then dropped on the next line) but I cannot get it to write to any files.
 
Any help?
 
syslog.conf (right now):
kern.=debug  /var/log/iptables
*.info;mail.none;authpriv.none;cron.none;local6.none  /var/log/messages
authpriv.*  /var/log/secure
mail.*  /var/log/maillog
cron.*  /var/log/cron
*.emerg  *
uucp,news.crit  /var/log/spooler
local7.*  /var/log/boot.log
local6.*  /var/log/dhcp.log
 
Thanks.


---------------------------------
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing
--0-1141590856-1071002723=:20327
Content-Type: text/html; charset=us-ascii

<DIV>I'm trying to get logging working, again.&nbsp; It was logging to /var/log/messages and I tried to move it to /var/log/iptables.&nbsp; Now I can't get it to log to either.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Redhat 9 on Intel box</DIV>
<DIV>sysconfig.conf:<BR>(first or last line, didn't work either way)<BR>kern.=debug&nbsp;&nbsp; /var/log/iptables</DIV>
<DIV>&nbsp;</DIV>
<DIV>IPTables Configuration:<BR>&nbsp;... -j LOG --log-level debug</DIV>
<DIV>&nbsp;</DIV>
<DIV>I also tried:<BR>syslog.conf<BR>*.=debug&nbsp; /var/log/iptables</DIV>
<DIV>&nbsp;</DIV>
<DIV>IPTables configuration:<BR>... -j LOG --log-level debug</DIV>
<DIV>&nbsp;</DIV>
<DIV>I also tried to delete all the things I added to syslog.conf then set the IPTables configuration to just "-j LOG" but it doesn't work either.</DIV>
<DIV>&nbsp;</DIV>
<DIV>When I do an /sbin/iptables -L -vn, it says the packets are logged (then dropped on the next line) but I cannot get it to write to any files.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Any help?</DIV>
<DIV>&nbsp;</DIV>
<DIV>syslog.conf (right now):<BR>kern.=debug&nbsp; /var/log/iptables<BR>*.info;mail.none;authpriv.none;cron.none;local6.none&nbsp; /var/log/messages<BR>authpriv.*&nbsp; /var/log/secure<BR>mail.*&nbsp; /var/log/maillog<BR>cron.*&nbsp; /var/log/cron<BR>*.emerg&nbsp; *<BR>uucp,news.crit&nbsp; /var/log/spooler<BR>local7.*&nbsp; /var/log/boot.log<BR>local6.*&nbsp; /var/log/dhcp.log</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks.</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://us.rd.yahoo.com/evt=21260/*http://photos.yahoo.com">New Yahoo! Photos - easier uploading and sharing</a>
--0-1141590856-1071002723=:20327--

