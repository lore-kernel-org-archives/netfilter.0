From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: rules monitor?
Date: Thu, 29 Sep 2005 01:57:06 -0500
Message-ID: <200509290157.06414.rob0@gmx.co.uk>
References: <433B2B47.3050405@lorenzutti.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433B2B47.3050405@lorenzutti.com.ar>
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

On Wednesday 2005-September-28 18:46, Guido Lorenzutti wrote:
> Hi people. Does anyone knows any tool to monitor the iptables rules
> to check if they are what they should and apply them if not? I
> mean... check if every single rule is running and warn or apply them
> if they are removed?

Hmmm ... why would the rules have changed? Only root can manipulate 
iptables rules.

If you mean that an interface changes IP or goes down, I suggest 
scripting something that takes place in that event, such as a pppd 
ip-up or ip-down script or the DHCP client equivalents.

If you're talking about a remote IP changing or something similar, no, 
you will have to write your own script, perhaps run it as a cron job. 
IAC you should be more specific about the problem you are trying to 
solve.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

