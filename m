From: Steven Kath <steven.kath@vyatta.com>
Subject: Re: MTU question
Date: Fri, 20 Apr 2012 10:41:35 -0700 (PDT)
Message-ID: <8c68fbf7-2fa0-468d-86eb-bdd87619974e@tahiti.vyatta.com>
References: <op.wc2nftsax1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.wc2nftsax1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

> I have a question about MTU.  Suppose my PC's Ethernet interface is
> configured at 1500 MTU, and it connects to a router interface
> configured to use 1492 MTU.
> 
> Suppose my PC needs to send packets to the router.  Given these MTU
> settings, which of these 2 is correct?
> 
> (a) my PC will only send 1492 byte packets maximum (because the
> destination interface is only 1492), or
> (b) the PC will send packets up to 1500 bytes in size, but the router
> will split the packets before sending them on
> 
> I have been assuming (a) is correct.

I'm assuming you mean 1492 is the MTU of the interface on the 
router facing the remote endpoint.  The MTU of the interface 
facing your PC is not directly relevant to your question.  

The answer depends on whether Path MTU discovery (RFC 1191) is 
enabled on the transmitting host.

Without PMTUD, sender has no information about what MTUs are 
in use on remote devices, and the behavior is usually (b). 

With PMTUD, the behavior is as described in RFC 1191. 
