From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: ip_conntrack
Date: Mon, 15 Sep 2003 18:48:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030915184815.401c3c79.arnt@c2i.net>
References: <000801c378a1$f6c24360$243902c4@weatherman>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c378a1$f6c24360$243902c4@weatherman>
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

On Thu, 11 Sep 2003 22:19:04 +0200, 
"Warren P" <weatherman@webmail.co.za> wrote in message 
<000801c378a1$f6c24360$243902c4@weatherman>:

> hi
> 
> does anyone know how to clear/flush the ip_conntrack table. Every 4 to
> 6 months i need to reboot my server because it drops packets and
> complains that the table is full ...

..dive into /proc/sys/net/ipv4/ and check your timeouts.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


