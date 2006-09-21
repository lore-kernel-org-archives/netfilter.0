From: "Mr. Ritter" <netfilter@candlefire.org>
Subject: Re: Port forwarding question
Date: Thu, 21 Sep 2006 14:32:20 -0600
Message-ID: <4512F6D4.4060003@candlefire.org>
References: <200609211555.39634.dyioulos@firstbhph.com>
	<4512F520.6010104@candlefire.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4512F520.6010104@candlefire.org>
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
To: netfilter@lists.netfilter.org

Mr Ritter wrote:
> iptables -t filter -A INETIN -d 192.168.100.46 -p tcp --dport 4000 -j
> ACCEPT

Doh!  INETIN is one of my tables, meant to say:
iptables -t filter -A FORWARD -d 192.168.100.46 -p tcp --dport 4000 -j
ACCEPT


