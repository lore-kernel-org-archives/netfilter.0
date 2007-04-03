From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: Re: Iptables - Error: No chain/target/match by that name
Date: Tue, 03 Apr 2007 14:33:33 -0700
Message-ID: <4612C82D.9020109@mailinator.com>
References: <cdcab2540704031418m1c25bf55hbcfabf8340db546b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cdcab2540704031418m1c25bf55hbcfabf8340db546b@mail.gmail.com>
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
To: Rafael Dewes <rafael.dws@gmail.com>
Cc: netfilter@lists.netfilter.org

Rafael Dewes wrote:
> Friends, I am using iptables 1.5.7 + linux kernel 2.6.20.2 and the
> last patch-o-magic.
> 
> But, when I exec this rule
> iptables -I INPUT -s 192.168.0.0/24 -p tcp --dport 21 -j ACCEPT

Try this.

iptables -I INPUT -s 192.168.0.0/24 -p tcp -m tcp --dport 21 -j ACCEPT

Many of these types of filters can be found in the man page.  Look for 
MATCH EXTENSIONS.

hth, :m)

