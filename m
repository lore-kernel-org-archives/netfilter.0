From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Fwd: Re: Can reach some websites, can't reach others
Date: Sat, 22 May 2004 12:01:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405221201.37823.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org


	Forwarding to list for historical record

----------  Forwarded Message  ----------

Subject: Re: Can reach some websites, can't reach others
Date: May 22, 2004 10:29 am
From: Sven Riedel <sr@gimp.org>
To: Alistair Tonner <Alistair@nerdnet.ca>

On Sat, May 22, 2004 at 08:41:50AM -0400, Alistair Tonner wrote:
> 	You don't mention what your connection is -- But I'm betting you are on
> some sort of DSL --  likely using something like pppoe to connect.

Correct.

> There is an
> issue with DSL pppoe connections from downstream boxen that DON"T do
> intelligent PMTU discovery .... like *cough* windows. You need a tweak that
> I don't see in your firewall as posted.

Great, that rule worked like a charm, and I'd never have realized that
this could be a problem.

Thanks!

Regs,
Sven

-------------------------------------------------------

