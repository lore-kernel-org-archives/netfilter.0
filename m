From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: Tunneling FTP over SSH through an IPTables NAT/Filter setup...
Date: Wed, 23 Oct 2002 00:23:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021023002312.A8681@funkyjesus.org>
References: <3DB55231.6050802@canada.com>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3DB55231.6050802@canada.com>; from cpoupart@canada.com on Tue, Oct 22, 2002 at 09:27:13AM -0400
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
To: netfilter <netfilter@lists.netfilter.org>

On Tue, Oct 22, 2002 at 09:27:13AM -0400, Chris Poupart wrote:
> I am trying to tunnel FTP over SSH, as it sais in the subject, using 
> Dreamweaver MX as the FTP client and PuTTY as the SSH client.

FTP is a pretty evil protocol security wise, I'm not sure you can get it to
work over SSH unless you can really lock down the ports used by the FTP
client and server.

Why not use scp or sftp?

-- 
FunkyJesus System Administration Team


