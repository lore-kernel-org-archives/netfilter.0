From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: firewalled dns clients
Date: 07 Nov 2003 05:33:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068201192.1132.7.camel@valhalla>
References: <F22386C3FEB012449238672E38ED61E706C26A@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E706C26A@overlord.overturemedia.com>
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
To: Fritz Mesedilla <fritz.mesedilla@overturemedia.com>
Cc: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>

On Thu, 2003-11-06 at 22:49, Fritz Mesedilla wrote:
>
> I tried this and nothing happened.
> $IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
> even a
> $IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT

Try:
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source x.x.x.x
iptables -A FORWARD -p udp -i eth1 -s y.y.y.y -d 0/0 --dport 53 -j
ACCEPT
iptables -A FORWARD -p tcp -i eth1 -s y.y.y.y -d 0/0 --dport 53 -j
ACCEPT

x.x.x.x = Firewall's legal external IP address 
y.y.y.y = internal private subnet 
eth0 = external interface (change to eth1 if needed)
eth1 = internal interface (change to eth0 if needed)

HTH,
C



