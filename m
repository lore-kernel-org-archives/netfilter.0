From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: --match recent
Date: Mon, 11 Jun 2007 13:28:21 -0500
Message-ID: <466D9445.5080101@riverviewtech.net>
References: <mnet1.1181553816.24811.olivierk@club-internet.fr>	<466D5578.8070905@riverviewtech.net>
	<20070611181213.GA12937@vvma.net>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070611181213.GA12937@vvma.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 06/11/07 13:12, Olivier wrote:
> I intend to count/limit only connection initiations, leaving alone the
> rest. I can't figure out where I catch more than I think I catch.

What is your FORWARD chain's default policy?

What does netstat have to say about the connection(s)?



Grant. . . .

