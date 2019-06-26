From: Florian Westphal <fw@strlen.de>
Subject: Re: Question about nf_conntrack_proto for IPsec
Date: Wed, 26 Jun 2019 13:13:22 +0200
Message-ID: <20190626111322.gks5qptax3iqrjao@breakpoint.cc>
References: <CANpxKHHXzrEpJPSj3x83+WE23G1W0KPz9XbG=fCVzS21+-BpfQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANpxKHHXzrEpJPSj3x83+WE23G1W0KPz9XbG=fCVzS21+-BpfQ@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Naruto Nguyen <narutonguyen2018@gmail.com>
Cc: netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org

Naruto Nguyen <narutonguyen2018@gmail.com> wrote:
> In linux/latest/source/net/netfilter/ folder, I only see we have
> nf_conntrack_proto_tcp.c, nf_conntrack_proto_udp.c and some other
> conntrack implementations for other protocols but I do not see
> nf_conntrack_proto for IPsec, so does it mean connection tracking
> cannot track ESP or AH protocol as a connection. I mean when I use
> "conntrack -L" command, I will not see ESP or AH  connection is saved
> in conntrack list. Could you please help me to understand if conntrack
> supports that and any reasons if it does not support?

ESP/AH etc. use the generic tracker, i.e. only one ESP connection
is tracked between each endpoint.
