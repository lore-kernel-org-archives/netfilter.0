From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 22:36:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920213602.TMJS295.mta06-svc.ntlworld.com@there>
References: <000a01c260e8$91e2bc30$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c260e8$91e2bc30$0801a8c0@s3ac>
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
To: netfilter@lists.netfilter.org

On Friday 20 September 2002 9:59 pm, Rowan Reid wrote:

> > don't understand
> > why it would be picked up by a rule in your INPUT chain,
> > because this
>
> I should have mentioned the internal machine is masquaraded. Therefore
> It should go to the input chain no ?

The INPUT chain is for packets addressed to the firewall itself.

The FORWARD chain is for packets going through the firewall to some other 
machine.

Destination NAT is performed in the PREROUTING chain, which comes before 
either INPUT or FORWARD, therefore it is the "real" destination which 
determines whether a packet traverses the INPUT or the FORWARD chain.

Antony.

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III

