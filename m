From: Tim Cronin <tim@13-colonies.com>
Subject: RE: iptables and linuxVirtualServer
Date: Fri, 4 Oct 2002 10:52:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <71FD63241A2DD511AFED00010236A4B33224CB@LIVAUDAIS>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: 'Roberto Nibali' <ratz@tac.ch>, "'lvs-users@LinuxVirtualServer.org'" <lvs-users@LinuxVirtualServer.org>
Cc: "'Walther@gehag-dsk.de'" <Walther@gehag-dsk.de>, netfilter@lists.netfilter.org

>Yes, you're right and I was wrong redirecting you to the netfilter
mailinglist. 
>We will solve it on the LVS mailinglist and if there are problems with
netfilter 
>we will come back, ok?

Hey no problem, I must say that this is the most cordial and helpful
mailing list I've been on. Thanks to everyone for your help. LVS has all
ready
saved me much time and money.

>Yes, it is clearly the NF_STOLEN interaction of LVS in the NAT part of the
code.

this sounds like I might have opened a can of worms. :^D 

should/can lvs and iptables both track state, what would be the impact of
that?


-----Original Message-----
From: Roberto Nibali [mailto:ratz@tac.ch]
Sent: Friday, October 04, 2002 4:18 AM
To: Tim Cronin
Cc: 'Walther@gehag-dsk.de'; netfilter@lists.netfilter.org
Subject: Re: iptables and linuxVirtualServer


Hi,

Tim Cronin wrote:
> yup, I've checked the packet exchange for a single page request.
> 
> the problem is that since lvs is handling the NAT for http
> iptables doesn't look like it's tracking state.

Yes, you're right and I was wrong redirecting you to the netfilter
mailinglist. 
We will solve it on the LVS mailinglist and if there are problems with
netfilter 
we will come back, ok?

> if I let iptables handle nat to the web server the line below
> works.

Yes, it is clearly the NF_STOLEN interaction of LVS in the NAT part of the
code.

Sorry for the confusion I created,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' |
dc

