From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: mac filtering
Date: Wed, 21 Apr 2010 07:54:50 +0200
Message-ID: <20100421075450.4846e566@catlap>
References: <l2wcfeab66d1004202055jab9b6853ue6b9e80d5da93dc0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <l2wcfeab66d1004202055jab9b6853ue6b9e80d5da93dc0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

> 
>I have a client machine (say A ) connectected to a linux router . I
>can browse internet without any problem .
>In router , i can configure  MAC address filters . If i configure A's
>mac address should be disabled , A cannot access Router itself ? .
>Question : What exactly mac address filter mean ?  disabling router
>access or disabling internet access ?

If you add following rule you'll block access to internet, not to
router:
iptables -A FORWARD -j DROP -m mac --mac --mac-source xx:xx:xx:xx:xx:xx

This rule will block access to the router without affecting access to
internet:
iptables -A INPUT -j DROP -m mac --mac --mac-source xx:xx:xx:xx:xx:xx

You can find nice diagram representing packet flow in netfilter here
(focus on green background if you're only routing, not bridgeing):
http://www.imagestream.com/~josh/PacketFlow.gif

Best regards,
Marek
