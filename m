From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Should forwarded packets ever hit the OUTPUT chain?
Date: Fri, 8 Nov 2002 09:20:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021108092009.TZSK3711.mta02-svc.ntlworld.com@there>
References: <1036744310.2708.64.camel@trent.nin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036744310.2708.64.camel@trent.nin>
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
To: netfilter@lists.netfilter.org

On Friday 08 November 2002 8:31 am, alex wrote:

> As I understood it forwarded packets never went over the OUTPUT chain,
> the OUTPUT chain is only to filter what local processes send out.

That is correct.

> In trying to debug my firewall (see earlier message on the user list) I can
> see the final rule of my to-lan chain (attached to output) dropping
> packets when the incomming web connection hangs.

What are your FORWARDing rules ?

Antony.

-- 

Success is a lousy teacher.   It seduces smart people into thinking they 
can't lose.

 - William H Gates III

