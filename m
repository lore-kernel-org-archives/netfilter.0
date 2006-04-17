From: Brett Curtis <dashnu@gmail.com>
Subject: Re: Let Real Ip's behind Firewall
Date: Mon, 17 Apr 2006 09:17:18 -0400
Message-ID: <735664E7-68FB-4F5D-8B24-79947815D435@gmail.com>
References: <3da957060604170525q177719cfy3f3347f3061cf411@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v749.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3da957060604170525q177719cfy3f3347f3061cf411@mail.gmail.com>
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
To: Stephan Higuti <higuti.sam@gmail.com>
Cc: netfilter@lists.netfilter.org

If I understand what you are asking you can use iproute to set up
your nic for multiple external ips.

Then use prerouting..

/sbin/iptables -t nat -A PREROUTING -d <external_ip> -p tcp --dport 25 \
   -j DNAT --to-destination <internal_ip>:25

Brett

On Apr 17, 2006, at 8:25 AM, Stephan Higuti wrote:

> Hello guys,
>
> Anybody have an idea of how i can let my servers with real ip's behind
> of my firewall running iptables?
> Use i forward?
> Can i do this?
>
> Cheers
>
> Stephan
>


