From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: sync flood and resource utilization .
Date: Sun, 28 Feb 2010 10:19:03 +0100
Message-ID: <4B8A3507.9020108@chello.at>
References: <cfeab66d1002262135x419e1009w8358c8c7f4def7cf@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1002262135x419e1009w8358c8c7f4def7cf@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 27.02.2010 06:36, netfilter-owner@vger.kernel.org wrote:
> iptables -A INPUT -j  DROP .
> iptables -A OUTPUT -j ACCEPT
> 
> When i syn flooded my desktop . I can see all pkts are getting
> rejected by the rule . But system becomes slow beacuse of this . Is
> there any way to make system fast ? will black listing will help ?
> 

g00gle is your friend:

search: syn flood protection iptables
or:
syn flood protection iptables hashlimit recent blacklist


you can do some with a simple 'limit'.

or more complex with 'hashlimit' and 'recent'.

Best regards

Mart
