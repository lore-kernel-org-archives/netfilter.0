From: Marcin Szewczyk <marcin.szewczyk@wodny.org>
Subject: Re: re-routing multicast pkts after mangle table marking
Date: Wed, 2 Dec 2020 17:12:41 +0100
Message-ID: <X8e8+YL653hAkGe9@flatwhite>
References: <CAGsPj3=Hchb0VW8nt=4cfKm2pxxnvC7zKyzW1f4sYQmmkXRaMg@mail.gmail.com>
 <X8aQRtjwMXfstjRr@flatwhite>
 <CAF4tN+_YNz+0iCQzW7Fd+P5ZkDkU5g95Jv5fdHPNcqhzWtOOng@mail.gmail.com>
 <X8bE6GMR6U37cfH/@flatwhite>
 <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com>
 <X8d5JZT5cmBFUvNA@flatwhite>
 <001f01d6c8a4$0faac590$2f0050b0$@gmail.com>
 <X8eKYjtPSINtYYnl@flatwhite>
 <002e01d6c8c3$d4fa4e00$7eeeea00$@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002e01d6c8c3$d4fa4e00$7eeeea00$@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitor <ngtech1ltd@gmail.com>
Cc: 'Fatih USTA' <fatihusta86@gmail.com>, 'Netfilter Users Mailing list' <netfilter@vger.kernel.org>

On Wed, Dec 02, 2020 at 05:57:25PM +0200, Eliezer Croitor wrote:
> I have seen a similar "issue" with outgoing traffic generated locally.
> From what I understand the diagram:
> * https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg
> 
> Doesn't talk about locally generated traffic..

I am quite sure that it is not true.

Take a look at the simplified chart:
https://stuffphilwrites.com/2014/09/iptables-processing-flowchart/

OUTPUT chains are specifically for locally generated traffic, not the
forwarded traffic.

Also see:
https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_hooks

> There is a big difference in the linux kernel routing cache since the time
> of the test...

My test is fresh. tcpdump output I pasted was created today.

> If you want to re-produce this issue you can try to use iperf3 instead of
> iperf.
> iperf3 -c 224.1.1.1 -u  -b 10k

I do not use iperf at all. I am using netcat.

> Can you create a test lab using netns ?
> You can see a fully automated example lab that I wrote at:
> https://github.com/elico/mwan-nft-lb-example/blob/main/run-lab.sh
> 
> Or another lab examples can be seen at Vincent blog posts github repository:
> https://vincent.bernat.ch/en/blog/2018-route-based-vpn-wireguard

I will take a look later to check if those are relevant.

-- 
Marcin Szewczyk
http://wodny.org
