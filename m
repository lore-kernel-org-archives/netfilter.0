From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: why can't I DNAT SIP?
Date: Sat, 10 May 2008 10:43:55 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805101041210.19952@fbirervta.pbzchgretzou.qr>
References: <fvtjuu$7i1$1@ger.gmane.org> <48235501.4030608@riverviewtech.net>  <fvvuil$ldh$1@ger.gmane.org> <48245C6B.1090506@riverviewtech.net>  <48245E7E.8080206@trash.net> <c195ebf70805091904w5b728e5gbe0a57ed16b0516@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c195ebf70805091904w5b728e5gbe0a57ed16b0516@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sean darcy <seandarcy2@gmail.com>
Cc: Patrick McHardy <kaber@trash.net>, Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>


On Saturday 2008-05-10 04:04, sean darcy wrote:
>>
>> - What helpers are loaded (both NAT and conntrack)
>
>?? How would I find out? If you mean modules:
>
>lsmod | grep nat
>iptable_nat            11461  1
>nf_nat                 22381  1 iptable_nat
>nf_conntrack_ipv4      21837  5 iptable_nat
>nf_conntrack           64585  4 xt_state,iptable_nat,nf_nat,nf_conntrack_ipv4
>nfnetlink               9945  3 nf_nat,nf_conntrack_ipv4,nf_conntrack
>ip_tables              16517  3 iptable_raw,iptable_nat,iptable_filter
>x_tables               18629  5 xt_state,ipt_LOG,xt_tcpudp,iptable_nat,ip_tables

I would have expected to find nf_nat_sip here.
