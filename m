From: "Surabhi Goswami" <sgoswami@cdot.in>
Subject: ebtables for traffic shaping over bridge
Date: Mon, 1 Feb 2016 13:35:43 +0530
Message-ID: <20160201080522.M43813@cdot.in>
References: <20160201062759.M94060@cdot.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160201062759.M94060@cdot.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org



Hi,

I am using kernel version: 3.10.0 and ebtables v2.0.10-4, my laptop is connected to eth1
interface that is a part of the bridge and I wish to restrict traffic to my laptop,
can someone be so kind as to give me a set of commands to implement this as I am very
new to this field.
I have tried traffic shaping using TC by creating filter and then marking the packets
based on mac address, but this does not work in bridge mode.

Kindly tell me how to do this using ebtables with my interface eth1 in bridge mode.

Thanks in advance!

