From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Squid behind iptables
Date: Mon, 3 Mar 2003 03:28:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030303032840.1908598a.arnt@c2i.net>
References: <3.0.32.20030302214206.006cc1ec@int.efoa.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3.0.32.20030302214206.006cc1ec@int.efoa.br>
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

On Sun, 02 Mar 2003 21:42:07 -0300, 
Jose Sebastiao Martins <tiao@int.efoa.br> wrote in message 
<3.0.32.20030302214206.006cc1ec@int.efoa.br>:

> Is there a way to configure squid behind iptables? I'd like to prevent
> cached pages traffic thru iptables.

..'service squid stop', if you do _not_ want to use it.  But why???
Most people _want_ to use it, and the easiest way on your end users 
is set it up as a "transplarent proxy", search squid docs for that.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



