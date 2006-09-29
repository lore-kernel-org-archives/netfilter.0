From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: can iptables block ARPS
Date: Fri, 29 Sep 2006 17:27:50 +0300
Message-ID: <451D2D66.20301@zoomnet.ro>
References: <b06339d40609290721o57703505m4de20360ac6aca30@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b06339d40609290721o57703505m4de20360ac6aca30@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralph Blach <ralph.blach@gmail.com>
Cc: netfilter@lists.netfilter.org

Ralph Blach wrote:
> Can Ip Tables Block arp request from certain Mac address or IP address?
>
> If so, what is the syntax.
>
> thanks
>
> Chip
>
Nope, use arptables. It has similar syntax with iptables.

