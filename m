From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables jump to userdefined chain and ESTABLISHED,RELATED
	rules
Date: Sun, 12 Oct 2003 17:15:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065971736.4917.33.camel@elendil.intranet.cartel-securite.net>
References: <20031010132641.2591d3b5.netfilter@lucassen.org>
	 <1065889564.1268.11.camel@elendil.intranet.cartel-securite.net>
	 <1065971435.1278.108.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065971435.1278.108.camel@alpha.newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: firewalldude@newkirk.us
Cc: netfilter@lucassen.org, netfilter@lists.netfilter.org

Le dim 12/10/2003 =E0 17:10, Joel Newkirk a =E9crit :
> > PS : there's no RELATED packets in HTTP ;)
> Not precisely true - there are ICMP messages that may arrive in respons=
e
> to HTTP requests that are RELATED.

Absolutely true. Should have been more precise.

I was meaning no RELATED on TCP/80 using HTTP, so first case WWW_CH
chain would never see a RELATED packet :

${IPT} -A INPUT -p tcp --dport 80 -j CH_WWW
${IPT} -A CH_WWW -m state --state ESTABLISHED,RELATED -j ACCEPT

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

