From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: putting all logs in a file
Date: Wed, 10 Sep 2003 11:11:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5F3F2E.70102@Loudoun-Fairfax.com>
References: <Pine.LNX.4.44.0309100644040.15305-100000@cic-mail.lanl.gov>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010305060701020804040608"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0309100644040.15305-100000@cic-mail.lanl.gov>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Stephen Smoogen <smoogen@lanl.gov>
Cc: akshaysalkar <akshaysalkar@indiatimes.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------010305060701020804040608
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



Stephen Smoogen wrote:

>You can change the log level with the --log-level addtion to any -j LOG 
>lines
>
>LOG_LEVEL="local1"
>-j LOG --log-level ${LOG_LEVEL} --log-prefix " Blah "
>
>Then have local1 in /etc/syslog.conf go to /var/log/iptables.log
>  
>

I also wanted to do this, so I tried it and iptables balked with:

iptables v1.2.7a: log-level 'local1' unknown

I checked my syslog.h file and found that 'local1' was an alias for the 
LOG_LOCAL1 facility and not defined as a priority (log level). Suggestions?

Jeff

--------------010305060701020804040608
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<br>
<br>
Stephen Smoogen wrote:<br>
<blockquote type="cite"
 cite="midPine.LNX.4.44.0309100644040.15305-100000@cic-mail.lanl.gov">
  <pre wrap="">
You can change the log level with the --log-level addtion to any -j LOG 
lines

LOG_LEVEL="local1"
-j LOG --log-level ${LOG_LEVEL} --log-prefix " Blah "

Then have local1 in /etc/syslog.conf go to /var/log/iptables.log
  </pre>
</blockquote>
<br>
I also wanted to do this, so I tried it and iptables balked with:<br>
<br>
iptables v1.2.7a: log-level 'local1' unknown<br>
<br>
I checked my syslog.h file and found that 'local1' was an alias for the
LOG_LOCAL1 facility and not defined as a priority (log level).
Suggestions?<br>
<br>
Jeff<br>
</body>
</html>

--------------010305060701020804040608--


