From: Julien Vehent <julien@linuxwall.info>
Subject: Re: libpcap (tcpdump) and netfilter (iptables)
Date: Wed, 29 Oct 2008 17:02:28 +0100
Message-ID: <c7838e4a50bbfe5ac41d4da6f1fec20b@localhost>
References: <49086324.9060900@laposte.net> <6a7a31ab262da35cf57c6c465226e977@localhost> <1225293085.13500.5.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1225293085.13500.5.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Wed, 29 Oct 2008 16:11:25 +0100, Thomas Jacob <jacob@internet24.de>
wrote:
> On Wed, 2008-10-29 at 15:00 +0100, Julien Vehent wrote:
>> Hi,
>> 
>> On Wed, 29 Oct 2008 14:20:36 +0100, Pierre LEBRECH
>> <pierre.lebrech@laposte.net> wrote:
>> > Hi,
>> > 
>> > It seems that even if I drop some INPUT packets with iptables, tcpdump
>> > still sees these packets arriving on the ethernet interface.
>> > 
>> > Could anybody explain me a bit about this?
>> 
>> The pcap driver catch the packet before it's processed by netfilter. 
>> This is a known issue that has even been used in a rootkit PoC to
>> communicate with the rootkit before the firewall drops the packet.
> 
> You may call it a "known issue", I'd called a very useful
> and desirable feature for debugging network packet filters.
> 
> If you want to protect your machine against this issue, you
> could simply disable  packet sockets, couldn't you?

This is right, "issue" may not be the right term to use here...
Let's call it a "poorly documented feature". And in the case an attacker
has access to the root, the pcap lib should be the least of your
preoccupations...

Considering pcap is never install on production machines (at least, where I
work), I never had to worry about this. :)



> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
-- 
www.linuxwall.info
