From: Chris Bradley <cbradley@westsider.com>
Subject: Rate-Limiting (tc/CBQ) & Load Balancing Question
Date: Mon, 13 Jul 2009 12:39:25 -0700
Message-ID: <ba0063890907131239m1a883373yc31ad66241a5e1c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, I am working on a project in which I am trying to both load
balance upstream Internet connections as well as rate-limit individual
users of those connection to asymmetrical upstream/downstream rates.

I have worked with iptables/tc/cbq for some time and the rate-limiting
is being accomplished by creating qdiscs on the inside and outside
interfaces (for simplicities sake). In the mangle table iptables is
then marking packets with the corresponding cbq ID. With only a single
upstream and downstream interface this works very well and I can
rate-limit 500-1000 users quite easily.

The challenge I have not been able to overcome, or find much
information on how to is have multiple load-balanced (weighted)
upstream connections and still rate-limit individual users across
those connections. I have tried creating qdiscs for each interface,
however being that the CBQ IDs are related to interfaces there is not
a reliable mechanism to ensure all packets of a specific user are
marked and thus rate-limited appropriately.

Any help or suggestions would be appreciated. Ultimately I would like
a way to mark and track packets independent of the upstream (or
downstream) routing interface. I am open to any/all suggestions. I am
currently working with the latest Debian stable (latest stable kernel,
iptables, etc.) and I have complete control over the OS and
configuration so if there is a different way to skin this cat please
let me know. (Sorry to all the cat lovers out there.)

Cheers,

Chris
