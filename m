From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Limit
Date: Fri, 26 Aug 2005 16:05:46 -0500
Message-ID: <430F842A.8060501@riverviewtech.net>
References: <20050826145640.A122EA5CAC9@smtp.orbitel.bg>
	<002d01c5aa7e$191a1c70$0300a8c0@office>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002d01c5aa7e$191a1c70$0300a8c0@office>
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

Take a look at the connlimit match extension.

iptables -t filter -A INPUT -i ${WAN} -d ${WANIPAddress} -p tcp --dport 3333 -m connlimit --connlimit-above 10 -j DROP



Grant. . . .

Lyubomir Louisov wrote:
> So how can i limit the number of connections on port 3333 to no more than 10
> at a time with iptable?
> Is it posible?


