From: "Eliezer Croitor" <ngtech1ltd@gmail.com>
Subject: RE: re-routing multicast pkts after mangle table marking
Date: Wed, 2 Dec 2020 19:35:07 +0200
Message-ID: <004f01d6c8d1$7c068350$741389f0$@gmail.com>
References: <CAGsPj3=Hchb0VW8nt=4cfKm2pxxnvC7zKyzW1f4sYQmmkXRaMg@mail.gmail.com> <X8aQRtjwMXfstjRr@flatwhite> <CAF4tN+_YNz+0iCQzW7Fd+P5ZkDkU5g95Jv5fdHPNcqhzWtOOng@mail.gmail.com> <X8bE6GMR6U37cfH/@flatwhite> <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com> <X8d5JZT5cmBFUvNA@flatwhite> <001f01d6c8a4$0faac590$2f0050b0$@gmail.com> <X8eKYjtPSINtYYnl@flatwhite> <002e01d6c8c3$d4fa4e00$7eeeea00$@gmail.com> <X8e8+YL653hAkGe9@flatwhite>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=+Kct1SZuW2pUM979XLx8P/dUsC+mebpUZJGAVS+Q0Io=;
        b=Mi6UU6+xGzwyz0Nu19J1pmAnj9gMKXKawpQSjRQmpA+2VKhtRD0k0BWU0Aok7XlUIG
         Tu81wytE7SG+C4cWGYAQeXYVCXON6y8LfyhLdz8MbMpZx0LcKLjo0SoVIu2tJKgk6K5/
         YBBpxixFtuk/uIpRISyykaxPyf08AeMiNSl+3pG1SzYYnSfl8B02lqXNZjSf5f6PG9Jy
         lmJq5CHAOpQDp7RQR2CTI8UC6/N+nLhNsm4Oy8+PUyjb+RSMa7oump0oZvs+EX4Cek/R
         NvSj9VSvWPuUVAMl+gqVyTCVYtuRRmDzcWZr8Q3NL5q9bhX7+Sx0d4PZ3/HW9dxxEGqb
         SmoA==
In-Reply-To: <X8e8+YL653hAkGe9@flatwhite>
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Marcin Szewczyk' <marcin.szewczyk@wodny.org>
Cc: 'Netfilter Users Mailing list' <netfilter@vger.kernel.org>

Just to be accurate,

There is a difference between packets which are dropped to the nic itself
and traffic which is bounded to a specific ip address.
From what I remember( and my memory is not the best as it was..) the last
time I checked on Debian jessie you couldn't do any routing
decision on a bounded socket.
Maybe on newer versions of the kernel or another OS it's not the same.

Eliezer

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com

-----Original Message-----
From: Marcin Szewczyk <marcin.szewczyk@wodny.org> 
Sent: Wednesday, December 2, 2020 6:13 PM
To: Eliezer Croitor <ngtech1ltd@gmail.com>
Cc: 'Fatih USTA' <fatihusta86@gmail.com>; 'Netfilter Users Mailing list'
<netfilter@vger.kernel.org>
Subject: Re: re-routing multicast pkts after mangle table marking

On Wed, Dec 02, 2020 at 05:57:25PM +0200, Eliezer Croitor wrote:
> I have seen a similar "issue" with outgoing traffic generated locally.
> From what I understand the diagram:
> *
https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.sv
g
> 
> Doesn't talk about locally generated traffic..

I am quite sure that it is not true.

Take a look at the simplified chart:
https://stuffphilwrites.com/2014/09/iptables-processing-flowchart/

OUTPUT chains are specifically for locally generated traffic, not the
forwarded traffic.

Also see:
https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_ch
ain_hooks

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
> Or another lab examples can be seen at Vincent blog posts github
repository:
> https://vincent.bernat.ch/en/blog/2018-route-based-vpn-wireguard

I will take a look later to check if those are relevant.

-- 
Marcin Szewczyk
http://wodny.org

