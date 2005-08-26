From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Limit
Date: Fri, 26 Aug 2005 16:33:47 -0500
Message-ID: <430F8ABB.4030904@riverviewtech.net>
References: <20050826145640.A122EA5CAC9@smtp.orbitel.bg>	<002d01c5aa7e$191a1c70$0300a8c0@office>	<430F842A.8060501@riverviewtech.net>
	<430F8983.5000006@lopsch.com>
	<Pine.LNX.4.62.0508261722430.14997@dgray-test.acs.internap.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.62.0508261722430.14997@dgray-test.acs.internap.com>
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

*nod*  You are quite correct sir.

iptables -t filter -A INPUT -i ${WAN} -d ${WANIPAddress} -p tcp --dport 3333 -m connlimit --connlimit-mask 0 --connlimit-above 10 -j DROP



Grant. . . .

Damon Gray wrote:
> 
> There is a way with connlimit to limit from all IPs, add a
> --connlimit-mask 0

