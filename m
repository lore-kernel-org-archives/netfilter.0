From: vt6170293@tele2allin.be
Subject: tcp out of state
Date: Sun, 18 Nov 2007 14:07:02 +0100
Message-ID: <1195391222.474038f64d9d1@www.versateladsl.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I ave tcp paquet dropped by FW1 NG with reason "TCP out of state".
My configuration is:

2 machine firewalls, firts the internal FW on a linux box ( RHAS4.3) with
iptable 1.2.8.
On this machine I do NAT for one protocol ( imaps, port 993 ).
Followed by an external FW  an SUN ULTRA5 with Checkpoint NG.
On this last machine I ave the TCP out of state dropped packets.
This occur with higher traffic, more than 60 natted connections.

Where is the problem ?
internal ressources memory speed ?
Thanks
JLM


