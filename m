From: "Wallwork, Nathan" <nwallwo@pnm.com>
Subject: Re: Need help have some questions...
Date: Mon, 18 Aug 2003 14:53:25 -0600 (MDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308181429300.19455-100000@nwallwo-linux.corp.pnm.com>
References: <20030818201333.57194.qmail@web40202.mail.yahoo.com>
Reply-To: "Wallwork, Nathan" <nwallwo@pnm.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030818201333.57194.qmail@web40202.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SBlaze <dagent.geo@yahoo.com>
Cc: nf <netfilter@lists.netfilter.org>

On Mon, 18 Aug 2003, SBlaze wrote:
> How am I supposed to proxy apache? Why should I have to? Is it not a firewalls
> job to protect a system(and LAN behind it)? This is a very valid form of
> protection I'm asking for here.

You are asking for a different sort of protection than what firewalls are 
generally expected to provide.


> Anyone who runs apache and logs(which is EVERYONE who runs apache unless they
> are brain dead or don't care about security) is constantly BOMBARDED DAILY with
> CODE/RED and NIMDA(and I'm sure other types of invalid requests they would like
> to protect against).

Yeah, so what?  Apache can handle that.  You can configure Apache to discard 
those requests without filling up your log files, if that's the concern.
You can run a proxy to deal with it.  You have plenty of options.


>   If this can not be done I would love for someone to give me a half technical
> half lamen's terms explanation. I honestly don't think I'm asking so much of
> the  iptables firewall that I should have to go proxying things and
> circumventing things here and there.

Rejecting packets based on source or destination or port number or a number of 
other things is easy.  Building an awareness of the HTTP protocol into the 
kernel modules so that netfilter can parse an HTTP conversation isn't 
appropriate.  Inspecting lots of packets is better handled outside the kernel.

IP, TCP, UDP, and ICMP are all low-level protcols. 

HTTP is a high-level protocol.

Rejecting based on content is more appropriately handled by a user-level tool 
which is designed to handle the specific user-level protocol involved, in this
case an HTTP proxy would be a good choice.



