From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Intercept name lookup discover SA and alter reply?
Date: Fri, 20 Sep 2002 22:33:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920213318.TKBX295.mta06-svc.ntlworld.com@there>
References: <86E43FEDC7E2D411B9610002A50900EB881B7D@ddsmttayz076.ref.whs.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <86E43FEDC7E2D411B9610002A50900EB881B7D@ddsmttayz076.ref.whs.mil>
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

On Friday 20 September 2002 8:45 pm, Vosburgh, Brian P, CTR, WHS-BB wrote:

> I've seen iptables used to block SPAM via dnsbl so I'm wondering... can
> iptables watch UDP 53, inspect for a specific name query
> (server.company.com), remap the address to a closer server?

Well, you could certainly create a NAT rule which looks for connections to 
UDP (&TCP?) port 53 to a specific IP address (= a specific server), and 
redirect them to anyting you liike, really.

Is that helpful ?

> It would be even better if iptables would know (via TCP connect) if the
> alternate server were up or down and if down resort to the main server.

Surely you can rely on your DNS resolver to do this for you ?   If you set up 
multiple DNS servers and the first doesn't respond, the next will 
automatically be tried...?

Antony.

-- 

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.

