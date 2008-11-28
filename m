From: "=?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?=" 
	<javier.galvez.guerrero@gmail.com>
Subject: Sending packets through different interfaces and with different IPs to the same destination
Date: Fri, 28 Nov 2008 16:08:16 +0100
Message-ID: <145d4e1a0811280708v19e30a20l5c2928fbedf564f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=youOsLboRCUmUmtGzEBc1TjXD4a+uCdVh8gD2UEctYk=;
        b=ZcsN0s5VW/jCkj9IoObEVghpnAyFAveTpDiUWOJyKWg6u7GRwl/EEQnoHZCakscboy
         5LcSnH1o65HUNj15CihSo8kXA5PcUTd+5hMdl+LjDfc/4LhuxrK9ebUJDrK7F96jahxg
         qcTSHC8pYSlXPoTc9qPKTuDI85r1R5H3ShFJY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I want to monitor the quality of two different interfaces on a
client-server architecture. Let the interfaces be a wired ethernet
(eth0) and a wireless adapter (ath0). I want to use IPERF to get
performance statistics from these two interfaces. In the server I
start two different IPERF processes with two different ports (60301
for ath0 connections and 60302 for eth0 connections) listening to the
client to send dummy packets in order to get statistics.

In the client side I have configured interface ath0 with IP x.x.x.178
and eth0 with IP x.x.x.179 and I want the IPERF process sending
packets to server port 60301 (this is an argument for IPERF) sends
them through the ath0 interface with IP 178 and IPERF process sending
packets to server port 60302 does it through the eth0 interface with
IP 179, just as they are configured. Then the server receives these
packets and process them properly (acknowledging them through the
correct client interface and IP). It could be seen as a sort of
interface load balancing, but all load balancing examples I've found
on the Internet are targeted to router load balancing, and that's not
what I want.

I've been reading some iptables documentation through the official
site and other similar cases found googling and I've tried some
configurations with IPTABLES and IP ROUTE (I have used SNAT, TOS and
MARK) in order to get this working but everything I've tried hasn't
worked. Always some links fail to get the proper IP or MAC and the
configuration becomes unstable after a while, working correctly once
and the next time wrong.

I would like someone to help me with any piece of advice, idea or
similar experience reporting, then I can make this work as desired.
Any help would be much appreciated.


Regards,
Javi
