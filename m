From: "Ben Tan" <bentan74@singnet.com.sg>
Subject: Re: Microsoft VPN and iptables
Date: Mon, 11 Nov 2002 11:08:49 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002301c2892f$a7e89120$1801010a@demo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: a <netfilter@lists.netfilter.org>

hi,
    if you're using PPTP, pls allow 1723 ports and also gre protocol, as gre
protocol will be used after the authentication.

    but if you're able to connect to the VPN server, the failed connection
maybe due to the remote access policy that you'd implemented on the VPN
server side or RADIUS server.

cheers
ben


