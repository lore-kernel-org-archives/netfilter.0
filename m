From: Philip Craig <philipc@snapgear.com>
Subject: Re: Kernel: NET: messages suppressed (I am sure it has been covered
 before)
Date: Fri, 24 Oct 2003 13:34:16 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F989DB8.1070507@snapgear.com>
References: <3F41DBB59549A54482D4FC25AEEDCBE18B9A9F@MAIL-06VS.atlarge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F41DBB59549A54482D4FC25AEEDCBE18B9A9F@MAIL-06VS.atlarge.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frischknecht Peter <peter@empoweringsolutions.com>
Cc: netfilter@lists.netfilter.org

Frischknecht Peter wrote:
> I need to know WHAT MESSAGE WAS SUPPRESSED.
> 
> I am getting slammed.  My server will display anywhere from a few
> hundred to 50K messages suppressed.
> 
> Previous posters have suggested that if I go early enough in my logs,
> that I will find the original suppressed message. NOT TRUE.

You should have one successful log message for every log message
indicating the number of suppressed log messages.  Since your
/var/log/messages does not contain the successful log messages,
your syslogd must be configured to send them elsewhere.

Note that the number of suppressed log messages is always logged
at KERN_WARNING, but the actual message could be anything.  I
would suspect that the actual log messages are KERN_DEBUG, and
your syslogd is configured to ignore them

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


