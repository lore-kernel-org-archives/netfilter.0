From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 13:59:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c260e8$91e2bc30$0801a8c0@s3ac>
References: <20020920190549.NZVO16609.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20020920190549.NZVO16609.mta05-svc.ntlworld.com@there>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

 your firewall on eth1, however what I 
> don't understand 
> it why it would be picked up by a rule in your INPUT chain, 
> because this 


I should have mentioned the internal machine is masquaraded. Therefore
It should go to the input chain no ?


> packet is not destined for the firewall itself - it is 
> destined for machine 
> 216.99.233.76 chimmx04.algx.net, and should therefore be 
> passing through your 
> FORWARD chain (even if it does come in and go out the same 
> interface, it'll 
> still go through the FORWARD chain).


