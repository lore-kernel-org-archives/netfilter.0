From: "Bailey Kong" <bailey@tgpsolutions.com>
Subject: RE: blocking Emails using ip address or domain name
Date: Wed, 9 Oct 2002 08:25:08 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <32793.192.168.1.2.1034177108.squirrel@mail.tgpsolutions.com>
References: <A0B5F46E38ADD411967800805F777E9830C116@colosrva.colosseum.com>
Reply-To: bailey@tgpsolutions.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A0B5F46E38ADD411967800805F777E9830C116@colosrva.colosseum.com>
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
To: dirrcher@colosseum.com
Cc: sun@percipia.com, netfilter@lists.netfilter.org

> iptables -A INPUT -p all -s <ip> -j DROP

since the mail server is natted shouldn't it be
iptables -t nat -A PREROUTING -s <ip> -j DROP ?

or

iptables -A FORWARD -s <ip> -j DROP

Best Regards
Bailey

-- 
bailey@tgpsolutions.com

Administrator, tgpsolutions
http://www.tgpsolutions.com



