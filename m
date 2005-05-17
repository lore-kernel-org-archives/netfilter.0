From: Pablo Neira <pablo@eurodev.net>
Subject: Re: conntrack_ftp: partial 227
Date: Tue, 17 May 2005 13:48:47 +0200
Message-ID: <4289DA1F.6030200@eurodev.net>
References: <1403218a050517012716f22d7f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a050517012716f22d7f@mail.gmail.com>
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
To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Mohamed Eldesoky wrote:
> kernel: conntrack_ftp: partial 227  1874320463+13
> 
> What does this line mean in the /var/log/messages ???

The FTP conntrack helper has found a partial matching when parsing a 
request to start a connection in passive mode (ie. needs missing 
information to track that connection, malformed packets, ...). In that 
case such packet is silently drop.

--
Pablo

