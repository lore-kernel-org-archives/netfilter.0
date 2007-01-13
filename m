From: "Andras Izsof" <dfandrew@gmail.com>
Subject: iptables to redir subdomain to certain ports
Date: Sat, 13 Jan 2007 16:34:58 +0100
Message-ID: <6acf2da00701130734r62945d54k9f6759dc95431e72@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I need to redirect certain subdomains to certain ports on the same
server and vice versa. The most important is, that the manoeuvre must
be transparent to the client, because most company firewalls only
allow www data on port 80. So if I use a dl.domain.com:81 link on my
page, then it will be inaccessible for the "firewalled ones".

So if a request comes in for www.domain.com, then I need that to be
redirected to port 80(apache), that's OK, but when dl.domain.com pops
in, then port 81(thttpd) would be the target. Can this be done with
iptables and if so how?

Long ago someone recommended an iptables package for me, which is
capable of this, but can't find anything about it :(.

Thanks
DF

