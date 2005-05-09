From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: ICMP rule for stateful firewall
Date: Mon, 9 May 2005 14:15:51 +0400
Message-ID: <9927912d05050903154ad4c3f6@mail.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
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

Hi to all,

I wanted to ask if such a rule was possible:

iptables -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d
192.168.10.0/24 -m state --state NEW,ESTABLISHED,RELATED -p icmp
--icmp-type echo request -j ACCEPT

Regards,
Visham

