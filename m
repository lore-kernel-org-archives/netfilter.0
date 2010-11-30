From: andy thomas <andy@time-domain.co.uk>
Subject: Packet filter port forwarding question
Date: Tue, 30 Nov 2010 23:00:00 +0000 (GMT)
Message-ID: <Pine.GSO.4.64.1011302250280.29314@mail.time-domain.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm not sure if this is the right place to askquestions about packet 
filter as most of the queries here seem related to iptables/netfilter.

I have an OpenBSD-based firewall that uses packet filter and I want to 
forward port 444 on the exteral public side to port 443 on an internal 
private LAN address (this is for a Sonic wall SSL-VPN device which listens 
on port 443). Would the correct pf.conf rule be something like this:

rdr pass on $ext_if proto tcp from any to $ext_if port 444  -> $int_if 
port 443

where $ext_if and $int_if are the external and internal addresses 
respectively?

If this is the wrong mailing list, please accept my apologies and tell mw 
where I should ask this question.

Andy
