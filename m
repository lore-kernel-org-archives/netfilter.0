From: Shawn <core@enodev.com>
Subject: Re: Routing Public IPs over NAT Address Space
Date: 14 Jul 2003 13:10:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058206204.24263.19.camel@localhost>
References: <200307141052.AA122028212@mail.alberni.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307141052.AA122028212@mail.alberni.net>
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
To: techlists@alberni.net
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Just like the subject says is kind of terse, and a little fuzzy.

That depends on how you mean your question. I assume you want the big
"I" to be able to reach your public over one of your routers, through a
NAT so-to-speak?
          -----------------------------------------     some      Your
 ---     | public int   |            | private int |    private   public
| I | -> | pubnet.0/224 | nat-ROUTER | rfc1918/224 | -> IP     -> IP
 ---      -----------------------------------------     space     space

??? Why???

On Mon, 2003-07-14 at 12:52, Aaron Clausen wrote:
> Just like the subject says; is there any way to route a public IP/subnet over a NAT address space?

