From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: Failing to apply tc filter
Date: Wed, 23 Oct 2013 10:20:54 -0700
Message-ID: <20131023102054.111737ac@nehalam.linuxnetplumber.net>
References: <CABZC=5w_nmdJ3zhhOqTiXUA8dTuyvzq_z3o012nvaZyFfKV79w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABZC=5w_nmdJ3zhhOqTiXUA8dTuyvzq_z3o012nvaZyFfKV79w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sergio Belkin <sebelk@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 23 Oct 2013 06:36:49 -0200
Sergio Belkin <sebelk@gmail.com> wrote:

> Hi, I've run the example at ifb both con Centos and on Fedora with no success
> 
> tc filter add dev eth0 parent 1: protocol ip prio 10 u32  match ip src
> 192.168.200.200/32 flowid 1:2  action police rate 10kbit burst 90k
> drop  action mirred egress mirror dev ifb0
> Illegal "action"
> bad action parsing
> parse_action: bad value (12:police)!
> Illegal "action"
> 
> Is it about a known bug? Any ideas?
> 
> Thanks in advance!!
> 

police is not a valid action; it is a separate qualifier.
