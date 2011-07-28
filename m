From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: iptables and virtual NIC
Date: Thu, 28 Jul 2011 17:28:39 +0200
Message-ID: <4E318027.8010308@tolaris.com>
References: <65C6A498BB5BF245BD7195255041FA2E04C751C4A5@bn-scl-be03.Cudanet.local> <CAA2qdGVekbZP=x0oUspJY6-ewqvgGB7OLcbZ0Om7LMmVz1UBRg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGVekbZP=x0oUspJY6-ewqvgGB7OLcbZ0Om7LMmVz1UBRg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pandu Poluan <pandu@poluan.info>
Cc: Kumar Swamy <kswamy@barracuda.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2011-07-28 14:00, Pandu Poluan wrote:
> How does the routing work? I.e., when does a packet exits through eth0
> or eth0:1 or eth0:2?

Pandu,

eth0 and eth0:1 are the same interface. The :1 suffix is just an alias
associated with a secondary IP address. There is no difference internally.

If you want to behave differently based on different aliases, you must
define rules by IP.

Regards,
Tyler

-- 
"A human being should be able to change a diaper, plan an invasion,
butcher a hog, conn a ship, design a building, write a sonnet, balance
accounts, build a wall, set a bone, comfort the dying, take orders, give
orders, cooperate, act alone, solve equations, analyze a new problem,
pitch manure, program a computer, cook a tasty meal, fight efficiently,
die gallantly. Specialization is for insects."
   -- Lazarus Long, "Time Enough for Love", by Robert A. Heinlein
