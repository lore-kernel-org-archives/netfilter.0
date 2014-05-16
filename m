From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: randomly SNATed devices after reboot
Date: Fri, 16 May 2014 10:27:25 +0530
Message-ID: <53759AB5.6050101@atc.tcs.com>
References: <20140515104238.26ce6626@pulsar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140515104238.26ce6626@pulsar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

On 05/15/2014 07:12 PM, Ethy H. Brito wrote:
> Hi All
>
> I have this setup in which there are lots of static IPs "SNATed" IP-Phones
> behind a Linux machine. A very simply NAT machine. Just one SNAT rule for the
> phones' network.
>
> At every Linux machine reboot, some of those phones, randomly, simply does not
> register at some outside-nat SIP server.
>
> Investigating with tcpdump I can see, at the external interface, "not snated"
> packets from those not registered phones. Packets from the other phones are
> correctly "snatted".

May be, some phones are trying to register via ESTABLISHED connections 
which not getting SNATed. So, the registration fails.

Since the Linux machine is rebooted, there won't be any connection 
tracking information about the established connections, which is 
required for NAT to work properly.

> Rebooting the Linux machine scatters this behavior among the phones: some are
> randomly registered and some not. Rebooting the phone, and just the phone
> itself, does not change anything.

Hmm... I thought, after rebooting the Linux machine, rebooting the 
problematic phones would help solving the problem. Because, this way the 
phones try to register through a NEW connection (instead of an 
ESTABLISHED one) and the SNAT can be done properly.

Apart from that, just see whether STUN can help to improve your 
situation <http://kb.smartvox.co.uk/voip-sip/sip-devices-nat/>.


Regards,
Vignesh

> Some background I think relevant:
>
> 	1) The Linux ip address is added (one interface, two IPs in two
> 	different nets) further during boot, at rc.local, immediately before
> 	the SNAT rule; No NAT rule was added up to this point.
>
> 	2) if I change the ip address, under the same netmask, of any
> 	non-registered phone, it registers immediately; But this does not assure
> 	it will register again after a new Linux reboot. In fact it may not
> 	register again after that. Already happened.
>
> 	3) All IP-Phones have "keep alive SIP connection" active.
>
> I have a suspicious about what is going on: some race condition.
> But I'd like your thoughts.
>
> Thanx in advance
>
> Regards
>
> Ethy
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

