From: Bryan Harris <bryanlharris@me.com>
Subject: Re: marking/mangling of local packets for altering routes?
Date: Wed, 22 May 2013 16:22:09 -0400
Message-ID: <FE275ABF-CAB1-4F7B-9287-E781D6684C67@me.com>
References: <519D1CCF.2030707@csun.edu>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <519D1CCF.2030707@csun.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Wiegley <jeffw@csun.edu>
Cc: netfilter@vger.kernel.org


On May 22, 2013, at 3:30 PM, Jeff Wiegley <jeffw@csun.edu> wrote:

> I'm trying to do to some service based routing using the "ip rule" and "ip route"
> by marking packets.

Is this what you mean?  Sorry if I misunderstood.

echo "2 myGreatTable" >> /etc/iproute2/rt_tables
iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 1
ip rule add fwmark 1 table myGreatTable
ip route add default via 192.168.1.1 dev eth1 table myGreatTable

Bryan

