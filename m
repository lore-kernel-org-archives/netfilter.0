From: Jason Opperisano <opie@817west.com>
Subject: Re: timeout settings?
Date: Mon, 27 Sep 2004 14:24:50 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096309489.16814.53.camel@wolfpack.ljm.dom>
References: <561dc326040927085672734f3c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc326040927085672734f3c@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 2004-09-27 at 11:56, Jiann-Ming Su wrote:
> I need to change the timeout settings on my iptables firewall.  I
> found /proc/sys/net/ipv4/netfilter/* but I haven't found docs
> describing how each of those parameters affect the performance of the
> firewall.  Where can I find the docs on how to properly set these
> values?  Thanks.

if you have those settings available, you (or your distribution) applied
the tcp-window-tracking patch.  that patch is based off this document:

        http://www.iae.nl/users/guido/papers/tcp_filtering.ps.gz
        
-j

-- 
Jason Opperisano <opie@817west.com>


