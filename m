From: Wasim Bashir <wasim.bashir@nexor.co.uk>
Subject: more than 1 source ip
Date: Tue, 26 Nov 2002 10:00:25 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c29532$a453bd50$e6353fc1@nexor.co.uk>
Reply-To: "wasim.bashir" <wasim.bashir@nexor.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,

how do i select more than 1 source IP, what i want to do is allow vnc access
to an internal win2k box from 2 different ip addresses, how do you do this,
at the moment i'm using :

/sbin/iptables -A PREROUTING -t nat -p tcp -s <outside IP> -d <ip of my
machine>  --dport 5800 -j DNAT --to 10.0.0.199:5800

Any help would be much appreciated.

Thanks

Wasim


