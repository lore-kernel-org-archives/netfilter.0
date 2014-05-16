From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: randomly SNATed devices after reboot
Date: Fri, 16 May 2014 12:59:59 -0300
Message-ID: <20140516125959.5842d3ef@pulsar>
References: <20140515104238.26ce6626@pulsar>
	<53759AB5.6050101@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53759AB5.6050101@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: netfilter@vger.kernel.org

> > Investigating with tcpdump I can see, at the external interface, "not
> > snated" packets from those not registered phones. Packets from the other
> > phones are correctly "snatted".
> 
> May be, some phones are trying to register via ESTABLISHED connections 
> which not getting SNATed. So, the registration fails.

That is not exactly the case. They are trying to register via UNREPLIED
connections.

The working phones, they all have ASSURED connections.

> 
> Since the Linux machine is rebooted, there won't be any connection 
> tracking information about the established connections, which is 
> required for NAT to work properly.
> 
> > Rebooting the Linux machine scatters this behavior among the phones: some
> > are randomly registered and some not. Rebooting the phone, and just the
> > phone itself, does not change anything.
> 
> Hmm... I thought, after rebooting the Linux machine, rebooting the 
> problematic phones would help solving the problem. Because, this way the 
> phones try to register through a NEW connection (instead of an 
> ESTABLISHED one) and the SNAT can be done properly.

Ok, these are UDP SIP connections, so "ESTABLISHED" do not apply. I think.

> 
> Apart from that, just see whether STUN can help to improve your 
> situation <http://kb.smartvox.co.uk/voip-sip/sip-devices-nat/>.

STUN won't help.
This is what I think the problem is:
	1) the phones keep sending "keep alive" messages or REGISTER
	requisitions once every few seconds.

	2) during Linux reboot some of these reqs, hit conntrack BEFORE snat is
	alive, creating a wrong tuple at conntrack table.

	3) some phones send requisition AFTER snat is up. And thus I have the
	erratic "registered/not-registered" behavior.

Since conntrack "sees" a packet before snat is in place, it follows bypassing NAT
table with the "wrong" tuple.

What I did to "resolve" this? 
	"conntrack -D" (just after snat rule!)

Question one:
	Is my reasoning correct?
Question two:
	Is this the correct solution? I don't think so.

Any thoughts? Anyone?

Regards

Ethy

 
> 
> Regards,
> Vignesh
> 
> > Some background I think relevant:
> >
> > 	1) The Linux ip address is added (one interface, two IPs in two
> > 	different nets) further during boot, at rc.local, immediately before
> > 	the SNAT rule; No NAT rule was added up to this point.
> >
> > 	2) if I change the ip address, under the same netmask, of any
> > 	non-registered phone, it registers immediately; But this does not
> > assure it will register again after a new Linux reboot. In fact it may not
> > 	register again after that. Already happened.
> >
> > 	3) All IP-Phones have "keep alive SIP connection" active.
> >
> > I have a suspicious about what is going on: some race condition.
> > But I'd like your thoughts.
> >
> > Thanx in advance
> >
> > Regards
> >
> > Ethy
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> 


-- 

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \ 
 
PGP key: http://www.inexo.com.br/~ethy/0xC3F222A0.asc
