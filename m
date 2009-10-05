From: "Beyer, Philipp" <Philipp.Beyer@alliedvisiontec.com>
Subject: evaluating kernel-mode packet processing (netfilter target extension?)
Date: Mon, 5 Oct 2009 16:56:13 +0200
Message-ID: <96837AF99C543646B54E8DA1A0315D5677B183@ahr-mail.avtnet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'm doing preliminary evaluations, how one could write a cpu-friendly receiver for UDP packets arriving at high data rates, which may possibly saturate the bandwidth of a Gigabyte Ethernet port.

With some simplification, the payload of subsequent UDP packets needs to be assembled to bigger buffers. The existing Windows-based solution is realized as a NDIS filter driver, which processes and removes incoming packets and manages a set of buffers to forward data to user mode. Using a big enough packet size, this can also be done in user mode with bearable cpu-load. I'm also pretty sure that doing such things in kernel mode wouldn't earn the broadest acceptance from linux kernel programmers.

Nevertheless, I have the task to evaluate "how the linux-version of this driver would look like". I don't expect overwhelming help on projects like this from the linux community, so I'll try not to ask for long explanations. ;-)


My Questions:
- Thinking of the described NDIS filter driver ( processing and dropping packets, merging payload, moving big buffers to userland), what would be the best fitting equivalent in the linux world? As far as I have read, this could be a netfilter target extension. Would that work? Is there anything that keeps me from doing buffer-based data streaming to userland from inside a netfilter extension? Is there already some code doing anything like this?

- "My Packets" can easily identified by their destination port number, but this is only a temporary arrangement. Netfilter/iptable configurations are meant to be used for the long term. I'm afraid that customers will hate it when our application messes with their firewall rules. For me this starts looking like a bad hack here. From another point of view, I need something like a Layer-7 protocol module, where only Level-4 protocols are expected to be used. (I also caught a glimpse of l7-filter, which does not seem to fit my needs, unfortunately.)
This is a big topic I need to look further into by myself. But given the case it's obvious that all I can discover is a big 'No-Go', it would be great to get a hint.

- The big performance bottleneck for usermode processing is the rate of incoming packets. This is true for the given application as well as for any packet capturing solution I have found. But I may have overlooked something. Is there a packet capturing module working around this by combining several packets before calling user mode?

Thank You for Reading!

Philipp Beyer - Software Developer
---------------------///------------------------
Allied Vision Technologies GmbH www.alliedvisiontec.com 
branch office Ahrensburg - Klaus-Groth-Str. 1
22926 Ahrensburg - Germany
phone: +49 4102/6688-0 
President/CEO: Frank Grube; Amtsgericht Jena HRB 208962
headquarters: Taschenweg 2a, 07646 Stadtroda 
