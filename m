From: Jason Opperisano <opie@817west.com>
Subject: Re: connection tracking without iptables?
Date: Wed, 29 Sep 2004 17:01:34 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096491694.12262.44.camel@wolfpack.ljm.dom>
References: <561dc3260409291350dc64a8a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc3260409291350dc64a8a@mail.gmail.com>
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

On Wed, 2004-09-29 at 16:50, Jiann-Ming Su wrote:
> This is probably a dumb question, but is it possible to track
> connections without iptables/netfilter?

modprobe ip_conntrack

-j

-- 
Jason Opperisano <opie@817west.com>


