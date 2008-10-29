From: Julien Vehent <julien@linuxwall.info>
Subject: Re: libpcap (tcpdump) and netfilter (iptables)
Date: Wed, 29 Oct 2008 15:00:55 +0100
Message-ID: <6a7a31ab262da35cf57c6c465226e977@localhost>
References: <49086324.9060900@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49086324.9060900@laposte.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre LEBRECH <pierre.lebrech@laposte.net>
Cc: netfilter@vger.kernel.org

Hi,

On Wed, 29 Oct 2008 14:20:36 +0100, Pierre LEBRECH
<pierre.lebrech@laposte.net> wrote:
> Hi,
> 
> It seems that even if I drop some INPUT packets with iptables, tcpdump
> still sees these packets arriving on the ethernet interface.
> 
> Could anybody explain me a bit about this?

The pcap driver catch the packet before it's processed by netfilter. 
This is a known issue that has even been used in a rootkit PoC to
communicate with the rootkit before the firewall drops the packet.


> 
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Regards,

Julien

-- 
www.linuxwall.info
