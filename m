From: Sanjay Arora <skpobox@hotpop.com>
Subject: Routing an IP adress from a NATted interface..
Date: 19 Aug 2004 19:12:42 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092922962.10537.17.camel@Sewak.Asr.Lan>
Reply-To: skpobox@hotpop.com
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi all

My small cable ISP has a Linux box which is supposed to route my ip
addtress. Normally, he is issuing private space ips in address range
172.16.x.x. I have asked for a live IP and he has issued one,
202.x.x.139.

The problem is that he has other IP addresses on the same interface,
which are NATted to provide connectivity to 172.16.x.x. So when I get a
web request, my server logs 202.x.x.137 as the source IP, which is
actually my gateway on the ISP machine.

On the other hand when I send mail, my source ip from the other end
looks to be 202.x.x.130, which is again the ISPs IP.

It seems that despite being issued a live IP, my IP is being proxied
somehow or the source address is being mangled. The ISP does not seem to
have the expertise to route the IP properly ;-) and has told me either
to accept it, to tell him how is he supposed to do it or go back to
172.16.x.x address.

I myself am a ipfilter newbie. Can someone tell me how an IP is routed
on an interface which is providing NAT services on a second IP. Pointers
to resources for further reading on issues involved and any similar
scripts/samples will be greatly appreciated. (My ISP seems to talk about
pre-routing a lot....does not really tell exactly how he is pre-routing
the packets for my IP).

With best regards.
Sanjay.



