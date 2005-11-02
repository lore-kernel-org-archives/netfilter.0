From: Philip Craig <philipc@snapgear.com>
Subject: Re: PPTP connection attempts fail with ip_nat_pptp loaded
Date: Wed, 02 Nov 2005 17:44:18 +1000
Message-ID: <43686E52.5060705@snapgear.com>
References: <dk9kdc$k5j$1@sea.gmane.org> <43686128.9050003@snapgear.com>
	<436866C5.3010104@quo.to>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <436866C5.3010104@quo.to>
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
To: Jordan Russell <jr-list-2005@quo.to>
Cc: netfilter@lists.netfilter.org

On 11/02/2005 05:12 PM, Jordan Russell wrote:
> Sure. What command should I use to do that?

tethereal -w dumpfile -s 1500 -ni eth1 host pptp-server

