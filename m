From: Jeffrin <jeffrin@gamebox.net>
Subject: Re: iptables related
Date: Tue, 9 Dec 2003 01:14:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031208194434.GA1780@msservices>
References: <20031208191947.GA1603@msservices> <200312081928.28282.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312081928.28282.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

hello ,

iptables -P INPUT DROP
iptables -A INPUT -p tcp --sport 80 -j ACCEPT

Iam not able to ping. why ?


