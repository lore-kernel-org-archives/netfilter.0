From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: IPtables l7 string
Date: Thu, 12 Apr 2007 14:54:35 +0200
Message-ID: <461E2C0B.3000805@netfilter.org>
References: <3da957060704112139i476fcbc1q1d22c698e538514a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3da957060704112139i476fcbc1q1d22c698e538514a@mail.gmail.com>
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

Stephan Higuti wrote:
> Hello, anybody can help me with this:
> 
> osiris:~# iptables -t filter -A FORWARD -m string --string "orkut" -j DROP
> iptables v1.3.4: STRING match: You must specify `--algo'
> Try `iptables -h' or 'iptables --help' for more information.
> 
> --algo?
> 
> What's?

$ man iptables

--algo bm|kmp
Select the pattern matching strategy. (bm = Boyer-Moore, kmp = 
Knuth-Pratt-Morris)

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of 
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

