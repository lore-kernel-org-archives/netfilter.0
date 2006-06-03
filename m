From: Mogens Valentin <mogensv@vip.cybercity.dk>
Subject: Re: How stop DoS and SYN attack..
Date: Sat, 03 Jun 2006 23:54:53 +0200
Message-ID: <4482052D.8090409@vip.cybercity.dk>
References: <e32f231c0606031333s7ab57702y9a75cc62a3f96da0@mail.gmail.com>
Reply-To: mogensv@vip.cybercity.dk
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e32f231c0606031333s7ab57702y9a75cc62a3f96da0@mail.gmail.com>
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
To: Alberto Ferrer <albertoferrer@gmail.com>
Cc: netfilter@lists.netfilter.org

Alberto Ferrer wrote:
> =BFany know a way to stop via Linux with iptables or related a SYN atta=
ck ?
> =BFwhere i can read something related to this?

   # Enable syn-cookies (prevent syn-flood attacks):
     echo "1" >/proc/sys/net/ipv4/tcp_syncookies

   # Reduce number of possible SYN Floods:
     echo "1024" >/proc/sys/net/ipv4/tcp_max_syn_backlog

Helps somewhat. Can also be set via sysctl.
You may wan't to look into iptables docs for the 'limit' module:

   -m limit --limit X/sec

--=20
Kind regards,
Mogens Valentin


