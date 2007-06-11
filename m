From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: --match recent
Date: Mon, 11 Jun 2007 09:00:24 -0500
Message-ID: <466D5578.8070905@riverviewtech.net>
References: <mnet1.1181553816.24811.olivierk@club-internet.fr>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <mnet1.1181553816.24811.olivierk@club-internet.fr>
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

On 06/11/07 04:23, olivierk@club-internet.fr wrote:
> I am trying to use the 'recent' module on an otherwise working 
> installation.

> So syntax seems to be... OK ;-), but I can't log in from the outside.

> Is there something obvious I am missing ? (I guess there is ;-)


Just a quick guess, but it looks like you are matching all SSH packets, 
not just those of a connection trying to be established.



Grant. . . .

