From: Martijn Lievaart <m@rtij.nl>
Subject: Re: sub interface filtering
Date: Wed, 02 Apr 2003 21:20:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E8B37F3.2010801@rtij.nl>
References: <000b01c2f947$feb84a80$8b01a8c0@win2k.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000b01c2f947$feb84a80$8b01a8c0@win2k.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org

Mike wrote:

>but when I scan eth2:1 or eth2:2 from an outside machine I can see ALL the
>local services (ssh, ptptp,dns etc..) Is connection not passing the
>forwading chain?
>
>  
>

You obviously have the INPUT chain set to a policy of ACCEPT. All 
locally destined packets go through the INPUT chain, all forwarded 
packets go through the FORWARD chain. Add apropriate rules for the INPUT 
chain.

HTH,
Martijn Lievaart



