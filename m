From: "John Black" <black@arbbs.net>
Subject: Re: Destination Nat
Date: Wed, 2 Jun 2004 06:53:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <016f01c44898$2fa221c0$9322a141@black>
References: <40b74a21.49.47a3.1468065555@arbbs.net> <1085795768.14775.2.camel@localhost> <013201c44853$1829e220$9322a141@black> <1086175160.4146.1.camel@localhost>
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
To: netfilter@lists.netfilter.org

okay,
thank you


> -p 6 is the same as -p tcp only a little faster as it does not have to
> look up tcp in the protocols file and translate it from tcp to 6.  UDP
> would be -p 17, ICMP -p 1, ESP -p 50, etc.
> 



