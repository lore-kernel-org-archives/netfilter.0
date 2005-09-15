From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: logging to syslog in a stealth way
Date: Thu, 15 Sep 2005 10:33:57 -0500
Message-ID: <200509151033.57248.rob0@gmx.co.uk>
References: <BAY101-F189DDD6D8895BBB9EC091BB49E0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F189DDD6D8895BBB9EC091BB49E0@phx.gbl>
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

On Thursday 2005-September-15 10:26, Albretch Mueller wrote:
> >What exactly you want to achieve with that ?
>
> As the subject clearly states :-) "logging to syslog in a stealth
> way"
>
> Do you know of any other/better way to do it?

Stealth means you are hiding. Who are you hiding from? You want logging 
to go to a remote syslog server but NOT to appear in the logs of the 
iptables machine?

Clarity of subject notwithstanding, your ultimate goal is far from 
clear. If my guess was correct, I think your only choice is ULOG. LOG 
is going to pass to the local kernel logging daemon.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

