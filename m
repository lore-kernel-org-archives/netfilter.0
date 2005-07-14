From: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Subject: Re: Doubt about forwarding. Please, Help me!
Date: Thu, 14 Jul 2005 16:20:20 -0300
Message-ID: <f48e768e0507141220855fec5@mail.gmail.com>
References: <20050714191101.230C61F50B1@ws1-2.us4.outblaze.com>
Reply-To: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050714191101.230C61F50B1@ws1-2.us4.outblaze.com>
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
To: Morales Carlos <cmmorales@mail.com>
Cc: netfilter@lists.netfilter.org

iptables -t nat -A PREROUTING -p tcp --dport 8888 -i eth1 -d EXT_IP -j
DNAT --to INT_IP

and the rule to allow the packet back=20

iptables -t nat -A POSRTOUTING -s INT_IP -p tcp --sport 8888 -j SNAT --to E=
XT_IP


simple, with this two single rules you can redirect the port to your
internal host

best regards=20

--=20
Glaucius Djalma Pereira Junior
glaucius@gmail.com

