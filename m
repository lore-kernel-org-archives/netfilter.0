From: kannel sms <kannel_sms@yahoo.com>
Subject: RE: DHCP /MAC
Date: Sat, 8 Nov 2003 05:14:40 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031108131440.92567.qmail@web60208.mail.yahoo.com>
References: <20031108120948.3F1B793E0@sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031108120948.3F1B793E0@sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org


That Transmission part is ok . what i'm doing is
assining a ip via dhcp server . but there must be the
firewall to block the unknown MAC . 
I don't try to block MAC addresses via DHCP . because
those assigning ips will not be the fixed for the
users. 
so overcome that problem i'm trying to use a iptables
firewall. 

Actually i'm new to iptables . i don't have exact idea
of how to block unknown MACs and allow trusted MACs.

so actually this is the thing that i want to do .
pls ...........can u knidly help me 



thanx 

--- Rob Sterenborg <rob@sterenborg.info> wrote:
> > I still find it hard to believe that your modem
> users have 
> > MAC addresses - all dialup systems I have seen use
> PPP Point 
> > to Point Protocol and there is no MAC address
> identifying the 
> > remote system.
> 
> I agree to this part, but he was talking about
> dialup/cable access.
> When I had cable access from Chello/UPC I had a
> LanCity modem and it
> actually had a MAC address. (Which could be abused
> to get higher up/down
> bandwith.)
> 
> 
> Gr,
> Rob
> 
> 


__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

