From: =?ISO-8859-1?Q?Gr=E9gory?= <wajsg@esiee.fr>
Subject: Logs behind a transparent proxy
Date: Thu, 23 Jan 2003 17:20:04 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043338804.3e30163466b11@imp.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi,
I'd like to make a "really" transparent bridge using a proxy.
Though when  watching my logs on my server (behind the bridge), I
always get the proxy IP  (which is normal). I'd like to know if
there's an existing patch to iptables that could hide the proxy's
adress by putting back the real source adress when the traffic is
coming from Internet.

Gregory

