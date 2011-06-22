From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: PCAP file to iptables
Date: Wed, 22 Jun 2011 19:29:13 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106221926460.26172@frira.zrqbmnf.qr>
References: <5e4fdd882f6b5694c776880f92c76cf0@cs.dal.ca>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5e4fdd882f6b5694c776880f92c76cf0@cs.dal.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrey <andrey@cs.dal.ca>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-06-22 18:38, andrey wrote:

> Hello,
>
> I would like to get traffic that was captured to iptables.
> I have tried tcpreplay, but tcpreplay cannot create traffic that is seen by
> iptables.
> Does anyone know how could I get data from a pcap file to iptables?

You already asked this -
http://marc.info/?l=netfilter&m=130832467126830&w=2

Because of that, receiver (logger) and sender (tcpreplay) need to work 
with two separate interfaces. You can realize that using real or virtual 
machines, or perhaps veth.ko.

