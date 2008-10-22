From: "Joey" <Joey@Web56.net>
Subject: tool to search within cidr blocks
Date: Wed, 22 Oct 2008 15:28:52 -0400
Message-ID: <004301c9347c$6ab0a3c0$4011eb40$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: IPTables <netfilter@vger.kernel.org>

Hello,

I have several ranges of IP=92s being put into iptables.
The IP ranges look like this:
62.29.0.0/17
62.68.192.0/19
62.108.64.0/19
62.244.192.0/18
62.248.0.0/17
77.67.128.0/17
77.72.184.0/21
77.73.216.0/21
77.75.32.0/21
77.75.216.0/21
77.79.64.0/18
77.92.0.0/19
77.92.96.0/19
77.92.128.0/19
77.223.128.0/19
77.245.144.0/20
78.40.224.0/21
78.111.96.0/20
78.135.0.0/17


I am blocking a specific IP from the firewall as logged in messages
71.74.56.125.
In looking at each block of ip=92s and using a CIDR calculator I can=92=
t figure
out what range it=92s really coming from.=A0 The list I have is pretty =
huge.
Is there a tool or a way to ask iptables what rule it matches?=A0 Based=
 on all
my calculations I don=92t have anything declared that would block that =
IP.

Thanks!




