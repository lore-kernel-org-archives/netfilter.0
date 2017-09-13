From: "Thomas Rosenstein" <thomas.rosenstein@creamfinance.com>
Subject: Re: Change source or destination for packets arriving locally (for
 Direct Server Return)
Date: Wed, 13 Sep 2017 16:14:07 +0200
Message-ID: <E6E3CCA0-6980-4008-A38D-9E8675590941@creamfinance.com>
References: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
 <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com>
 <DF1B4985-ED4C-4881-8A54-11310C5AA3B9@creamfinance.com>
 <CAOkSjBhPTEgftg7eOV2sRY-j0vRCjMF3W7-UwTTUW36nnp524Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=creamfinance.com; s=google;
        h=from:cc:subject:date:message-id:in-reply-to:references:mime-version;
        bh=fVHBMedsa+qppdV1qTtP81DvXQFibt5gN491v1iGVpA=;
        b=e0KVjpIJy2YHoDXzuDx8r+sZFHch66tn0LSdp+rhfNQ2R+WiL9bvt5W4iRkmNmlOOk
         MtOmtmsXmafrj2S+Yj9ifhBwHzH5rklGcs+grsKIIVxGrFcfuRJpGvuE1tTBNFe/KMCD
         mv/PpF3J5C4jjOe3y7/7WRcVXR4yvT1kAlbwA=
In-Reply-To: <CAOkSjBhPTEgftg7eOV2sRY-j0vRCjMF3W7-UwTTUW36nnp524Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

>
> Please, avoid top-posting, thanks :-)
>
> There is information about debugging in the wiki [0], and is rather 
> easy to use.
>
> [0] 
> https://wiki.nftables.org/wiki-nftables/index.php/Ruleset_debug/tracing

Okay :)

I added all the debug logs I can think of:

table ip filter {
	chain filter-prerouting-0 {
		type filter hook prerouting priority 0; policy accept;
		ip protocol icmp nftrace set 1
	}

	chain test2 {
	    type filter hook forward priority 0; policy accept;
	    ip protocol icmp nftrace set 1
	}

	chain test-200 {
	    type filter hook prerouting priority 200; policy accept;
	    ip protocol icmp nftrace set 1
	}

	chain test-m500 {
	    type nat hook prerouting priority -500; policy accept;
	    ip protocol icmp nftrace set 1
	}

	chain test-500 {
	    type filter hook prerouting priority 500; policy accept;
	    ip protocol icmp nftrace set 1
	}

	chain forward-0 {
	    type filter hook forward priority 0; policy accept;
	    ip protocol icmp nftrace set 1
	}

	chain forward-m500 {
     		type filter hook forward priority -500; policy accept;
	    ip protocol icmp nftrace set 1
	}
}

and the packets go missing between test-500 and forward-m500 also the 
test-m500 chain is never hit (nat).

Sorry for the names, I tried to rename them with:

nft rename chain ip filter test filter-prerouting-0

<cmdline>:1:1-47: Error: Could not process rule: No such file or 
directory
rename chain ip filter test filter-prerouting-0
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

nft monitor logs:

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
daddr 18:a9:05:79:73:6e ip saddr 10.21.13.5 ip daddr 10.253.10.12 ip 
dscp cs0 ip ecn not-ect ip ttl 63 ip id 24831 ip length 84 icmp type 
echo-request icmp code 0 icmp id 21685 icmp sequence 1
trace id 42c618bd ip filter test2 rule ip protocol icmp nftrace set 1 
(verdict continue)
trace id 42c618bd ip filter test2 verdict continue
trace id 42c618bd ip filter test2
trace id 42c618bd ip filter forward-0 packet: iif eth0 oif kube-bridge 
ether saddr 9c:8e:99:0f:7e:46 ether daddr 18:a9:05:79:73:6e ip saddr 
10.21.13.5 ip daddr 10.253.10.12 ip dscp cs0 ip ecn not-ect ip ttl 63 ip 
id 24831 ip length 84 icmp type echo-request icmp code 0 icmp id 21685 
icmp sequence 1
trace id 42c618bd ip filter forward-0 rule ip protocol icmp nftrace set 
1 (verdict continue)
trace id 42c618bd ip filter forward-0 verdict continue
trace id 42c618bd ip filter forward-0
trace id a1f8a919 ip filter test packet: iif kube-bridge ether saddr 
0a:58:0a:fd:0a:0c ether daddr 0a:58:0a:fd:0a:01 ip saddr 10.253.254.236 
ip daddr 10.21.13.5 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 18916 ip 
length 84 icmp type echo-reply icmp code 0 icmp id 21685 icmp sequence 1
trace id a1f8a919 ip filter test rule ip protocol icmp nftrace set 1 
(verdict continue)
trace id a1f8a919 ip filter test verdict continue
trace id a1f8a919 ip filter test
trace id a1f8a919 ip filter test-200 packet: iif kube-bridge ether saddr 
0a:58:0a:fd:0a:0c ether daddr 0a:58:0a:fd:0a:01 ip saddr 10.253.254.236 
ip daddr 10.21.13.5 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 18916 ip 
length 84 icmp type echo-reply icmp code 0 icmp id 21685 icmp sequence 1
trace id a1f8a919 ip filter test-200 rule ip protocol icmp nftrace set 1 
(verdict continue)
trace id a1f8a919 ip filter test-200 verdict continue
trace id a1f8a919 ip filter test-200
trace id a1f8a919 ip filter test-500 packet: iif kube-bridge ether saddr 
0a:58:0a:fd:0a:0c ether daddr 0a:58:0a:fd:0a:01 ip saddr 10.253.254.236 
ip daddr 10.21.13.5 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 18916 ip 
length 84 icmp type echo-reply icmp code 0 icmp id 21685 icmp sequence 1
trace id a1f8a919 ip filter test-500 rule ip protocol icmp nftrace set 1 
(verdict continue)
trace id a1f8a919 ip filter test-500 verdict continue
trace id a1f8a919 ip filter test-500
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


any idea where I could poke, what I could start to figure out why the 
packets are dropped in the kernel?
