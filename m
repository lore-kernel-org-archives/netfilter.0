From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: My ack is more important than anything else!
Date: Thu, 6 Nov 2003 09:08:08 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0311060906170.21234@dns.toxicfilms.tv>
References: <20031105205036.42186.qmail@web40204.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031105205036.42186.qmail@web40204.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SBlaze <dagent.geo@yahoo.com>
Cc: Elver Loho <kernelpenguin@hot.ee>, netfilter@lists.netfilter.org

> This too interests me... I have seen this done on OpenBSD but the same tools
> they use are not for Linux.. anyone out there know this?
you can do this with tc. just use an u32 match to add a rule to filter
acks and prioritize them into queues.

Please read the lartc on http://www.lartc.org
It is full of examples, a cookbook and a good description of queing
disciplines, filters, matches, etc...

Regards,
Maciej


