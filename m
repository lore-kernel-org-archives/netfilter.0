From: Jason White <jdw-netfilter@jdwhite.org>
Subject: Re: Forcing source port with NAT
Date: Mon, 23 Jun 2003 16:44:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030623214422.GC28900@jdwhite.org>
References: <20030623200247.GB28900@jdwhite.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030623200247.GB28900@jdwhite.org>
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
To: netfilter@lists.netfilter.org

On Mon, Jun 23, 2003 at 03:02PM -0500, Jason White wrote:
[...]
>Basically, I need to ensure that anything coming in on 200.200.200.200:2104
>goes to 10.0.0.2:2104 and anything going out from 10.0.0.2:2104 goes out
>200.200.200.200:2104.
[...]

  Answering my own post, the following worked:

iptables -t nat -A POSTROUTING -p udp -s 10.0.0.2 --sport 2104 -j SNAT
  --to 200.200.200.200:2104

-- 
Jason White (jdw-netfilter@jdwhite.org)  http://www.jdwhite.org/~jdwhite
Jabber:jdwhite@jabber.org  IRC:irc.netbsd.org/{jdwhite,jdw}
AIM:jdwhite90125  Yahoo:jdwhite89  ICQ:9295078  MSN:jdwhite89@hotmail.com
GPG KeyID: 0x74CF850D/1F57 465A 1357 BA39 2BEF  5629 6E1C 2B20 74CF 850D

