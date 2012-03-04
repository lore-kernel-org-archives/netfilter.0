From: Kerin Millar <kerframil@gmail.com>
Subject: Re: Help tweaking asterisk rules
Date: Sun, 04 Mar 2012 04:39:32 +0000
Message-ID: <jiurm5$m0i$1@dough.gmane.org>
References: <450EB7580E6AE7469F8826BFBF09BAB6761D15@earwax.uent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <450EB7580E6AE7469F8826BFBF09BAB6761D15@earwax.uent.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 21/01/2011 02:05, Max DiOrio wrote:
> I was also hoping someone can provide some guidance on leaving the RTP
> ports UDP 10000:20000 open to all IP's on the WAN.  What type of
> security issue will this raise?  Should I install Fail2Ban in this
> setup?  The only issue I have with Fail2Ban was that it blocked my
> access from the LAN within 15 seconds of it coming online.

They needn't be open at all. Instead, load the the ip_conntrack_sip 
module and ensure that your iptables policy is stateful.

http://www.iptel.org/sipalg/

Using fail2ban carelessly might pave the way for remotely exploitable 
DoS attacks. Though it has its uses, I wouldn't generally recommend it.

http://www.ossec.net/main/attacking-log-analysis-tools

Cheers,

--Kerin

