From: Philip Craig <philipc@snapgear.com>
Subject: Re: multiple PPTP clients to same server
Date: Thu, 23 Feb 2006 10:18:49 +1000
Message-ID: <43FCFF69.3040406@snapgear.com>
References: <96b73a1a0602211348o3ac495a0u52b92d5597f03ebe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <96b73a1a0602211348o3ac495a0u52b92d5597f03ebe@mail.gmail.com>
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
To: Yannick Deltroo <deltroo@gmail.com>
Cc: netfilter@lists.netfilter.org

On 02/22/2006 07:48 AM, Yannick Deltroo wrote:
> One quick question about the PPTP NAT helper:
> Does it support multiple PPTP clients connecting to the same PPTP
> server from behind a Netfilter NAT router  ?

Yes, this is probably the most common use for it.

> I guess Call-Id could be used to track multiple calls in the same
> control connection.

Not supported.  Each call must have its own control connection.
The TCP source port of the control connection is used to NAT
the Call-Id.  I'm not aware of any clients that use multiple calls.


