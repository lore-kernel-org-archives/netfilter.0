From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp server issue, trying to DL 1.2.7a
Date: Thu, 5 Sep 2002 19:32:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209051832.g85IWIv01221@vulcan.rissington.net>
References: <NEENJAPFEAIEMGMNIGFLMEKLCCAA.rwideman@austin.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEENJAPFEAIEMGMNIGFLMEKLCCAA.rwideman@austin.rr.com>
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

On Thursday 05 September 2002 6:29 pm, Rob wrote:

> Anyone else having this problem?
>
>
> Connected to ftp.iptables.org (62.128.28.62).
> 220 ProFTPD 1.2.5rc1 Server (netfilter/iptables FTP site) [kashyyyk]
> Name (ftp.iptables.org:root): anonymous
> 331 Anonymous login ok, send your complete email address as your password.
> Password:
> 230 Anonymous access granted, restrictions apply.
> Remote system type is UNIX.
> Using binary mode to transfer files.
> ftp> dir
> 227 Entering Passive Mode (62,128,28,62,182,53).

Works fine for me in active mode:

drwxr-xr-x   2 ftpuser ftpgroup   4096 Jul 22 14:45 incoming
drwxr-xr-x   7 ftpuser ftpgroup   4096 Jul 24 07:36 pub

But like you, I can't get a listing in passive mode.....

Antony.

-- 

This email was created using 100% recycled electrons.

