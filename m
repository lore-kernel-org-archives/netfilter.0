From: Stuart Clark <stoodio@gmail.com>
Subject: connlimit and LVS
Date: Wed, 25 Aug 2004 08:31:28 +1000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <f3204f9a040824153160dbb46f@mail.gmail.com>
References: <f3204f9a04082400405a81100c@mail.gmail.com>
Reply-To: Stuart Clark <stoodio@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f3204f9a04082400405a81100c@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi there..

I have a LVS setup with two directors direct routing to 4 real
servers. I have been trying to use the 'connlimit' patch from
Netfilter patch-o-matic on the director to restrict the number of
concurrent connections coming into the VIP.  I have not been able to
get it working with the PREROUTING or FORWARD tables, and was
wondering if is due to LVS that connlimit can not seem to track
connections?

I have tried this on kernel 2.4.27/ipvs1.0.11 and kernel 2.6.7/ipvs1.2
using the patch-o-matic from CVS at www.netfilter-org.  I can see that
connections directed at the director IP are being detected with
connlimit, but connections passing through the VIP to the real servers
are not.

iptables -t nat -I PREROUTING -p tcp --syn --dport 25 -m connlimit
--connlimit-above 2 --connlimit-mask 24 -j LOG --log-level info
--log-prefix " 2+ SMTP connections "

Any ideas how this can be made to work on the directors?

Kind regards, Stuart.

