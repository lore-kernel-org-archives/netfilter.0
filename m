From: Torsten Luettgert <t.luettgert@pressestimmen.de>
Subject: Re: Trying to understand a performance problem - help please.
Date: Tue, 17 Apr 2007 22:44:50 +0200
Message-ID: <1176842690.3870.12.camel@murdegern.cbxnet.de>
References: <200704151827.55457.alan@chandlerfamily.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200704151827.55457.alan@chandlerfamily.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: Alan Chandler <alan@chandlerfamily.org.uk>
Cc: netfilter@lists.netfilter.org

On Sun, 2007-04-15 at 18:27 +0100, Alan Chandler wrote:

> a) Whether wireshark sees the packets before they are processed by 
> IPTABLES? (I want to see if there is a possibility that they reach the 
> machine but iptables drops them)

Yup, wireshark and tcpdump see them before they hit iptables.

Regards,
Torsten


