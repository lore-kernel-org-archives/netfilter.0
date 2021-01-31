From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: FTP behind NAT on a non-standard port
Date: Sun, 31 Jan 2021 12:21:43 -0500
Message-ID: <818dc3cd-38b9-c21d-6297-30028d87d8f8@fhmtech.com>
References: <1158703871.20210131190917@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=tuzeLj69Owf6/DNt7a025qcPo/4Qlci9z+7uO/QkGLA=;
        b=bs6DPtDWoUx1fJq4jAYq3nyJJdONarv03fsdGbYgYJMGVnKobRgXoveOw4Jz3bopwVNVBqjgp9zReYDlVfts/eKFwpkSwLO9d516Dh46d6Z+oof3oaUtuUHxPY9glIxnUxkfFTc7wpLipRBN2ZDUKCq8sNXSRNMzmbpe+/EWLqQ=;
In-Reply-To: <1158703871.20210131190917@gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: mikhalich123 <mikhalich123@gmail.com>, netfilter@vger.kernel.org

On 2021/01/31 11:09, mikhalich123 wrote:
> Hello
> 
> Gateway to Debian 7.11 (3.2.0-4-686-pae), iptables v1.4.14.
> 
> external interface ip: 1.1.1.1
> 
> internal interface ip: 192.168.1.1
> 
> An ftp server works inside the local network, for which you need to organize access from the outside.
> 
> ip ftp server on the internal network: 192.168.1.55
> 
> Port of ftp server on internal network: 51
> 
> Lsmod output | grep ftp
> 
> nf_nat_ftp 12 420 0
> nf_conntrack_ftp 12533 ​​2 nf_nat_ftp
> nf_nat 17913 2 iptable_nat, nf_nat_ftp
> nf_conntrack 43121 9 nf_conntrack_ipv4, nf_nat, iptable_nat, xt_conntrack, xt_state, nf_conntrack_ftp, nf_nat_ftp, xt_CT, nf_conntrack_netlink
> 
> It doesn't work like this:
> 
> iptables -t raw -A PREROUTING --dst 1.1.1.1 -p tcp --dport 55555 -j CT --helper ftp
> iptables -t nat -A PREROUTING -i ext --dst 1.1.1.1 -p tcp --dport 55555 -j DNAT --to-destination 192.168.1.55:51
> 
> The control connection opens, but there is no data flow. conntrack -E expect shows nothing.
> 
> If we change so that the ftp server port is standard (ftp server settings and iptables settings), then everything works:
> 
> iptables -t nat -A PREROUTING -i ext --dst 1.1.1.1 -p tcp --dport 55555 -j DNAT --to-destination 192.168.1.55:21
> 
> Please tell me what settings are needed to make available an ftp server running on a non-standard port?

Hi,

It's been awhile since I tried this, but I'll take a quick stab for what 
it's worth:

I think the answer depends on whether you're running active or passive 
mode FTP, as well as whether or not you're doing SNAT (or MASQUERADE) 
between your networks.

The thread here may be of some help:
https://www.spinics.net/lists/netfilter/msg44797.html

In general it will probably be easier to get it to work if you can use 
passive mode FTP.

Best wishes,
Frank
