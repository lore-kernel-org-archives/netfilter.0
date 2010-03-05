From: Mike Wright <mike.wright@mailinator.com>
Subject: Re: best approach for blocklist
Date: Fri, 05 Mar 2010 09:43:28 -0800
Message-ID: <4B9142C0.5010208@mailinator.com>
References: <4B912EA0.1060604@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B912EA0.1060604@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Dennis J." <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org

Dennis J. wrote:
> Hi,
> I'm wondering what the most efficient way to implement a blocklist is. 
> We are basically talking about blocking a few thousand IPs. Does 
> iptables do some internal optimizations when blocking based on a source 
> address or would it be better to, say, create a chain for each class A 
> net (e.g. 83.0.0.0/8) and then add the IPs in that range to that class 
> to make the matching more efficient?

Have you considered ipset?  I use it in various ways, sometimes to 
allow, sometimes to deny.  It supports IPs, NETs, ports, etc.
