From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Unauthorized Activity Detection using IPTables
Date: Fri, 13 Dec 2002 16:46:39 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0212131643480.28712-100000@dns.toxicfilms.tv>
References: <4223A04BF7D1B941A25246ADD0462FF559A362@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4223A04BF7D1B941A25246ADD0462FF559A362@blr-m3-msg.wipro.com>
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
To: Amit Kumar Gupta <amitkumar.gupta@wipro.com>
Cc: netfilter@lists.netfilter.org

Hello,

If you construct your firewall like this:
- allow what's allow
- log and drop everything else.

You will have what you need.

you can use something like:
iptables -N logdrop
iptables -A logdrop -j LOG
iptables -A logdrop -j DROP

and at the end of your chains add:
iptables -A FORWARD -j logdrop

This is for FORWARD chain, change it to whatever you need.

Regards,
Maciej Soltysiak



