From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this config OK, plus where should I be logging...
Date: Mon, 5 Apr 2004 10:11:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404051011.16437.Antony@Soft-Solutions.co.uk>
References: <000001c41ad1$692d25b0$0464a8c0@stu>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c41ad1$692d25b0$0464a8c0@stu>
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

On Monday 05 April 2004 6:46 am, Stuart Lamble wrote:

> Thanks for your reply, it has me thinking here.
>
> I agree, running local services on a firewall is asking for it,
> especially with SMTP.
> I think what I need to do is add a third network card to the firewall
> and create a DMZ, probably safer than dnat-ing to these services on the
> LAN, such as SMTP server on the LAN.

Yes; if you DNAT external IPs to an internal LAN address, and then someone 
finds out how to exploit your mail server, your LAN is wide open to them.

If you place the mail server on a DMZ, it should have very restricted access 
to your LAN (if any), so someone who gets into your mail server has your mail 
server and nothing else.

> That will add some extra rules to the firewall, but at least now it will
> be a pure netfilter machine ;-)
> I will probably just open UDP 53,TCP 80 and FTP for the purposes of
> connecting to the net and running updates from the firewall itself.
> I may also want ssh, so I can admin from the internet, but then I could
> always ssh to the DMZ and then ssh from there to the firewall, probably
> safer.

The more hoops a cracker has to go through to get at something valuable, the 
less likely it is they'll succeed.

> Just a few questions on your reply below?
> On the "-t nat" table , PREROUTING, OUTPUT and POSTROUTING is -P ACCEPT.
> Good or bad

Absolutely vital.   *Always* leave nat tables with ACCEPT policies.   All 
sorts of nasty and incomprehensible things will happen if you set default 
DROP policy on a nat table :)

> Also, I currently have an eth0 which is the Un-trusted interface
> connecting to my DSL modem.
> I have eth1 which is my trusted LAN and ppp0, which is the virtual
> interface that comes up when the DSL line is up, pritty much 24/7.
> However, I base my rules on ppp0 as the un-trusted interface and not
> eth0, in fact in a previous email, you asked where is eth0? What should
> I do here?

To be honest I'm not sure - I'm not familiar with that arrangement.   I use 
DSL, however I have an ethernet cable between my firewall and my DSL modem 
and I talk pure IP/ethernet over that - no PPP involved anywhere.   Maybe 
someone else can suggest how you should deal with this.

> What is the very first table that a packet will "touch" as it comes into
> the firewall? PREROUTING or INPUT?
> I believe it will be PREROUTING, as a packet may be destined for another
> machine on the network, dnat...

Exactly.   It has to be PREROUTING (think about the name) because the next 
step is the routing decision and the selection of whether the packet is going 
to enter INPUT or FORWARD....

> So, should this table be not be the most "looked after" as so to speak,
> followed by the FORWARD table?

You should not put filtering (DROP, REJECT) rules in your nat tables, 
therefore place whatever DNAT rules you need in PREROUTING, but put your 
security effort into INPUT and FORWARD.

> Especially if we have a DMZ, where we are PREROUTING most services to
> that interface, and almost nothing will be for INPUT as no services will
> be running on the firewall itself, except for ssh????

Remember the DMZ services will still go through FORWARD - that is where you 
should be selective about what you allow and in which direction/s.

> For your time, it is truly appreciated.

Thank you.   Glad you found the mailing list useful.

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


