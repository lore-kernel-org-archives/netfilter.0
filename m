From: The Media Server <info@themediaserver.com>
Subject: RE: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 00:33:50 -0500
Message-ID: <CAJb3rWBxDV7uB-w5k1bMXi2CdY8o5OqXwH6VVG_=1hPCTcirUQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

OMG THANK GOD I JUST FOUND IT!!!!

it was hidden and off by default!! The tcp_fwmark_accept was off by default!

sudo sysctl -w net.ipv4.tcp_fwmark_accept=0
