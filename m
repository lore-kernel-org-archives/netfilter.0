From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: ftp server issue, trying to DL 1.2.7a
Date: Thu, 5 Sep 2002 14:33:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020905183311.GN7289@cannon.eng.us.uu.net>
References: <NEENJAPFEAIEMGMNIGFLMEKLCCAA.rwideman@austin.rr.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Rob <rwideman@austin.rr.com>
Cc: netfilter@lists.netfilter.org

On Thu, Sep 05, 2002 at 12:29:18PM -0500, Rob wrote:

> Anyone else having this problem?

Yes. I seem to have the same problem. Passive mode hangs and active mode
says "Connection refused".

Definitely a firewalling problem. Did they forget to load the ftp conntrack
module?

Ramin

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
> 
> thanks
> Rob
> 

