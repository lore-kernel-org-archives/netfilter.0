From: Khoa Nguyen <khoa.coffee@gmail.com>
Subject: RTSP conntrack examples
Date: Tue, 17 Jan 2006 12:33:43 -0500
Message-ID: <3d00e6dc0601170933t4c5e77dq18fd1772c6ad1d1e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Finnaly I managed to load ip_conntrack_rtsp and ip_nat_rtsp into my
2.6.9 kernel. I would like to SNAT each RTSP session, but it doesn't
seem to work right -- it only works for one RTSP session. I may have
configured iptables wrong. Appreciate if someone can send me a sample
config for rtsp or point out any errors in my iptables command below:

iptables -t nat -A POSTROUTING --protocol tcp --dport 554 -m state
--state NEW -j SNAT --to-source 10.9.0.1-10.9.0.10

 iptables -t nat -A POSTROUTING --protocol udp -m state --state
RELATED,ESTABLISHED -j SNAT --to-source 10.9.0.1-10.9.0.10


This box is acting as a router between RTSP client(s) and server(s)


Thanks,
Khoa

