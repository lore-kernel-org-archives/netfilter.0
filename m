From: Raileanu Grigore <grisha@unixro.net>
Subject: Re: quick syntax query
Date: Mon, 7 Jun 2004 14:06:22 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040607140622.3a87f2ec.grisha@unixro.net>
References: <FDB52A0429DFD31196FB0008C7D972D51259E6CF@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D51259E6CF@OST_EXCH_USR5>
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

On Mon, 7 Jun 2004 11:53:10 +0100
"Knight, Steve" <Steve.Knight@bskyb.com> wrote:

> Hi there
> 
> Can one use syntax other than CIDR notation when defining things like
> networks?
> 
> i.e. it's common to see
> 
> LAN_RANGE="192.168.0.0/24"
> 
> in rule bases, but I would like to use
> 
> DODGY_RANGE="192.168.0.1-5"
> GOOD_RANGE="192.168.0.6-30"
> BAD_BAD_RANGE="192.168.31-40"
> 
> 
> a la `nmap` syntax.
> 
> Is this something netfilter can handle?
> 
> Thanks in advance
> 
> 
> Steve
> 

patch-o-matic iprange patch have this feature:

The base/iprange patch:
   Author: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
   Status: Works

   This patch makes possible to match source/destination IP
   addresses against inclusive IP address ranges.

   Examples.

   iptables -A FORWARD -m iprange --src-range 192.168.1.5-192.168.1.124 -j ACCEPT
   iptables -A FORWARD -m iprange --dst-range 10.0.0.0-10.5.255.255.255 -j ACCEPT

-- 
Best regards,
Raileanu Grigore
mail: grisha at unixro dot net
phone: +40 742759147

