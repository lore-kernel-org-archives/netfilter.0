From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables support for cgroup v2 filtering by path
Date: Wed, 18 Aug 2021 20:38:30 +0200
Message-ID: <20210818183830.GA3505@salvia>
References: <CANsv5MQYbEeFg1J+MO6EO-ZWLbsy-Ro3B3PWTfzpKK7L3FxBrQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANsv5MQYbEeFg1J+MO6EO-ZWLbsy-Ro3B3PWTfzpKK7L3FxBrQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Ruellan <mathieu.ruellan@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Wed, Aug 18, 2021 at 12:36:43PM +0200, Mathieu Ruellan wrote:
> Hello,
> 
> I'm facing the same issue than here:
> https://marc.info/?l=netfilter&m=161896252706060&w=2
> 
> I'm using the last release 0.9.9. Is there somewhere a documentation
> or a syntax example?

man nft(8) provides a description and an example.

You can also use it with maps to define your policy based on the
cgroupsv2 hierarchy.

Another quick example with a verdict map:

 table inet x {
        chain user_slice {
                counter packets 147 bytes 117478
                socket cgroupv2 level 2 "user.slice/user-1000.slice" counter packets 147 bytes 117478
        }

        chain system_slice {
                counter packets 0 bytes 0
                socket cgroupv2 level 2 "system.slice/foo.service" counter packets 0 bytes 0
        }

        chain y {
                type filter hook input priority filter; policy accept;
                socket cgroupv2 level 1 vmap { "system.slice" : jump system_slice, "user.slice" : jump user_slice }
        }
 }
