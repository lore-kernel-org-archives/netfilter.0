From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: limit match log question
Date: Wed, 30 Apr 2003 17:13:50 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0304301712450.18203@dns.toxicfilms.tv>
References: <17030000.1051714338@hoovers-59.hoovers.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <17030000.1051714338@hoovers-59.hoovers.com>
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
To: Frank Smith <fsmith@hoovers.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi,

> If you are using the limit match to control the number of log entries,
> is there any way to also show the number of matches?
Yes,

# iptables -L -nv

-v option will show the number of packets that has hit the rule.

Regards,
Maciej Soltysiak


