From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Need to remove 802.1Q tagging
Date: Fri, 7 Oct 2011 23:36:00 +0200
Message-ID: <20111007233600.50820c0b@catus>
References: <CAFcM1Eo0X77tfC4yYHjLPJs=xPGyrV-WUMnCnEWvbD2p5uW+9Q@mail.gmail.com>
	<20111007215212.68a88b56@catus>
	<CAFcM1Ep1KrqDbSZdJQhS4_69NYfAFd9C7MqNz+tzqg8j-pskxg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFcM1Ep1KrqDbSZdJQhS4_69NYfAFd9C7MqNz+tzqg8j-pskxg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

>Would the following work
>ebtables -A INPUT -i eth0.10 -o eth1 -j DROP    <-------- Block
>eth0.10 vlan from sending traffic to eth1
>ebtables -A INPUT -i eth0.+ -o eth1 -j DROP      <------ BLock all
>vlans from sending traffic to eth1

That was an error on my end. I should have written "You should probably
filter traffic on that bridge and allow ONLY eth0.x <-> eth1".

You can achieve this with following rule:

ebtables -A FORWARD -i eth0.+ -o eth0.+ -j DROP

Default policy is accept, so only specified traffic will be filtered.On

Best regards,
Marek Kierdelewicz
