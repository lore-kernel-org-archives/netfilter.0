From: Kerin Millar <kerframil@gmail.com>
Subject: Re: Help tweaking asterisk rules
Date: Sun, 04 Mar 2012 07:25:56 +0000
Message-ID: <jiv5e5$98q$1@dough.gmane.org>
References: <450EB7580E6AE7469F8826BFBF09BAB6761D15@earwax.uent.com> <jiurm5$m0i$1@dough.gmane.org> <alpine.LNX.2.01.1203040810190.1405@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1203040810190.1405@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 04/03/2012 07:10, Jan Engelhardt wrote:
 > On Sunday 2012-03-04 05:39, Kerin Millar wrote:
 >
 >> On 21/01/2011 02:05, Max DiOrio wrote:
 >>> I was also hoping someone can provide some guidance on leaving the RTP
 >>> ports UDP 10000:20000 open to all IP's on the WAN.  What type of
 >>> security issue will this raise?  Should I install Fail2Ban in this
 >>> setup?  The only issue I have with Fail2Ban was that it blocked my
 >>> access from the LAN within 15 seconds of it coming online.
 >>
 >> They needn't be open at all. Instead, load the the ip_conntrack_sip 
module and
 >> ensure that your iptables policy is stateful.
 >>
 >> http://www.iptel.org/sipalg/
 >
 > This is all outdated material. It's nf_conntrack_sip and has been long
 > merged into the kernel already.

I am aware that it exists in the mainline kernel. Thank you for pointing 
out that I got the name wrong. I managed asterisk in my prior job and 
did actually use nf_conntrack_sip so I should have recalled the 
distinction. Nevertheless, I think that the page still serves as a 
useful intro to those unfamiliar with the sip connection tracking 
module. At least, it did for me when I was facing the same issue as how 
to gracefully handle SIP.

Cheers,

--Kerin

