From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: need assistence for PREROUTING
Date: Tue, 11 Jul 2006 01:49:41 +0200
Message-ID: <45246.7451607392$1152575430@news.gmane.org>
References: <200607110143.56894.fvgi242ss@wlanhacking.de>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200607110143.56894.fvgi242ss@wlanhacking.de>
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

>$IPTABLES -t nat -A PREROUTING -i $ETH -p tcp --sport 
>$UNPRIVPORTS --dport 4444 -d xxx.xxx.xxx.xxx -j DNAT --t
>o-destination 192.168.178.32

You need port here !!! --to-destination 192.168.178.32:80

Regards,

Edvin Seferovic


