From: Kiran Kumar <immidi_kiran@yahoo.com>
Subject: Re: NF_IP_LOCAL_OUT
Date: Wed, 28 Apr 2004 20:24:46 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040429032446.85818.qmail@web14002.mail.yahoo.com>
References: <OF596492DE.CDD1ECA3-ON65256E83.00377D3E@hss.hns.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF596492DE.CDD1ECA3-ON65256E83.00377D3E@hss.hns.com>
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
Content-Transfer-Encoding: 7bit
To: aksingh@hss.hns.com, netfilter@lists.netfilter.org

--- aksingh@hss.hns.com wrote:

>   I have a doubt regarding the NF_IP_LOCAL_OUT hook,
> suppose i use libnet
> to inject some packets into the kernel ..... the
> dest ip address of this
> packet is my own linux box( the same box that is
> injecting those packet).
> Now, the netfilter NF_IP_LOCAL_OUT hook catches
> those packets, and the
> routing decision is taken after this hook is passed,
> what happens after
> this, since these packets are destined to this
> machine, do these packets go
> to the wire then again the ethernet card of this
> machine catches these

  No, packets destined to the local machine do not go
on to the wire.

> packets (i.e a new sk_buff is again assigned for
> them etc) or do they
> retain their old sk_buff and are directly sent to
> the application waiting
> for them ?

> ip_packet(dest add==ip addr of this machine) ---->
> NF_IP_LOCAL_OUT hook
> --->routing decision --> wire(old sk_buff freed) -->
> ethernet card ---> new
> sk_buff ---> NF_IP_PRE_ROUTING hook ---> application
> on this machine
> waiting for this packet.(as part of this new
> sk_buff)

  surely not this.

> 
> or,
> 
> ip_packet(dest add==ip addr of this machine) ---->
> NF_IP_LOCAL_OUT hook
> --->routing decision -->application on this machine
> waiting for this packet
> (as part of its old sk_buff itself)

  I am not sure of the sk_buff, but the packet gets
looped back, so this is atleast partially right.

=====
Regards,
Kiran Kumar Immidi


	
		
__________________________________
Do you Yahoo!?
Win a $20,000 Career Makeover at Yahoo! HotJobs  
http://hotjobs.sweepstakes.yahoo.com/careermakeover 

