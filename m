From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: TCP and UDP dport in the same rule
Date: Sun, 22 Mar 2020 17:36:47 +0100
Message-ID: <7f1b28fa-faeb-c89d-b94f-74e412c02e8f@thelounge.net>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
 <477be69c-1afd-233c-1126-b081aab6a244@thelounge.net>
 <0b44d0eb-5d52-d0c8-fe6c-ccbe6ba88e01@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0b44d0eb-5d52-d0c8-fe6c-ccbe6ba88e01@fhmtech.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Myhr <fmyhr@fhmtech.com>, Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 22.03.20 um 15:43 schrieb Frank Myhr:
> nftables has its own concept of sets:
> https://wiki.nftables.org/wiki-nftables/index.php/Sets
> 
> I don't know of a way to use ipset with nftables

well, that's a showstopper for even consider switch to nftables given
the amount of code maintainig ipsets from shell scripts *because* they
live outside of the ruleset

it makes many things so much easier up to write backends in whatever
language to maintain ipsets without any knowledge of the ruleset using
them finally

i even deploy ipsets to different machines no matter where they are
phyisically located and hwat the role of the machine is (firewall,
endpoint...)

well, you need to think about naming to keep them useable that way....

