From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Rejecting udp
Date: Wed, 5 Mar 2003 00:51:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030305005105.3ed844e1.arnt@c2i.net>
References: <000801c2e1aa$3fc8f660$0200a8c0@klintan.local>
	<003f01c2e1e2$2d9bd100$0301a8c0@hotpop3>
	<33803.192.222.90.38.1046775610.squirrel@pelorus.org>
	<1046777181.3924.1.camel@raylinux.internal>
	<39942.192.222.90.38.1046784694.squirrel@pelorus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <39942.192.222.90.38.1046784694.squirrel@pelorus.org>
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

On Tue, 4 Mar 2003 08:31:34 -0500 (EST), 
"Skip Morrow" <skip-lists@pelorus.org> wrote in message 
<39942.192.222.90.38.1046784694.squirrel@pelorus.org>:

> I agree that it is important to block certain UDP ports/traffic.  What
> the issue is, is what is the purpose of REJECTing a UDP packet versus
> DROPping the UDP packet?  My point is, sending back a REJECT message
> doesn't make sense with UDP.

..I agree.  In my response to Athan, I was thinking tcp.  
And for testing, and developing sniffers, you sniff everywhere 
anyway.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



