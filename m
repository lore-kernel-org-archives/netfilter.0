From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: FTP server
Date: Mon, 24 Mar 2003 16:49:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C93@hslex01.hslbz.local>
References: <1048517604.1188.10.camel@bordercollie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048517604.1188.10.camel@bordercollie>
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
To: 'Chris Garringer' <chris.garringer@tic.toshiba.com>, 'Netfilter List' <netfilter@lists.netfilter.org>

> morning a people could not list the directory , no PASV 
> connections were
> being accepted.  The connection attempts showed in the log .  

Are ip_conntrack_ftp and ip_nat_ftp loaded (if not in the kernel) ?


Rob


