From: rigoberto perez <rigo666beast@yahoo.com>
Subject: Problem with TCP connections
Date: Wed, 11 Jun 2008 13:49:41 -0700 (PDT)
Message-ID: <917672.36526.qm@web33207.mail.mud.yahoo.com>
Reply-To: rigo666beast@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

In a topology like:

windows1 ---  linux router1 --- linux router2 --- windows2

I have a netfilter module in every linux router with 3 hooks:

localin
localout
forward

and the module ipconntrack is loaded. In forward hook i change the outcoming
packets in this way:

padd 1 byte at the end of a packet
save the protocol of the ip header in the padded byte
modify the protocol in ip header by 250

When the forward hook receives an ip packet with the protocol 250 I do
the inverse function:

restore the original protocol
trim the last byte of the packet

This works OK for ICMP packets - even large packets to force fragmentation, but, When I use TCP the connections, for example FTP, - with packets of 1500 bytes - stops in the middle of the transfer.

If I change the MSS in the server to 1499 everything works OK but I dont want to do this, I wish resolve the problem in the router.

I need some help, thanks.


      
