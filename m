From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: connection tracking and keepalive
Date: 15 Jan 2003 13:44:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042634640.923.27.camel@xbox>
References: <F32yuH5stQqOPsNtP3U00008bbd@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F32yuH5stQqOPsNtP3U00008bbd@hotmail.com>
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
To: SB CH <chulmin2@hotmail.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Wed, 2003-01-15 at 12:37, SB CH wrote:
> Hello,
> 
> Does connection tracking has a relation with the keepalive config at 
> httpd.conf?

No, not really.

> 
> I would like that connection tracking has a relation with keepalive or not?

Connection tracking is more related to TCP states. Obviously with
keepalives off, every request requires a new TCP connection, so
indirectly they are related through the TCP states.

> and how much memory size is required to execute connection tracking ?

384 bytes per connection (may be slightly different depending on
your kernelversion - see /proc/slabinfo, ip_conntrack entry) +
a couple of bytes per hash (I think 8 bytes) * hashsize (determined
when ip_conntrack is loaded)

Regards,
Filip



