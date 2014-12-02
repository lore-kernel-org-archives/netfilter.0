From: Eric Leblond <eric@regit.org>
Subject: Re: nftables compatibility
Date: Tue, 02 Dec 2014 23:15:48 +0100
Message-ID: <1417558548.10146.7.camel@regit.org>
References: <547E38AE.6000909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <547E38AE.6000909@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jpmenil@gmail.com
Cc: netfilter@vger.kernel.org

Hi,

On Tue, 2014-12-02 at 23:09 +0100, Jean-Philippe Menil wrote:
> Hi,
> 
> while playing with nftables, i observe that my iptables masquerading do not
> work anymore:
> 
> modprobe nft_nat
> modprobe nft_chain_nat_ipv4
> nft add table nat
> nft add chain nat postrouting { type nat hook postrouting priority 0 \; }
> 
> ^^ iptables nat stoped work here.
> 
> I'm sure i read that nftables and iptables  where compatible.
> 
> Can anyone point me what am i missing ?
> 
> (I'm on 3.17.4)

Sadly, masquerade is requiring 3.18. Only standard NAT is implemented in
3.17.x.

BR,
-- 
Eric Leblond <eric@regit.org>

