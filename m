From: Philip Ho <cbho@ie.cuhk.edu.hk>
Subject: Re: Match bits
Date: Fri, 04 Apr 2003 15:22:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E8D329C.EFEC1BA6@ie.cuhk.edu.hk>
References: <115493390628.20030330212324@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Peteris Krumins <newsgroups@lf.lv>, netfilter@lists.netfilter.org

I am also finding this feature. (I am trying to match on the ip fragmentation offset
field.) I am wondering why iptables don't come up with a more 'generic' module to match
any pattern in IP header using some kind of mask?

Any idea?

Regards,
philip


Peteris Krumins wrote:

> Hello,
>
>  Is there a way to match single bit (two bits, byte etc.) in a packet using iptables?
>  (without queuing to userspace)
>
>  For example i'd like to match bit 41 in IP packet - reserved flag.
>  or if bits 42 and 43 both are not set..
>
>
> P.Krumins




