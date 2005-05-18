From: Jason Opperisano <opie@817west.com>
Subject: Re: Requiste for starting service iptables
Date: Wed, 18 May 2005 11:20:01 -0400
Message-ID: <20050518152001.GA4924@bender.817west.com>
References: <20050517205816.87529.qmail@web8407.mail.in.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050517205816.87529.qmail@web8407.mail.in.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, May 17, 2005 at 09:58:16PM +0100, haynes george wrote:
> hi...
> 
> i am trying to find out the services which should be
> started before the service iptables can be started.
> 
> I have read thru the /etc/rc.d/init.d script and i
> think iptables depends on service network 
> 
> Does it depend on any other service to start...???Is
> there any method to know this ?
> 
> I need to know this cause its for my college project.

there is no strict reason why the iptables startup script would depend
on networking being up.  there's actually a pretty good argument that
iptables should start before networking is brought up to reduce
(eliminate?) the window of opportunity where the interfaces have IP
addresses, but no firewall rules are loaded.

one reason i could see why some people/vendors would want to wait for
networking to startup before iptables starts, is if the interfaces have
dynamic IP addresses that need to be calculated for the rules to be
loaded.

from a purely academic perspective, i would say that your firewall rules
should load before your interfaces have IP addresses.

-j

--
"Stewie: Forecast for tomorrow; A few sprinkles of genius with a chance
 of doom."
        --Family Guy


