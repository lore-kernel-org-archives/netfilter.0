From: Taso Hatzi <taso@soldator.com>
Subject: Re: DNATed packet not hitting FORWARD chain
Date: Tue, 23 Nov 2004 22:53:44 +1100
Message-ID: <41A324C8.4030708@soldator.com>
References: <9FB9C39FACF4034BB4AC7F89F2AEB0AB0159373A@win2k.aries.dpmg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9FB9C39FACF4034BB4AC7F89F2AEB0AB0159373A@win2k.aries.dpmg.com>
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
To: James <newsjn@dpmg.com>
Cc: netfilter@lists.netfilter.org

James wrote:
> 
> I'm having some trouble getting DNAT to work properly.  I have a gateway
> machine that has two different connections to the Internet, on eth1 and
> eth2.  I'm trying to allow inbound port 1723 to be forwarded to an internal
> PPTP server through both interfaces.  It works on eth2, but not eth1.
> Here's what I've got:
> 


Last time I had packets disappear on me for no obvious reason it turned out to
be a MSS issue and was fixed by turning on MSS clamping in the appropriate
places.


