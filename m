From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: Re: CONNMARK save-mark and restore-mark not working ?
Date: Fri, 18 Feb 2005 16:37:09 -0500
Message-ID: <20050218213709.GD31190@elm.home.idallen.ca>
References: <20050218084044.GA31190@elm.home.idallen.ca>
	<004001c515a8$80403df0$910010ac@coco>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004001c515a8$80403df0$910010ac@coco>
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
To: Omar Garcia <omar.garcia@fractalia.biz>
Cc: netfilter@lists.netfilter.org

On Fri, Feb 18, 2005 at 11:56:29AM +0100, Omar Garcia wrote:
> And this?
>     iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
>     iptables -t mangle -A OUTPUT -m connmark ! --mark 0 -j ACCEPT
>     iptables -t mangle -A OUTPUT -j MARK --set-mark 9
>     iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

That doesn't work because, as I posted, neither --save-mark nor
--restore-mark appear to work.

The --save-mark does not set and save the mark value in any line in
/proc/net/ip_conntrack.

The --restore-mark does not take the mark value from a line in
ip_conntrack and restore it into any packet.

See my original posting for examples of this.  I think my kernel must be
broken, unless I'm misunderstanding how these things are supposed to work.

-- 
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
       EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
       College professor (Linux) via: http://teaching.idallen.com/
       Support free and open public digital rights:  http://eff.org/

