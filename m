From: "Steve \(Telsat Broadband\)" <steve@telsatbb.vu>
Subject: Valid requirement for REDIRECT target on IPv6 where TPROXY won't do.
Date: Thu, 28 Jun 2012 12:32:59 +1100
Message-ID: <072301cd54cd$f434eaf0$dc9ec0d0$@telsatbb.vu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-au
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,

I would like to see if there is some way we can get the 'REDIRECT' target
implemented into ip6tables; this isn't for NAT purposes; but rather for the
process of creating a captive portal for network users access requests.  We
currently use the REDIRECT target on our gateway for IPv4 and need the same
functionality for IPv6.

It has been suggested that 'TPROXY' which is available in the mangle table
is a replacement; but it isn't.  I have tested TPROXY every which way but
still to no avail; the packets hit the TPROXY rule but simply do not get
send to the captive portal process which is running on the gateway machine.

Given there is no NAT table in IPv6, can we please get the same
functionality as the REDIRECT added into the mangle table targets as well?
For our business case; this is a critical component of being able to
properly handle our customers' requests.

Thanks in advance.
Steve.


