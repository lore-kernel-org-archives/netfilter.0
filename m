From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: CGNAT - Deterministic port ranges RFC7422
Date: Mon, 4 Dec 2017 11:25:22 +0100
Message-ID: <20171204102522.GA15112@salvia>
References: <CAD4ZOMw-r1iPt4KHL-oN4CGx7FuAZS8dNQz4srqbuJLWrigT7Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD4ZOMw-r1iPt4KHL-oN4CGx7FuAZS8dNQz4srqbuJLWrigT7Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rafael Ganascim <rganascim@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Sat, Nov 25, 2017 at 02:41:50AM -0200, Rafael Ganascim wrote:
> Hello guys,
> 
> Do you know if its possible to create in few rules the RFC7422
> deterministic port ranges with netfilter?
> 
> I'm using with iptables generating a lot of rules, one for each
> internal ipv4 address/port range/protocol (minimum 3 for each private
> ip address).
> 
> I'm looking in DNETMAP implementation, but I don't know if it can be
> configured to be deterministic based on the source-ip/port.

I guess your goal is to map a range of source ports to an IP address,
so from outside you can identify what traffic belongs to what IP
address behind the NATs.

I made a quick hack long long time ago for a friend of mine that
needed this, I'm not finding the patchset here, that happened probably
more than 10 years ago.

But I remember this just needs a very small change to the code.
Probably adding a new revision any of the existing NAT targets should
be fine.

So just to clarify, I think this should be easy to support.
