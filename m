From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: --sport
Date: Wed, 5 Mar 2003 17:40:08 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303051739370.15008@dns.toxicfilms.tv>
References: <ABEKJILKOKKGGDJKHKDFGEALCAAA.patrick@vikus.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFGEALCAAA.patrick@vikus.com>
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
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter@lists.netfilter.org

> 1. Is there a way to specify a range of source ports when setting a rule. My
# iptables -p tcp --help

So use:

--sport 5000:5020

Regards,
Maciej


