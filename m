From: Roman Medina-Heigl Hernandez <roman@rs-labs.com>
Subject: Packet "multiplier" with iptables
Date: Tue, 22 Feb 2005 18:35:49 +0100
Message-ID: <421B6D75.8000606@rs-labs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I'd like to achieve some kind of "multiplier effect" with Iptables, i.e,=20
  when a packet (not all IP packets, only those matching some criteria)=20
arrives, iptables must generate N similar packets and send them to N=20
different IP destination addresses. It would be some kind 1-N DNAT, but=20
not in a round-robin fashion but generating N identical copies of the=20
packet).

Is this possible with some experimental iptables target?

Regards,
-Rom=E1n

