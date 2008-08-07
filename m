From: Charles Duffy <Charles_Duffy@messageone.com>
Subject: Re: NETMAP of destination *after* routing
Date: Thu, 07 Aug 2008 09:55:03 -0500
Message-ID: <g7f2ch$tbm$1@ger.gmane.org>
References: <g7da9g$21r$1@ger.gmane.org> <alpine.DEB.1.10.0808071340480.31237@mercury.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.0808071340480.31237@mercury.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Sven-Haegar Koch wrote:
> On Wed, 6 Aug 2008, Charles Duffy wrote:
> 
>> Unfortunately, the current behavior of NETMAP -- translating the source
>> address in POSTROUTING and the destination in PREROUTING -- doesn't appear to
>> work for this purpose: I still need the original destination intact when
>> routing to decide which bridge packets should go out.
>>
>>
>> How do 'yall suggest resolving this?
> 
> Perhaps setting a mark based on the destination address at pre-routing,
> use netmap, and then route based on the mark?
> (Using one routing table a'la 'common-dest/mask -> bridgeX' per mark)

This works only for packets which came in from elsewhere in the network; 
packets emitted from the local host don't go through PREROUTING (and 
thus can't be marked, and also -- and worse -- don't get their 
destinations translated).

Perhaps I could also also add a rule setting an appropriate mark in 
OUTPUT. Not being able to communicate with the hosts from the local 
system is a showstopper, however, and I'd prefer to avoid munging the 
routing tables if possible to keep the patch to libvirt implementing 
this functionality minimal. (Robust infrastructure is already in place 
for modifying iptables rules for libvirt-managed networks; routing, not 
so much).

