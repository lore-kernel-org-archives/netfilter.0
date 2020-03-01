From: Patrick McLean <chutzpah@gentoo.org>
Subject: Re: nftables offload doesn't seem to work
Date: Sun, 1 Mar 2020 15:15:04 -0800
Message-ID: <20200301151504.78592af2@moya.linuxfreak.ca>
References: <20200301151148.44bd0e5e@moya.linuxfreak.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200301151148.44bd0e5e@moya.linuxfreak.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sun, 1 Mar 2020 15:11:48 -0800
Patrick McLean <chutzpah@gentoo.org> wrote:

> Hi,
> 
> I am trying to test the nftables offload support, as describe in
> https://lwn.net/Articles/810663/
> 
> When I try to load the rules, or check a rules file, nft errors out, it
> appears that it does not understand "flags offload;":
> 
> # nft --check --file test.nft
> test.nft:6:51-55: Error: syntax error, unexpected flags
>                 type filter hook ingress device if0 priority 0; flags offload;
> 
> Here is the contents of the file I am trying to load:
> 
> table netdev filter_test {
>     chain ingress {
>         type filter hook ingress device eth0 priority 0; flags offload;
> 
>         192.168.0.10 tcp dport 22 drop
Oops, copy/paste error, this line is:
ip daddr 192.168.0.10 tcp dport 22 drop
>     }
> }
> 
> I am using the 5.4.22 kernel with nftables 0.9.3, the hardware is mlx5:
> 
> # ethtool --driver eth0
> driver: mlx5_core
> version: 5.0-0
> firmware-version: 16.23.1020 (MT_0000000012)
> expansion-rom-version:
> bus-info: 0000:61:00.0
> supports-statistics: yes
> supports-test: yes
> supports-eeprom-access: no
> supports-register-dump: no
> supports-priv-flags: yes
> 
> lspci reports it as:
> 61:00.0 Ethernet controller: Mellanox Technologies MT27800 Family [ConnectX-5]

