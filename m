From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: TTL - Time To Live
Date: Tue, 3 Jun 2003 11:55:50 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0306031153520.14724@dns.toxicfilms.tv>
References: <1054562534.915.34.camel@toyota>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054562534.915.34.camel@toyota>
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
To: Devlin =?ISO-8859-1?Q?Gon=E7alves?= <devlin.goncalves@compexsa.com.br>
Cc: netfilter@lists.netfilter.org

> Hey, people... Just a question:
> The time to live thing, works with tables or with rules???
As far as iptables and netfilter are concerned, IP header field called TTL
is taken into account only with rules that match on specific TTL.
Otherwise, TTL is not examined by netfilter code, but by routing code.

Regards,
Maciej


