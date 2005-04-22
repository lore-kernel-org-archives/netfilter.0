From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: ddos / no connection tracking / tarpitting
Date: Fri, 22 Apr 2005 01:52:09 -0500
Message-ID: <42689F19.5030709@riverviewtech.net>
References: <BAY104-F417A02D74275560AA714548B2D0@phx.gbl>	<42688A26.9000705@riverviewtech.net>
	<Pine.LNX.4.58.0504220847580.28527@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0504220847580.28527@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Vic N <vic778@hotmail.com>, netfilter@lists.netfilter.org

> You *must* use the rule
> 
> iptables -t raw -A PREROUTING -s 1.2.3.4 -p tcp --sport 5678 -j NOTRACK
> 
> as well, otherwise conntrack will pick up the reply packets from the
> TARPIT target.

Very good point.

