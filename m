From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: Does IPTables have a 1:1 port-forwarding capability for a DNAT
 port-range ?
Date: Fri, 13 Dec 2002 13:02:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF9CC70.3080603@istitutocolli.org>
References: <000601c2a23f$619ffef0$0100a8c0@zultys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000601c2a23f$619ffef0$0100a8c0@zultys.com>
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
To: netfilter@lists.netfilter.org

Ranjeet Shetye wrote:
> The reason for wanting a 1:1 rule is for X windows and other fat port
> ranges. Dont want hundreds of rules in there if one can do the job. Can
> IPTables do it ? If so how ? If not, I guess I'll have to get in touch
> with the developers for tips on a good starting point.

I believe that the only way is to hack nat code.
I will start looking in
net/ipv4/netfilter/ip_nat_core.c
and the function manip_pkt that, as far as I understand, is actually
writing the NATed packet
andrea


