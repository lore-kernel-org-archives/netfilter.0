From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Determine the netfilter load
Date: Mon, 8 Jan 2007 21:43:59 +0100
Message-ID: <003d01c73365$b95afd50$0101000a@tanjian>
References: <64de5c8b0701072336q6ff16d57ra2ba56cde9cbf0dd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64de5c8b0701072336q6ff16d57ra2ba56cde9cbf0dd@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

> I have a netfilter firewall which is running at around 20k packets per
> second. I want to know how much load the current packet rate is
> causing to the server? The usual w does not give any thing. More
> importantly how do I know if this packet rate is hitting or about to
> hit any limits? How much more pps will my system take?

Maybe atop has what you need.
http://www.atcomputing.nl/Tools/atop


Grts,
Rob


