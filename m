From: Jason Opperisano <opie@817west.com>
Subject: Re: masquerade
Date: Thu, 14 Oct 2004 08:36:20 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097757380.1708.21.camel@wolfpack.ljm.dom>
References: <416D5AD0.6040405@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <416D5AD0.6040405@freemail.hu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-10-13 at 12:41, Janos Makadi wrote:
> Hi,
> 
> I`m absoulte newbie to netfilter, but last year I set up my debian 
> firewall. I tought it`s configuration is correct, but yesterday I found 
> http://audiymypc.com which shows my real ip address which I wanted to 
> hide. It shows the correct address too, but it seems my real local 
> address is visible on the internet somehow.

disable java in your web browser and re-run the test--they won't be able
to find your real IP address anymore.  they're probably either using
this code directly, or a similar technique:

  http://reglos.de/myaddress/MyAddress.html

none of this has anything to do with the configuration of your firewall.

-j

-- 
Jason Opperisano <opie@817west.com>


