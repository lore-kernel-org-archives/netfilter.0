From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re: unexpected problem with DNAT
Date: Wed, 10 Jul 2002 16:55:38 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207101555.g6AFtj813062@vulcan.rissington.net>
References: <02071014505504.04513@Lms> <200207101443.g6AEhf812770@vulcan.rissington.net> <02071017494208.04513@Lms>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <02071017494208.04513@Lms>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Wednesday 10 July 2002 4:49 pm, Jan Humme wrote:

> On Wednesday 10 July 2002 16:43, Antony Stone wrote:

> > The mangle table might be your answer.

etc...........

> I don't get it: the source original addresses are only SNATted *after* the
> FORWARD chain has already been filtered, there is no need to (ab)use the
> mangle chain for this purpose? Or am I misunderstanding something?
>
> So he can directly create one rule in FORWARD chain to drop the packets;
> but his problem seems to be that he doesn't know which IP-addresses he
> wants to block.

Ah.   Okay then; in that case I misunderstood the problem and I gave an 
unhelpful solution.   Sorry.

If the original poster doesn't know what addresses s/he wishes to block, then 
I can't think of a netfilter rule which will help :-)

 

Antony.

