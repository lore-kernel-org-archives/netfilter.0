From: Petr Pisar <xpisar@fi.muni.cz>
Subject: Re: Shouldn't this rule catch all packets
Date: Thu, 14 Dec 2006 19:56:06 +0000 (UTC)
Message-ID: <slrneo3b2o.8uu.xpisar@album.ics.muni.cz>
References: <4581A2F1.10305@vlsmaps.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 2006-12-14, jwlargent <jwlargent@vlsmaps.com> wrote:
> I was trying to debug some errors in my iptables setup so I added the 
> following rules to my OUTPUT, just to see what packets were going out.
>
> iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
> iptables -A OUTPUT -j ACCEPT
>
> When I do iptables -L OUTPUT -v it shows some packets are falling 
> through to the last rule.
> Shouldn't the first rule catch all the packets?
>
No. There exists forth state called INVALID. E.g. TCP packet with ACK
witch is not part of any tracked TCP connection is INVALID. Naturally,
INVALID packets are ill packets and they shoudn't appear, but the reality
is different.

-- Petr


