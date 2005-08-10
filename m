From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: event sequence: QoS + 2.6sec ?
Date: Wed, 10 Aug 2005 17:26:32 +0200
Message-ID: <42FA1CA8.7050303@lopsch.com>
References: <20050810115559.GA12617@pog.tecnopolis.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050810115559.GA12617@pog.tecnopolis.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Trevor Cordes schrieb:
> I'm using HTB QoS and 2.6sec (native 2.6 ipsec w/setkey) simultaneously. 
> What is the sequence of events for an outgoing packet?  I'm thinking the
> 2.6sec gets applied dead last, after the QoS scheduling has been done?  Or 
> does QoS get applied twice for a 2.6sec packet because it goes through 
> egress twice?
> 
> I could find no documentation on this subject, and it's actually quite 
> important when using both together.
> 
> 
AFAIK Traffic Shaping is the last thing done before packet leaves into 
the wire when applied on physical devices. But it depends on some 
things. You can use for example IMQ. Then depending on the strategy 
shaping is done before IPSec and before the shaping on the physical 
device if you apply shaping on it. Take a look at the LARTC mailing 
list. It's perhaps a better place for such questions.

