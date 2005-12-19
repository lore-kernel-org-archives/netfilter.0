From: Marcin Krol <mark@wbp.krakow.pl>
Subject: Re: Firewall and a FTP server
Date: Mon, 19 Dec 2005 17:15:50 +0100
Message-ID: <13128294275.20051219171550@wbp.krakow.pl>
References: <b552223b0512190352v25209da9p7d3d685b58ea9e6d@mail.gmail.com>
Reply-To: Marcin Krol <mark@wbp.krakow.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-To: <b552223b0512190352v25209da9p7d3d685b58ea9e6d@mail.gmail.com>
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
To: TAC Forums <tac.forums@gmail.com>
Cc: netfilter@lists.netfilter.org

Hello TAC,

TF> We have a FTP server, (Red Hat Linux 7) behind a firewall, the
TF> firewall allows only incomming and established connections on ports
TF> 20,21  from any where and evry where.

TF> The Problem is, when the customers use FTP clients, the manage to
TF> login , but cannot upload/download files if they use PASSIVE FTP
TF> connections.

TF> Can smeone suggest, how the best way to get out of this situation,
TF> should we enable all ports above 1023?

If you use VSFTPD (recommended), there's a directive there that tells
the daemon to open a port from a selected range of ports - that should
be more secure.


-- 
Best regards,
 Marcin                            mailto:mark@wbp.krakow.pl



