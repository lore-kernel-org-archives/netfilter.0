From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: ip forwarding issue with dual gateway
Date: Mon, 9 Nov 2009 09:01:02 +0100
Message-ID: <20091109090102.6508ed37@catlap>
References: <4AF4008C.8070204@infoservices.in>
	<4AF7882E.5090307@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF7882E.5090307@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

> Hello,

Hello Bakshi

> I have two lan cards in my server which is used to share internet
> connection with the help of iptables. The config is as below

Read the following paragraph of LARTC-howto: [1].

With your current iptables config it's enough to change default gateway
and you'll use another upstream link (for failover you can do it by
detecting gateway-down event with eg. apinger [2]). You can
do load-balancing with policy routing [1].

[1] http://lartc.org/howto/lartc.rpdb.htm
[2] http://apinger.jajcus.net/trac/

cheers,
Marek
