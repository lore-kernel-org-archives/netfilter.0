From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: IPTABLES vs Checkpoint
Date: Wed, 27 Nov 2002 01:11:44 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021127011144.C14289@funkyjesus.org>
References: <1038349954.22977.34.camel@tux.go-nix.ca> <000801c295a2$4a9cb620$0100a8c0@covert.tdyc.com>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000801c295a2$4a9cb620$0100a8c0@covert.tdyc.com>; from rkrusty@tdyc.com on Tue, Nov 26, 2002 at 04:19:36PM -0700
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Nov 26, 2002 at 04:19:36PM -0700, Ivan E. Moore II wrote:
> >AFAIK Checkpoint is not a firewall at all, but a proxy server.  This
> >clearly means that it acts like a Web/FTP/whatever server that connects
> >people in your company to the outside world by requesting Web pages over
> >HTTP and initiating FTP connections on their behalf.
> 
> This is incorrect information.  Checkpoint offers proxy capabilities
> however by default it is a stateful firewall.

Seconded.  While Firewall-1 does have some proxy server like capabilities
its main function is as a stateful firewall.

-- 
FunkyJesus System Administration Team


