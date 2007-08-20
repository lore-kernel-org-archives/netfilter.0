From: Ruben Laban <r.laban@ism.nl>
Subject: Re: Port forwarding inside local domain
Date: Mon, 20 Aug 2007 16:34:31 +0200
Message-ID: <200708201634.31185.r.laban@ism.nl>
References: <20070820141102.GA19046@bart.bertram-scharpf.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070820141102.GA19046@bart.bertram-scharpf.homelinux.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Monday 20 August 2007, Bertram Scharpf wrote:
> Hi,
>
> just another question. Let my router be 192.168.7.33 with
> interfaces eth0 and ppp0; then this works perfectly here:
>
>   # iptables -t nat -A PREROUTING -i ppp+ -p tcp --dport 80 \
>       -j DNAT --to 192.168.7.49:80
>
> However, I want to request from inside my local domain the
> same way. This seems to end in a drop or an infinite loop:
>
>   # iptables -t nat -A PREROUTING -d 192.168.7.33 -p tcp --dport 80 \
>       -j DNAT --to 192.168.7.49:80
>
> Besides that I want to know what is going wrong here,

You need to 'fix' the reply traffic, by using a rule like:
  # iptables -t nat -A POSTROUTING -i eth0 -d 192.168.7.49 -p tcp --dport 80 \
       -j SNAT --to 192.168.7.33

With recent kernels this can be done more elegantly by using the conntrack 
module:
  # iptables -t nat -A POSTROUTING -d 192.168.7.49 -m conntrack --ctorigdst \
        192.168.7.49 -j SNAT --to 192.168.7.33

I never used the latter myself due to me working with older kernels mainly.

> I further would like to ask how I could debug this.

tcpdump and/or wireshark is/are your best friend(s).

HTH,
-- 
Ruben

