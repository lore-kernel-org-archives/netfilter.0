From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: MTU question
Date: Fri, 20 Apr 2012 10:15:19 -0600
Message-ID: <op.wc2nftsax1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

Hi,

I have a question about MTU.  Suppose my PC's Ethernet interface is configured at 1500 MTU, and it connects to a router interface configured to use 1492 MTU.

Suppose my PC needs to send packets to the router.  Given these MTU settings, which of these 2 is correct?

(a) my PC will only send 1492 byte packets maximum (because the destination interface is only 1492), or
(b) the PC will send packets up to 1500 bytes in size, but the router will split the packets before sending them on

I have been assuming (a) is correct.

Thanks in advance.

--
Lloyd
