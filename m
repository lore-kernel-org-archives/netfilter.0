From: steven <commercials24@yahoo.de>
Subject: Re: tc redirecting vpn traffic, ifb0 output not readable?
Date: Fri, 20 Sep 2013 15:06:21 +0200
Message-ID: <523C484D.6000404@yahoo.de>
References: <52361F9D.30506@yahoo.de> <CAEjQA5Kd9W5MCXTwXH1XKDMmFy-sQzXw8JXbdxUqymKAmkX0sA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.de; s=s1024; t=1379682387; bh=gBoz7PPzZ2aOCcw/s3T9lN8OfdZiyGAxjL+aoXyiM1Y=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=wb6Tnw1I7sfJ4BQCSo0BpO5YR/rxyplWuAtaZPmNPjCnmhj2gJ2WizwMAUXA8VH2N6hwEwq4l0Q2DTtqnyb6Mt+NiQtudbnMN0FUzLRomcaBD77NrduOQGkCDOowot3MqlrQPBhdMvRYswJlgr5nh5KUTwHIgrsVa2cWH5Kjiac=
In-Reply-To: <CAEjQA5Kd9W5MCXTwXH1XKDMmFy-sQzXw8JXbdxUqymKAmkX0sA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Am 19.09.2013 13:05, schrieb C. L. Martinez:
> On Sun, Sep 15, 2013 at 8:59 PM, james <commercials24@yahoo.de> wrote:
>> hi,
>>
>> when i use these commands to redirect the output from tun0 to ifb0:
>>
>>   dev=tun0; indev=ifb0;
>> tc qdisc add dev $dev handle ffff: ingress
>> tc filter add dev $dev parent ffff: protocol ip prio 1 u32 match u32 0 0
>> action \
>> mirred egress redirect dev $indev
>>
>> i get this tcpdump output:
>> tcpdump -i ifb0
>> tcpdump: WARNING: ifb0: no IPv4 address assigned
>>
>> listening on ifb0, link-type EN10MB (Ethernet), capture size 65535 bytes
>> 22:44:38.333033 00:00:40:01:43:58 (oui Unknown) > 45:00:00:54:23:22 (oui
>> Unknown), ethertype Unknown (0x0a08), length 84:
>>      0x0000:  000a 0a08 0016 0000 2e57 39db 0009 361c .........W9...6.
>>      0x0010:  3652 3c53 0400 0809 0a0b 0c0d 0e0f 1011 6R<S............
>>      0x0020:  1213 1415 1617 1819 1a1b 1c1d 1e1f 2021 ...............!
>>      0x0030:  2223 2425 2627 2829 2a2b 2c2d 2e2f 3031 "#$%&'()*+,-./01
>>      0x0040:  3233 3435 3637                           234567
>> 22:44:39.333253 00:00:40:01:43:57 (oui Unknown) > 45:00:00:54:23:23 (oui
>> Unknown), ethertype Unknown (0x0a08), length 84:
>>      0x0000:  000a 0a08 0016 0000 3e52 39db 000a 371c ........>R9...7.
>>      0x0010:  3652 2b57 0400 0809 0a0b 0c0d 0e0f 1011 6R+W............
>>      0x0020:  1213 1415 1617 1819 1a1b 1c1d 1e1f 2021 ...............!
>>      0x0030:  2223 2425 2627 2829 2a2b 2c2d 2e2f 3031 "#$%&'()*+,-./01
>>      0x0040:  3233 3435 3637                           234567
>>
>> why dont i get the icmp packets that went into the openvpn tunnel?
>> and what do i get instead?
>>
>> the target is to manage all incoming traffic, but if use eth0 (the real
>> physical device) as root
>> all that goes over the vpn connection is already encrypted and encapsulated
>> by openvpn.
>> so its all one big blob with dst port 1194.
>>
>> is there a better way to manage the traffic that goes to the internet and
>> the one that goes trough a vpn at one bottleneck?
>> --
> Can you try "protocol all" instead of "protocol ip"??


should have checkd what ping packets look like on the receiving side, i 
was expecting a tc filter that matches small packets to hit it and be 
redirected in a qdisc. since that qdisc never got any packets i assumed 
that they never reached the machine...but:

this is the output of "wget 10.8.0.1" (receiving the default ubuntu 
12.04.2 apache index.html with protocol ip)

tcpdump -i ifb0
tcpdump: WARNING: ifb0: no IPv4 address assigned
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ifb0, link-type EN10MB (Ethernet), capture size 65535 bytes
14:47:35.410818 40:00:40:06:a2:11 (oui Unknown) > 45:00:00:3c:84:94 (oui 
Unknown), ethertype Unknown (0x0a08), length 60:
     0x0000:  0006 0a08 0001 cfaf 0050 8415 9ccd 0000 .........P......
     0x0010:  0000 a002 3908 edf5 0000 0204 0558 0402 ....9........X..
     0x0020:  080a 040f 1859 0000 0000 0103 0304       .....Y........
14:47:35.458207 40:00:40:06:a2:18 (oui Unknown) > 45:00:00:34:84:95 (oui 
Unknown), ethertype Unknown (0x0a08), length 52:
     0x0000:  0006 0a08 0001 cfaf 0050 8415 9cce ddbc .........P......
     0x0010:  6282 8010 0391 469c 0000 0101 080a 040f b.....F.........
     0x0020:  1865 06a1 c441                           .e...A
14:47:35.460451 40:00:40:06:a1:ab (oui Unknown) > 45:00:00:a0:84:96 (oui 
Unknown), ethertype Unknown (0x0a08), length 160:
     0x0000:  0006 0a08 0001 cfaf 0050 8415 9cce ddbc .........P......
     0x0010:  6282 8018 0391 bbee 0000 0101 080a 040f b...............
     0x0020:  1865 06a1 c441 4745 5420 2f20 4854 5450 .e...AGET./.HTTP
     0x0030:  2f31 2e31 0d0a 5573 6572 2d41 6765 6e74 /1.1..User-Agent
     0x0040:  3a20 5767 6574 2f31 2e31 332e 3420 286c :.Wget/1.13.4.(l
     0x0050:  696e 7578 2d67 6e75 290d 0a41 6363 6570 inux-gnu)..Accep
     0x0060:  743a 202a 2f2a 0d0a 486f 7374 3a20 3130 t:.*/*..Host:.10
     0x0070:  2e38 2e30 2e31 0d0a 436f 6e6e 6563 7469 .8.0.1..Connecti
     0x0080:  6f6e 3a20 4b65 6570 2d41 6c69 7665 0d0a on:.Keep-Alive..
     0x0090:  0d0a                                     ..
14:47:35.546704 40:00:40:06:a2:16 (oui Unknown) > 45:00:00:34:84:97 (oui 
Unknown), ethertype Unknown (0x0a08), length 52:
     0x0000:  0006 0a08 0001 cfaf 0050 8415 9d3a ddbc .........P...:..
     0x0010:  646c 8010 03d4 43e0 0000 0101 080a 040f dl....C.........
     0x0020:  187b 06a1 c44e                           .{...N
14:47:35.548458 40:00:40:06:a2:15 (oui Unknown) > 45:00:00:34:84:98 (oui 
Unknown), ethertype Unknown (0x0a08), length 52:
     0x0000:  0006 0a08 0001 cfaf 0050 8415 9d3a ddbc .........P...:..
     0x0010:  646c 8014 03d4 43dc 0000 0101 080a 040f dl....C.........
     0x0020:  187b 06a1 c44e                           .{...N


that looks like a beginning of a valid html document.
have to check why my filter didnt match, thx for your time.


