From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: NEW vs INVALID
Date: Tue, 01 Oct 2002 11:05:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D996546.3070408@fugmann.dhs.org>
References: <m2elbb4w7h.fsf@pcwi1068.uni-muenster.de> 	<3D98620B.2070707@fugmann.dhs.org> <1033462154.878.17.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Cedric Blancher wrote:
> By the way, I was wondering why --syn was "only" equivalent to :
> 	--tcp-flags SYN,ACK,RST SYN
> 
> And not to :
> 	--tcp-flags SYN,ACK,RST,FIN SYN
> 
The tcp-flags would then not match packets with the SYN & FIN bits set, 
which is actually connection request, with should be closed immdiatly 
after opening. The syn-fin is widly used to scan hosts, and should be 
dropped. But still - it is a connection request and should therfore be 
caught by --syn.

Regards
Anders Fugmann

-- 
Neo: 'Can you fly that thing?'
Trinity: 'Not yet'.
$ apt-get install pilot-prg-v212helicopter.


