From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Yet Another Kazaa Issue
Date: Fri, 22 Nov 2002 12:19:06 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211221218040.7424-100000@dns.toxicfilms.tv>
References: <001101c2900e$055b0bf0$0200000a@parseerror.dk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001101c2900e$055b0bf0$0200000a@parseerror.dk>
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
To: =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@ncparty.dk>
Cc: netfilter@lists.netfilter.org

> iptables -A FORWARD -m string --string "X-Kazaa-Username:" -j DROP
> iptables -A FORWARD -m string --string "X-Kazaa-Network:" -j DROP
> iptables -A FORWARD -m string --string "X-Kazaa-IP:" -j DROP
> iptables -A FORWARD -m string --string "X-Kazaa-SupernodeIP" -j DROP
> iptables -A FORWARD -m string --string "Kazaa" -j DROP
I recommend REJECT --reject-with tcp-reset.
It will tell the clients that the connections is closed. If you drop the
packets, the clients will try to send packets on and on for some time.

Maciej Soltysiak



