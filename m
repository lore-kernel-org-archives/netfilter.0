From: Michael Gale <mgale@utilitran.com>
Subject: Re: default policies for the NAT chains
Date: Wed, 3 Dec 2003 07:58:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031203075821.2c4301eb.mgale@utilitran.com>
References: <20031202180302.32601c1d.mgale@utilitran.com>
	<025c01c3b94c$7eaa9f30$73593a42@drbroyles.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <025c01c3b94c$7eaa9f30$73593a42@drbroyles.com>
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

Hello,

	Thank you for your response, you did answer my question.

Michael.


On Tue, 2 Dec 2003 22:21:08 -0500
<netfilter@drbroyles.com> wrote:

> > So my question is do I need default policies for the NAT chains ?
> 
> Michael, it is not necessary for you to specify default policies for the NAT
> table chains, as dealing with the packets when they get to the FILTER table
> chains will be sufficient.  To illustrate my point, look at figure 3b in the
> following document ...
> http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html#section3
> The arrow to the extreme left pointing up is where a packet would "enter"
> your server from the outside.  No matter which path it takes till it gets to
> the "down" arrow at the extreme right, it will pass through either the
> INPUT, OUTPUT, or FORWARD chains of the FILTER table.  Also, any packets
> destined for your server will hit the INPUT chain first, giving you the
> opportunity to deal with them.  So if you don't specifically have an accept
> rule defined in the chains of your FILTER table, then packets you haven't
> intended to ACCEPT/DROP/"whatever" will be dropped before they either exit
> or pass through your server.
> 
> I hope this answers your question,
> Brandon Broyles
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

