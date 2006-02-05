From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: I want to understand the concept
Date: Sun, 5 Feb 2006 18:37:54 +0100
Message-ID: <002a01c62a7a$e595bc10$0101000a@sterenborg.info>
References: <200602051604.57783.kyf@arterm.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602051604.57783.kyf@arterm.pl>
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
To: Netfilter <netfilter@lists.netfilter.org>

>> You SHOULD NOT FILTER in tables other than the filter table (the
>> first rule). 
> 
>> Using the mangle table you can alter packets in the FORWARD chain.
>> In the filter table you cannot.
>> In the mangle table you can filter packets, but you SHOUD NOT.
> 
> Why one SHOULD NOT filter in the mangle chain? Are there any
> philosophical reasons? Is it a sin? Does it make kernel angry? :->
> Performance? 

Yes, it will make your kernel yell at you, crash and then go up in
flames. ;^P

No, seriously, some people think otherwise because they haven't had
problems (yet), but if you're going to filter in the nat or mangle table
you may get unexpected results that would not have happened if you
filtered in the filter table.
When questions like these are asked I'd say that the OP doesn't really
know what's going on regarding packet-flow and should stick to filtering
in the filter chain. That's what that table is for.


Gr,
Rob


