From: Jason Opperisano <opie@817west.com>
Subject: Re: bad ftp speeds through nat
Date: Mon, 22 Nov 2004 10:04:12 -0500
Message-ID: <20041122150411.GA30543@bender.817west.com>
References: <0e2d01c4d092$b8c13950$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <0e2d01c4d092$b8c13950$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

On Mon, Nov 22, 2004 at 08:56:44AM -0400, Peter Marshall wrote:
> I am not sure what is causing this ... I have an ftp server in my DMZ.  I am
> getting horrible ftp speeds ... only 200 - 300 KB/s  ... I have 10/100 cards
> on both the firewall and the ftp server and they are connected with one 100
> Mb switch. If anyone has any ideas as to why this is happening I would
> appreciate the wisdom.

have you base-lined the environment?  does FTP through the firewall with
no rules loaded and just IP forwarding enabled allow for significantly
higher throughput?  how about a machine locally in the DMZ directly to
the FTP server, what's that throughput look like?

-j

--
"It's not easy to juggle a pregnant wife and a troubled child, but
 somehow I managed to fit in eight hours of TV a day."
        --The Simpsons

