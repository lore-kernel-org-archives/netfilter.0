From: Tim Nelson <tnelson@rockbochs.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Wed, 17 Dec 2014 10:56:36 -0600 (CST)
Message-ID: <6072563.350672.1418835396663.JavaMail.root@rockbochs.com>
References: <CAA5aLPi--5H-+SVDvv9tDc7SNSnYtxpW1rAStAhQrgr0qpwHOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPi--5H-+SVDvv9tDc7SNSnYtxpW1rAStAhQrgr0qpwHOw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

----- Original Message -----
> Its not about finding a workaround or something.
> 
> If we bridge two vlans on the same interface, then what should be the
> VLAN-tag on the packets moving out of the box? As it might not be
> possible to decide this, thats why we cannot bridge two vlans on the
> same interface.
> 

My assumption (wrongful?) would be some sort of state tracking wherein the kernel notes the interface the traffic is sourced from, and return traffic goes back via the same path (including layer 2 characteristics including VLAN ID).

--Tim
