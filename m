From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re:Security question
Date: Mon, 1 Mar 2004 13:57:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403011357.04246.Antony@Soft-Solutions.co.uk>
References: <40433D7C.5080503@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40433D7C.5080503@stupar.homelinux.net>
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
To: Netfilter-List <netfilter@lists.netfilter.org>

On Monday 01 March 2004 1:41 pm, Sasa Stupar wrote:

> Thanx guys. Yes, I have a linux router. I have tested the solution one
> and looked at the console; there were a lot of "martians" on the nic's
> not intended for the source.

Indeed.

> What about the external threat on the solution 1?

Other customers of the same ISP (ie very close to your network in routing 
terms) might be able to send packets to your machiens using your private 
network address.

It might seem a bit unlikely, but there's an awful lot of packets out 
there....

Basically, I wouldn't do it that way.

> Internal users are unable to change anything since they don't have admin
> rights.

You hope :)

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


