From: Alex Bligh <alex@alex.org.uk>
Subject: netfilter + masquerade, mutliple i/fs sharing an IP
Date: Tue, 22 Sep 2009 17:23:59 +0100
Message-ID: <C427FC06DA4331C494D72BCA@Ximines.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

Hi,

I'm trying to set up masquerading on linux with a somewhat unusual 
requirement.
Essentially, I have multiple p2p interfaces (let's call them tun0 .. tun99),
and want them all to NAPT to eth0's IP address (for outgoing connectivity).
Now, that's nice and easy if tun0 .. tun99 have distinct IP addresses. For
reasons we need	not go into, I want to have them all having the same IP
address, i.e. (for ASCII art fans)

                                          [------------------]
                          192.168.1.0/24  [   NAPT gateway   ]
 [ Host A  192.168.1.2] ------------------[ 192.168.1.1      ]
                                     tun0 [                  ] 1.2.3.0/24
                                          [          1.2.3.4 ]---->
                                          [                  ] eth0
 [ Host B  192.168.1.2] ------------------[ 192.168.1.1      ]
                                     tun1 [                  ]
                                          [------------------]

Now, I appreciate that duplicating IP addresses is not in general
a good idea. However, in theory this could work. The complex
part is that when a packet traverses the NAPT left to right, it
needs to record both the input i/f, together with the source IP	
and port. When the reply is translated back, the packet is
going to be destined for 192.168.1.2, but it must be sent out
the same interface as the NAPT table shows the packet is received on,

Doing this the standard way (i.e.
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE	
  iptables -A FORWARD -i tun0 -o eth0 -j ACCEPT
  iptables -A FORWARD -i tun1 -o eth0 -j ACCEPT
  )
only appears to work when either tun0 OR tun1 are up (but not both).
I suspect this is because on NAPT traversal of the reply packet,
the kernel looks up a next hop, and uses that next hop to determine
which interface to use (using first subnet match).

Is there any way around this? For instance can I used multiple
NAPT tables, one for each inbound i/f?

-- 
Alex Bligh
