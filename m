From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: iptables SNAT and sip "REGISTER"
Date: Wed, 3 Sep 2003 19:46:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030903194627.25529b33.arnt@c2i.net>
References: <20030901082901R.zenkato@pis.bekkoame.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030901082901R.zenkato@pis.bekkoame.ne.jp>
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

On Mon, 01 Sep 2003 08:29:01 +0900, 
Zen Kato <zenkato@pis.bekkoame.ne.jp> wrote in message 
<20030901082901R.zenkato@pis.bekkoame.ne.jp>:

>            |.1           192.168.0.0/24
>       --------------------------------
>                    |.30(eth1,eth1:0 tel.no-ip.com)
>               -------------------
>               | RHL7.3          |

..ok.

>               | Linux-2.4.18-3  |
>               | iptables V1.2.5 |

..no way!  Go check http://rhn.redhat.com/errata/rh73-errata.html
and fix your RH box, if it _ever_ sees Internet or vice versa.

>               -------------------


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


