From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Logging to the screen
Date: Tue, 22 Nov 2005 12:39:01 -0600
Message-ID: <200511221239.01763.rob0@gmx.co.uk>
References: <43836074.3000403@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43836074.3000403@mail.bloomfield.k12.mo.us>
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

On Tuesday 2005-November-22 12:16, Scott Mayo wrote:
> the actual firewall itself and see all this info that I had my
> IPTABLES log, on the screen.  Any reason why it is not sending it to
> the /var/log/messages? Thanks.

The answer is in your LOG rules (--log-level) and syslog.conf(5). LOG 
uses syslog(2) facility "kern" and priority as set in --log-level 
(default is probably "info".)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

