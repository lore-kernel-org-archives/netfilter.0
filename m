From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: meter directive
Date: Mon, 28 Sep 2020 18:40:37 +0200
Message-ID: <20200928164037.GA3454@salvia>
References: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
 <aaa67cc8-c8c0-465b-3fa5-10f62e67795e@doubly.so>
 <20200928021034.GB20886@dimstar.local.net>
 <b3d4b568-3d53-a9cf-6730-a47b35132b5f@doubly.so>
 <20200928123213.GF20886@dimstar.local.net>
 <dc380b6d-4085-13c7-9687-405825585823@doubly.so>
 <20200928160809.GB2605@salvia>
 <dcece986-3760-ddab-a726-213ac103e4d8@doubly.so>
 <20200928162122.GA3287@salvia>
 <e144da82-726e-21fb-fcad-7181a19b0bb7@doubly.so>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e144da82-726e-21fb-fcad-7181a19b0bb7@doubly.so>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Devin Bayer <dev@doubly.so>
Cc: duncan_roe@optusnet.com.au, "netminder (Eric Peterson)" <netminder@gmail.com>, netfilter@vger.kernel.org

On Mon, Sep 28, 2020 at 06:26:04PM +0200, Devin Bayer wrote:
> 
> 
> On 28/09/2020 18.21, Pablo Neira Ayuso wrote:
> 
> > On Mon, Sep 28, 2020 at 06:12:21PM +0200, Devin Bayer wrote:
> 
> >>
> 
> >> How do I get the behavior like in the wiki, which uses maps?
> 
> >
> 
> > What example are you referring to?
> 
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Meters
> 
> % nft list map my_filter_table my_ssh_meter
> 
> table ip my_filter_table {
> 	map my_ssh_meter {
> 		type ipv4_addr . inet_service
>               size 65535
> 		flags dynamic,timeout
> 
> 		elements = { 64.62.190.36 . 55000 expires 38s : counter packets 2 bytes
> 220, 83.98.201.47 . 35460 expires 39s : counter packets 10 bytes 5988,
> 172.217.7.142 . 43254 expires 46s : counter packets 1 bytes 98}
> 
> 	}
> 
> }

I just fixed this in the wiki.

For this example:

% nft add chain filter input {type filter hook input priority 0\;}
% nft add set filter ssh-meter { type ipv4_addr\; flags dynamic\; }
% nft add rule filter input tcp dport 22 ct state new add @ssh-meter { ip saddr limit rate 10/second } accept

The listing is:

% nft list set my_filter_table my_ssh_meter
table ip my_filter_table {
        set my_ssh_meter {
                type ipv4_addr
                size 65535
                flags dynamic
                elements = { 10.141.10.2 limit rate 10/second }
        }
}
