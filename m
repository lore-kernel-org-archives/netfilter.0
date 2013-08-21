From: "Nestor A. Diaz" <nestor@tiendalinux.com>
Subject: Machine in the middle
Date: Wed, 21 Aug 2013 12:11:06 -0500
Message-ID: <5214F4AA.4010409@tiendalinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

According to your experience what would be the best strategy to
intercept traffic from one machine to another and process some (not all)
request in a transparent way.

I explain, i have two machines:

192.168.1.1/24 <-> 192.168.1.2/24

All I want to do is to intercept traffic from a specific port(s), i.e.
4000/tcp and process it in a 'machine in the middle'.

192.168.1.1/24 <-> machine-in-the-middle <-> 192.168.1.2/24

The idea is that when 192.168.1.1 connects to 192.168.1.2:4000 then the
machine in the middle will answer those requests, but the remaining
traffic from 192.168.1.1 to 192.168.1.2 keep forwarding as is, and the
same for the opposite direction.

Thanks.

-- 
Nestor.Diaz.

