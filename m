From: Alexis <alexis@attla.net.ar>
Subject: blocking msn 6.x
Date: Tue, 09 Dec 2003 14:13:40 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070990020.1958.16.camel@pepelui.baicom.com>
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

Hello, how can we block the use of the msn messenger with iptables?

ive tried blocking dport 1863, but the client tries then port 80 , port
443, and i cannot block those ports.

Then ive blocked some networks of M$ but i had to remove the rules
because some people uses hotmail.

Any help? (i think that packet inspection could see if the packet to
port 80 is a GET/POST or a different packet to mark.... but how can i do
this????)


any help??

Thanks in advance and best regards


-- 
Alexis <alexis@attla.net.ar>


