From: Anders Blockmar <anders.blockmar@exicom.se>
Subject: PPTP NAT using p-o-m and iptables 1.2.9
Date: Tue, 27 Jan 2004 14:29:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <51BBF03DCE32D111841800600857DA037CF461@lima.exicom.se>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi

I hope I'm not posting an aldready answered queston. I read a thread
regarding PPTP and NAT started by Joshua Jackson but I could not get that
soultion working, thats why I'm asking something simular.


I'm currently building a NAT firewall using the 2.4.24 kernel with the
latest p-o-m and iptables 1.2.9. I have applied Harald Weltes PPTP-patch but
I still can't get more than one PPTP connection thru the firewall (to the
SAME host) at once.

My goal is to make serveral PPTP-connection from different clients behind
the firewall to an external PPTP server. I am not always using the same
PPTP-server but must be able to make multiple connections to the same server
at once.

The only way I succeded in making multiple connections what to use the
round-robin function in SNAT, and then hoping that the FW would give my PPTH
connections different source ips.

Does anyone have any idea how I could get it work without having to use
multiple SNAT addresses? I have already tried building the modules into the
kernel intead of building them like modules (As sugested in the thread
started by Joshua) but that just gave me a kernel that would not compile.


regards,

Anders

