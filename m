From: JL-NEWS <nieuwsberichten@pandora.be>
Subject: iptables-NAT and MSN losing state
Date: Fri, 23 Jan 2004 21:45:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074890748.16844.4.camel@struct-sync>
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
To: netfilter@lists.netfilter.org

Hi,

For some time now i've attempted to get a mix of win/mac msn-clients to
get trough a netfilter-nat-box without being 'signed off' repeadetly.

Is there any resource on what to do in this situation ? It is damn near
impossible to find. AFAIR there used to be an issue with ssl or
msn-http-proxy wich was possible to fix by means of an echo > proc... to
increase the time-out but i'm not a netfilter-guru as such thus it is
unclear to me what to do next.

The setup is a 2.4.24-kernel with iptables 1.2.6a and reaim 0.8 with all
rules applied to enable msn-type traffic.

Please advise.

Best Regards,

J.L.


