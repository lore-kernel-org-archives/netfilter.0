From: hclfm@pricol.co.in
Subject: Re: Newbie: need help with table rules
Date: Fri, 14 Feb 2003 16:55:22 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFBADBE506.8D6B86F6-ON65256CCD.003E70D0@pricol.co.in>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Cc: Eugene Joubert <eugenej@centratel.co.za>, netfilter@lists.netfilter.org, netfilter-admin@lists.netfilter.org


Hi,

Modify stateful rule like this.

$IPT -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Hope your problem is solved.

regards,

U.SivaKumar


