From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Logging to the screen
Date: Mon, 28 Nov 2005 17:48:57 -0600
Message-ID: <200511281748.57428.rob0@gmx.co.uk>
References: <43836074.3000403@mail.bloomfield.k12.mo.us>
	<200511221239.01763.rob0@gmx.co.uk>
	<438B1704.4040204@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <438B1704.4040204@mail.bloomfield.k12.mo.us>
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

On Monday 2005-November-28 08:41, Scott Mayo wrote:
> Thanks for the info.  I got to reading the man pages on syslog.  My
> iptables were logging with the value 'debug'.  From what I read, if I
> understand this correctly, that will cause syslog to send the message
> to the screen.  I changed my iptables to a log-level of 'info' and it

Yikes, debug level to the screen? Normally it should only be serious 
messages going to the screen. My syslog.conf has *.emerg only to 
console.

> Thanks again.

NP.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

