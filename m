From: Nick Martin <martinn6@cs.man.ac.uk>
Subject: Forwarding packets that have your IP as source
Date: Mon, 16 Mar 2009 18:32:20 +0000
Message-ID: <20090316183220.GA3616@lf002.cs.man.ac.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm having some trouble with a strange setup I have. I have 2 virtual 
devices which have a test program sitting in between that print some 
info from the headers into logs. I also have a real ethernet device that 
connects me to the outside world (eth1).

                                      --------------------
        ------------INTERNET----------|CORRESPONDENT NODE|
        |                             --------------------
        |
   -----+-----
   |localhost|
   -+-------+-
    |       |
   -+-------+-
   |test prog|
   -----------

I want to route traffic to the correspondent node through the first 
virtual device (tun0), the test program then prints out some info, then 
puts the packet back into the second virtual device (tun1).

I have 2 different routing tables, a main routing table, and a test_out 
routing table which is used for traffic coming from tun1.

The tables are identical except for the rule which routes traffic with 
destination as the correspondent node through tun0, which is in the main 
table only to avoid sending packets in a loop.

Using LOG rules in the PREROUTING chain in the mangle table, I can see 
that packets arrive from tun1, but they are not being routed.

The packets arriving from tun1 have the IP address that is assigned to 
eth1, could this be why they are not being routed? If so, is there a way
to tell the kernel to route these packets?

Thanks for any help,
Nick Martin
