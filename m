From: Mike Tone <simpletone@mbox.com.au>
Subject: netfilter LOG extension woes...
Date: Mon, 30 Sep 2002 11:27:45 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <180f251879c4.1879c4180f25@mbox.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-language: en
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
To: netfilter@lists.samba.org

i have played with the log netfilter extension  
(not ulog, simply log), however there are major  
weirdness' happening...  
  
could someone please explain exactly how it 
works?  
  
-j LOG --log-level debug  
then setting (in syslog.conf)  
kern.debug /var/log/netfilter  
  
doesn't work, logfile = 0..  
  
is there a way to set it to log to another target  
apart from kern(el) ?  
  
as in, news or something?  
  
without --log-level it logs to the console and  
/var/log/messages, which is not nice if your  
trying to modify the firewall to allow something  
being blocked/displayed all over the screen..  
  
on redhat, using:  
--log-level notice  
then in syslog  
kern.notice /var/log/netfilter  
doesn't work (- yes i restarted syslog ;)  
  
on debian  
--log-level debug  
kern.=debug -/var/log/netfilter  
doesn't work either ..  
  
argh :|  
 
 

---------------------------------------------------------------------
Faxes delivered directly to any email address, new to mBox!
Find out more http://www.mbox.com.au/fax

