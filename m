From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Repost: ip_local_deliver: bad skb:
Date: Fri, 12 Aug 2005 07:56:41 +0200
Message-ID: <20050812055641.GC26227@torres.l21.ma.zugschlus.de>
References: <42FBE6CF.7090506@pbw.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42FBE6CF.7090506@pbw.id.au>
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
To: netfilter@lists.netfilter.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 12, 2005 at 01:01:19AM +0100, Peter B. West wrote:
> Posting this again, as I haven't seen any replies.  Is this the right 
> mailing list?
> 
> 
> Just lately, my /var/log/messages has been filling up with messages like
> this:
> 
> Aug  6 14:26:35 jezebel kernel: ip_local_deliver: bad skb: \
>                             PRE_ROUTING LOCAL_IN LOCAL_OUT POST_ROUTING
> Aug  6 14:26:35 jezebel kernel: skb: pf=2 (unowned) dev=lo len=52
> Aug  6 14:26:35 jezebel kernel: PROTO=6 127.0.0.1:35923 127.0.0.1:111 \
>                                       L=52 S=0x00 I=4590 F=0x4000 T=64
> 
> I've also seen PROTOs 17 and 1.
> 
> Can anyone enlighten me as to what is going on?

That looks like debug code at an inappropriate place, I have that one
as well. On the net, I found the attached patch (which, in this
version, applies against 2.6.12.4). Switching off netfilter debugging
in the kernel config, so the message found out there, will solve the
issue as well.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

--7JfCtLOvnd9MIVvH
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="bad-skb.patch.gz"
Content-Transfer-Encoding: base64

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
dxc68o47AAA=

--7JfCtLOvnd9MIVvH--

