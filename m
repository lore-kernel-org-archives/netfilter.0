From: Michele Vetturi <michele.vetturi@iritaly.org>
Subject: Re: not sure ESTABLISHED TCP traffic will have ACK flag set
	always...
Date: Fri, 8 Apr 2005 22:52:24 +0200
Message-ID: <20050408205224.GA15635@vetz.homelinux.org>
References: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Apr 08, 2005, someone also known as Christian Seberino wrote:
> 2. One side sends LESS packets then the other! --
>    fast side doesn't have enough incoming to ACK either!

This problem is resolved by the TCP window? Am I right?


> Agree? Why then do people say to drop non-ACK'd packets
> as suspicious??.... I would think it would be common
> for one side to send more packets then the other.  I could
> be wrong.


One side CAN send more packets.


-- 
[ Michele Vetturi
  --------------------------------------------------
  IRItaly.org and Honeynet.it member
  PGP key available at:    http://vetz.homelinux.org ]

