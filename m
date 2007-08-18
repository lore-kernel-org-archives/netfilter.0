From: Martijn Lievaart <m@rtij.nl>
Subject: Re: IPtables settings to access a backup FTP
Date: Sat, 18 Aug 2007 22:29:42 +0200
Message-ID: <46C756B6.4000003@rtij.nl>
References: <46C743CB.801@ghz.fr> <46C7539C.60002@rtij.nl>
	<46C755AE.4030804@ghz.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46C755AE.4030804@ghz.fr>
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
To: Richard <netfilter@ghz.fr>
Cc: netfilter@lists.netfilter.org

Richard wrote:

[ Please don't toppost. Thanks ]

> Hi I've got ip_conntrack running,

I was talking about ip_conntrack_ftp, not ip_conntrack. You need both. 
The difference is between ftp working and not working at the first LS 
command.

>
> My server hosts FTP accounts and I also need outgoing ftp ...

Clear, so you need the input rule on port 21 as well.

>
> No problems accessing the ftp hosted on this server, but can't do a 
> CWD (ls) from this server to another external ftp server unless the 
> firewall is disactivated.

No problems? Impossible with the rules you posted.

>
> I guess you are going to say most of my settings are useless but here 
> goes my current settings :

Thanks, but that is virtually unreadable. Post the output of 
iptables-save instead.

HTH,
M4


