From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables & VLAN redirect
Date: Tue, 29 Jun 2010 14:31:02 -0500
Message-ID: <4C2A49F6.2060704@riverviewtech.net>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>	<4C262DA2.1040103@riverviewtech.net>	<AANLkTikWc-CNXMieyxv2lB69UphqQRsjjJATJYrpjkMK@mail.gmail.com>	<4C2805A3.4070801@riverviewtech.net>	<AANLkTikeVKxFv4jTp2vLTh80BOQW1nAQxmCc8M7EsPJ1@mail.gmail.com>	<4C2909D9.8010506@riverviewtech.net> <AANLkTindtJ35xk2AgQxS_Fkac86s-n1riksh7D2oD34o@mail.gmail.com> <4C2A49A3.1030600@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2A49A3.1030600@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/29/10 14:29, Grant Taylor wrote:
> The simple fact that you have the amount of incoming traffic that you 
> want to filter and forward a subset of implies that there will be CPU 
> time spent analyzing which traffic to forward.

Along these lines, I have what some might consider a devious idea.

Create a bridge for each VLAN.  That will give you the VLAN interface 
and it's associated bridge interface.  Then bridge the bridge interfaces 
in to a larger bridge.

Using all the smaller bridges will keep the possible rules that you need 
to match smaller, thus less load on the CPU.  You could also turn down 
the VLANs individual bridge when you didn't want to monitor any traffic 
on it, thus reducing the load further.

So, you would end up with a topology somewhat like this:

eth0.101 <-> br101 <-> br9
eth0.102 <-> br102 <-> br9
eth0.103 <-> br103 <-> br9 <-> eth1.9
...
eth0.199 <-> br199 <-> br9

In this case, br9 is nothing more than a collector from all the other 
bridges.

It's the interaction between eth0.<VID> and br<VID> that has to do the 
filtering.

When you don't want to monitor traffic on say, eth0.123, simply remove 
it from br123.  Doing so will cause br123 to disable (but not remove) 
its self which will cause br9 to disable the port that is br123.  - 
Then when you want to monitor eth0.123, re-add it to br123, causing 
br123 to re-enable, causing br9 to re-enable br123's port.

Using br9 to aggregate all the VLANs together will also make it easier / 
less load to make sure that you don't have inter-VLAN communications 
because only the traffic you are interested in will make it that far, 
not all the traffic that you are talking about.  Seeing as how there 
will be much less traffic, matching the EBTables rules to see what can 
talk to what (for br9) will be much less load on the system.

Something to think about.



Grant. . . .
