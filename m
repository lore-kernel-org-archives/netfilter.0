From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: about log!
Date: Fri, 17 Jun 2005 13:00:17 -0500
Message-ID: <200506171300.17846.rob0@gmx.co.uk>
References: <20050617082843.385.qmail@web15903.mail.cnb.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050617082843.385.qmail@web15903.mail.cnb.yahoo.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org
Cc: duyu210@sina.com

On Friday 17 June 2005 03:28, too rain wrote:
> it will happen?!! And another oddball instance is when I stop the
> syslog,the log info begin to print on screen continuously,but when I
> start it,it stop put out log info on screen!why?????? please write

No, this is normal. The iptables LOG target is kernel logging, and 
messages will still be produced whether or not the syslogd is running. 
While syslogd is running it receives the kernel log messages and it 
knows (through "--log-level info" and your syslog.conf) not to log to 
console. But when syslogd is stopped the kernel messages have nowhere 
else to go.

Just don't restart syslogd so often. And as I've said before on this 
list, I think most iptables logging, except for temporary 
troubleshooting steps, is useless. Consider not logging so much, 
through the use of -m limit, or just delete your LOG rule.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

