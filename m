From: Thomas Lussnig <thomas.lussnig@bewegungsmelder.de>
Subject: pptp + iptables MTU ???
Date: Fri, 13 Sep 2002 19:00:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8219B0.7070309@bewegungsmelder.de>
References: <20020913173529.41af8435.pulsar@bofh.homeunix.org>
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
To: Alexey Sheshka <pulsar@bofh.homeunix.org>, netfilter@lists.netfilter.org

Hi,
i have one question, when TCP packet's where send the filter change the 
MTU sice (T-Error.com problem)
But i do not acivate such an rule for UDP or GRE Protocol. Is it 
possible that this is the source for the
problems with pptp conection over an maserading server ?

Cu Thomas


