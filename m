From: Peng Gao <gao@lkn.ei.tum.de>
Subject: Destination NAT question
Date: Tue, 24 Sep 2002 18:47:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D90972C.70204@lkn.e-technik.tu-muenchen.de>
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
To: netfilter@lists.netfilter.org

Hi,

I am a student at Technical University of Munich.  I am doing my thesis 
about Netfilter.  

I set up the NAPT to do the Source Address Translation by the command:
iptables -t nat  -A POSTROUTING -p udp -o eth0 -j SNAT --to 1.2.3.4:1-1023

But my question is:
Could you please tell me the command to do the Destination Address 
Translation for the reverse direction (from the public network to 
private network)?

Thanks a lot!

Best wishes!

Peng Gao




