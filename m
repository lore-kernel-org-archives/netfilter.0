From: Alex Bligh <alex@alex.org.uk>
Subject: SNAT using the same internal address multiple times
Date: Tue, 5 Feb 2013 08:05:28 +0000
Message-ID: <738ED808-0B35-4645-9D73-3CB3B5CBC4D7@alex.org.uk>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

Is it possible to use SNAT like this? (what I'm really asking is whether one can use the ingress interface as part of the NAT tuple):

                  LINUX
   eth0 <-------- ROUTER ----------- 10.0.1.0/24
                  \\\\\\\------------ 10.0.1.0/24
                   \\\\\\------------ 10.0.1.0/24
                    \\\\\------------ 10.0.1.0/24
                     \\\\------------ 10.0.1.0/24
                      \\\------------ 10.0.1.0/24
                       \\------------ 10.0.1.0/24
                        \------------ 10.0.1.0/24

Each private / internal address is the same on every interface. I plan to use
unnumbered interfaces and proxy ARP at the linux level.

-- 
Alex Bligh




