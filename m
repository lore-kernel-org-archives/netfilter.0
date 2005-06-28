From: Jason Opperisano <opie@817west.com>
Subject: Re: unable to re-configure?
Date: Tue, 28 Jun 2005 08:50:47 -0400
Message-ID: <20050628125047.GA371@bender.817west.com>
References: <200506271025.32340.m.giggey@utoronto.ca>
	<20050627144030.GA16972@casa.e-den.it>
	<200506271102.31329.m.giggey@utoronto.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200506271102.31329.m.giggey@utoronto.ca>
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

On Mon, Jun 27, 2005 at 11:02:31AM -0400, Mike Giggey wrote:
> {nmap}
> [root@there]# nmap -sU -p U:1194  {ip of here}
> 
> Starting nmap 3.50 ( http://www.insecure.org/nmap/ ) at 2005-06-27 11:00 EDT
> Interesting ports on here (ip of here):
> PORT     STATE  SERVICE
> 1194/udp closed unknown

and:

  netstat -lnu

shows the machine listening on UDP port 1194?

-j

--
"Stewie: Well, I'd love to stay and chat, but you're a bitch."
        --Family Guy

