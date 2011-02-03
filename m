From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: shaping vlans - revisited
Date: Thu, 3 Feb 2011 16:46:53 +0100
Message-ID: <20110203164653.1fbcb637@catus>
References: <20110203133811.3661ee5f@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110203133811.3661ee5f@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

>Hi All

Hi,

>I can see the counters increase (tc -s ...) for classid 1:2345 (eth0)
>but they are zero for classid 2:2345 (eth1 - which the vlans are
>attached in)

Are you seeing any traffic on root class on eth1? What's the output of
following commang:

tc -s -d class sh dev eth1|grep -A 5 'root'

best regards,
Marek Kierdelewicz
