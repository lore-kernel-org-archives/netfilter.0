From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Destination NAT question
Date: Tue, 24 Sep 2002 19:49:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D90A59E.9020608@fugmann.dhs.org>
References: <3D90972C.70204@lkn.e-technik.tu-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peng Gao <gao@lkn.ei.tum.de>, netfilter@lists.netfilter.org

Peng Gao wrote:
> Hi,
> 
> I am a student at Technical University of Munich.  I am doing my thesis 
> about Netfilter. 
> I set up the NAPT to do the Source Address Translation by the command:
> iptables -t nat  -A POSTROUTING -p udp -o eth0 -j SNAT --to 1.2.3.4:1-1023
> 
> But my question is:
> Could you please tell me the command to do the Destination Address 
> Translation for the reverse direction (from the public network to 
> private network)?
$ iptables -t nat  -A PREROUTING -p udp -o eth0 -j DNAT \
      --to-destination 5.6.7.8

would make any udp connection going out on eth0 to be changed to have 
destination address 5.6.7.8.

Allthough this command is the "reverse" of SNAT, they do not have to be 
used in pairs.

Any responses for packets being SNAT'ed will automatically be un-NAT'ed,
because netfilter keeps track of all SNAT'ed connections and makes sure 
that replies comes back to the right sender.

The same goes for DNAT.

Regards
Anders Fugmann,



