From: Simon Cocking <mowog@optushome.com.au>
Subject: ipt_iplimit unresolved symbols
Date: Thu, 06 Mar 2003 12:04:58 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E669EBA.5010508@optushome.com.au>
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

Hi all,

Has anyone successfully compiled and implemented iplimit against a 
recent RedHat kernel?

Specifically, I'm trying to apply the iplimit patch from pom-20030107 to 
RedHat's 2.4.18-24.7.x sources, and while I can get it to compile I get 
the following error during the 'make modules_install' phase:

depmod: *** Unresolved symbols in 
/lib/modules/2.4.18-24.7.x+iplimitsmp/kernel/net/ipv4/netfilter/ipt_iplimit.o
depmod:         ip_conntrack_find_get

I've been bashing my head against this for almost a week.. any insight 
would be appreciated :o)

Cheers,

Simon.


