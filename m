From: Dave Strydom <strydom.dave@gmail.com>
Subject: Re: ftp conntrack - nat problem
Date: Thu, 10 Nov 2005 12:16:41 +0200
Message-ID: <fc38b710511100216p4bd263a0oe84d8059f586cff8@mail.gmail.com>
References: <fc38b710511072303w6144c3a7i3068e781c871799d@mail.gmail.com>
	<fc38b710511090729n7ab1ba18r2734bcf4ce2c1441@mail.gmail.com>
	<fc38b710511090740s457f85adm94675c541e9072d4@mail.gmail.com>
	<200511090951.35603.rob0@gmx.co.uk>
	<fc38b710511090756t97d55acvda8f9383274073a8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fc38b710511090756t97d55acvda8f9383274073a8@mail.gmail.com>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

woohoo I found the problem.


in the proftpd.conf on the server behind the firewall you need to add
something like this to the proftpd.conf file:

---
MasqueradeAddress         209.212.xxx.xxx
PassivePorts                    60000 65535
---

then in the iptables:

$IPTABLES -t nat -A PREROUTING -d 209.212.xxx.xxx -p tcp --dport
60000:65535 -j DNAT --to-dest 192.168.0.xxx


Now it's working perfectly.

Dave

