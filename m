From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: conntrack-tcp-nopickup | newnat
Date: 07 May 2003 11:53:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052301203.24215.7.camel@tux.rsn.bth.se>
References: <7497DCA1C240C042B28F6657ADFD8E090303194E@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E090303194E@i2km11-ukbr.domain1.systemhost.net>
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
To: dhiraj.2.bhuyan@bt.com
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-05-07 at 10:47, dhiraj.2.bhuyan@bt.com wrote:
> Hi List,
> 
> Is "conntrack-tcp-nopickup" available for the new NAT framework?
> Also, does anyone have pointer to the difference between oldnat and newnat?

You can find a patch here:
http://www.netfilter.org/~gandalf/patches/conntrack-tcp-nopickup.patch

This version includes /proc/sys/net/ipv4/ip_conntrack_pickup which
defaults to 1 (enabled) which allows you to change the behaviour during
operation.

-- 
/Martin

