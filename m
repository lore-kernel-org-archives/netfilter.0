From: "Ivan E. Moore II" <rkrusty@tdyc.com>
Subject: RE: IPTABLES vs Checkpoint
Date: Tue, 26 Nov 2002 16:19:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c295a2$4a9cb620$0100a8c0@covert.tdyc.com>
References: <1038349954.22977.34.camel@tux.go-nix.ca>
Reply-To: <rkrusty@tdyc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1038349954.22977.34.camel@tux.go-nix.ca>
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
To: "'Nix N. Nix'" <nix@go-nix.ca>
Cc: netfilter@lists.netfilter.org

>AFAIK Checkpoint is not a firewall at all, but a proxy server.  This
clearly means that it 
>acts like a Web/FTP/whatever server that connects people in your
company to the outside world >by requesting Web pages over HTTP and
initiating FTP connections on their behalf.

This is incorrect information.  Checkpoint offers proxy capabilities
however by default it is a stateful firewall.

Ivan



