From: cmbb@dslr.net
Subject: Re[3]: iplimit module refuses to work
Date: Mon, 11 Aug 2003 14:12:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <159352501562.20030811141213@dslr.net>
References: <63349768828.20030811132640@dslr.net>
 <1060624988.728.6.camel@elendil.intranet.cartel-securite.net>
 <183352264796.20030811140816@dslr.net>
Reply-To: justin <justin@dslr.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <183352264796.20030811140816@dslr.net>
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
To: netfilter@lists.netfilter.org

CONFIG_IP_NF_MATCH_IPLIMIT=m

um, is there another secret hidden option, not checked, that has to be
turned on before the iplimit module will work, even though it compiles
ok as a module and can be insmod'd ok?

CB>> Is your running kernel built with iplimit support ?


