From: "Przemyslaw Wrzos" <przemyslaw.wrzos@calyptech.com>
Subject: Reinjecting packets to beginning of iptables
Date: Tue, 27 Apr 2010 12:16:36 +1000
Message-ID: <EE5E77B503DE9A478B63A89AAD2585ED087BA5@vpane.excalyptech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I would like to mark a packet in one of the iptables chains and then
force it to the beginning of iptables so it can be processed again and
goes through all the chains again (now also carrying the mark). I guess
this is similar to how tunneled packets are unwrapped and then sent to
the beginning again, although in my situation there is no unwrapping,
the packet would be sent back basically unaltered.

It wouldn't necessarily matter what interface the packet appears on the
second time so perhaps this could also be done with some kind of
simulated network interface? Kind of grasping at straws now.

Appreciate any ideas you guys come up with.
