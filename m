From: "Michael Schoen" <schoen@anduras.de>
Subject: AW: iptables wishes
Date: Sun, 6 Apr 2003 05:57:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c2fbf0$af40d660$040a0a0a@schiller>
References: <200304010341.48281.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304010341.48281.netfilter@newkirk.us>
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

Hi Joel,

> 2 - completely separate netfilter logging from kernel log streams.
(not
> just redirecting infrequently-used kernel streams, but actual
dedicated
> netfilter streams)

What about including the ability to do a full datastream logging within
a fixed [rrd-database] size, e.g. the last 50 Kbyte sent through the
netfilter stack, at best also available as an per-connection stream?

Or statistics not only about the amount of connections within the
netfilter at a certain time, but also to build some averages.

Are there already any solutions?

Sincerely

  .\\ichael




