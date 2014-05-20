From: george Nopicture <mad-proffessor@hotmail.com>
Subject: ebtables vlan and pppoe filtering
Date: Tue, 20 May 2014 16:17:19 +0300
Message-ID: <BLU436-SMTP621BC84F58A3A332B784629F3D0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi. Is there a way i can filter pppoe payload? I saw some conversations
regarding ebt_ppp module on gmane but cant find the module. And i have
another question.
How can we filter vlan traffic since kernel has already stripped the
vlan header? I think ebtables is not seeing the vlan header at all.
Consider a scenario where the raw ethernet interface is added to the
bridge. How can i tell the kernel to not strip the header and let
ebtables decide what to do with the packet? I am aware that this
approach would reduce the overall network performance but is it doable?
