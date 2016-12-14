From: Buddy Lumpkin <buddy.lumpkin@gmail.com>
Subject: Rewriting ethernet frames
Date: Tue, 13 Dec 2016 17:08:58 -0800
Message-ID: <CAMfvBhO2QH5whtWs8ySrMe9AB6cVcGqR8fh+XcD2dQJosn07nw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=AdlyfJPwwb16MYZdUMk67uOarf9Ul8VfKsAunpRxtTo=;
        b=PyxXrcdYmX8p1r6aS0bRjOrK4PaFMSwi1SZfM9wl8ksAx5kxChZYqw4o5slIhUREsl
         hT9DV4W3nunxSePCubOLWOX5thOLqnm1YxXidkaUjy+8T7YqdsMiz/EhtTKsuiv8NclV
         jyKOUVG99VxazDUJCFsAfIEUCh0NNB2Tnm9REkAuPBV3QBaymTGXzYChEUVD29MLkbpe
         KjcIikdFag5gF170I6OmXkf7Q7jl63++zjOyL48DbSM7cxSH68Dgvj59VxbOiXsFfqCb
         YHjr/RrhXJPagh/edihZVw1PUQcasIbTWdIxZL3eDUMlpt62mqcQ4KB3HHvaV/Ftj+qI
         u+dg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I have a tftp server that is padding runt frames with garbage data,
rather than zero's. Our intel NICs are able to transfer files from it
just fine during PXE boot, but I recently tried to netboot from a new
NIC from another vendor, and it behaves pathologically after receiving
a TFTP option acknowledgment with garbage appended to the end. Here is
an example:

0000   00 0a f7 97 a6 9c 44 4c a8 26 11 e1 81 00 0f f2  ......DL.&......
0010   08 00 45 00 00 2b 66 50 40 00 3d 11 2a 0e ac 12  ..E..+fP@.=.*...
0020   16 1f ac 12 3f 20 94 40 07 7d 00 17 b2 d1 00 06  ....? .@.}......
0030   62 6c 6b 73 69 7a 65 00 31 34 36 38 00 25 57 2c  blksize.1468.%W,
0040   39 09 0a 2d
         9..-

The ASCII characters at the end: %W,9..- is random garbage, used to
get the runt packet up to a total of 67 bytes. Wireshark refers to
this last 7 octets as a vlan trailer.

We used editing features on an Arista 7060cx switch to zero out the
last 7 bytes, and the NIC in question booted successfully. I will
figure out where the source of this garbage padding is, but for now, I
want to get something to the NIC vendor so they can reproduce the
problem. This is where I hoped I could use netfilter_queue ...

I started with the following iptables rule:

iptables -D OUTPUT -p udp -j NFQUEUE --queue-num 0

Then I hacked out some C code to dump the contents of the packets
using netfilter_queue. Here is a hex dump of all of the data from
nfq_get_payload():


  0000  45 00 00 38 d5 a9 40 00 40 11 0c 46 0a 8f b7 9b  E..8..@.@..F....
  0010  0a 91 8c 0a b7 61 c7 7a 00 24 76 6f 00 06 74 73  .....a.z.$vo..ts
  0020  69 7a 65 00 38 34 38 36 37 32 00 62 6c 6b 73 69  ize.848672.blksi
  0030  7a 65 00 31 34 36 38 00                          ze.1468.

Unlike the hex/ASCII dump from wireshark above, this hex dump starts
with an ip header.

RFC894 states the following about ethernet padding:

If necessary, the data field should be padded
   (with octets of zero) to meet the Ethernet minimum frame size.  This
   padding is not part of the IP packet and is not included in the total
   length field of the IP header.

Since this is a tftp option acknowlegement, I can't just tack more
data onto the end of the UDP packet. I need access to the rest of the
packet. Is this possible with netfilter_queue? Perhaps with a
different iptables rule, or do I need another tool?

Any guidance here would be appreciated. If I need to write a kernel
module, I am fine with that. I just need someone to give me the high
level synopsis of what I need to do and i'll take it from there.

Thanks in advance,

--Buddy
