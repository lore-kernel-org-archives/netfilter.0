From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Monitoring problems...
Date: 31 Oct 2003 05:27:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067596048.1137.3.camel@valhalla>
References: <DFD93DB4ABEF7243BC4F81DE17A182EF94B2@tugexch.vpn.mmsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DFD93DB4ABEF7243BC4F81DE17A182EF94B2@tugexch.vpn.mmsi.com>
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
To: Mark Webb <webb@mmspl.com.au>
Cc: netfilter@lists.netfilter.org

On Wed, 2003-10-29 at 17:52, Mark Webb wrote:
>
> I was asked by the powers that be to set up some monitoring of our
> workplaces internet traffic. Basically a breakdown of the volume used
> and what protocol is using it.  i.e. 20% mail, 30% web, 10% ftp,
> etc....

I would use ntop for this. Its specifically designed for this type of
activity and creates pretty pie charts with lots of colors. ;-)

http://www.ntop.org/

> On the box I have iptables running using the following:
> 
> iptables -A INPUT -j LOG --log-level 7 --log-prefix '[MONITOR]'
>
> Now all this seems to be working (sort of).   If I compare the log to
> a tcpdump output the log is only capturing about 5%.

Try:
iptables -A FORWARD -j LOG --log-level 7 --log-prefix '[MONITOR]'

but as I said, I would use ntop.

HTH,
C



