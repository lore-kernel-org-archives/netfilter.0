From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Firewall blocking FTP
Date: Mon, 15 Sep 2003 11:54:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309151154.09370.gdh@acentral.co.uk>
References: <Pine.LNX.4.44.0309112016190.3734-100000@shortcircuit.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0309112016190.3734-100000@shortcircuit.dyndns.org>
Content-Disposition: inline
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

On Friday 12 September 2003 03:19, Dan Egli wrote:
> All seems to work fine, EXCEPT that I
> cannot connect to ftp servers using the pasv method. 

Ensure you are loading the ip_nat_ftp and/or ip_conntrack_ftp modules, since 
this will watch on port 21 for the relevant FTP PORT/PASV commands and
open ports accordingly.

> P.S. I'm not subscribed to the list, so please CC me on your replies.

Too bad...

Cheers,
Gavin.

