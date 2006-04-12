From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: patch-o-matic no password for the samba.org ftp using cvs
Date: Wed, 12 Apr 2006 21:58:12 +0200
Message-ID: <001201c65e6b$6ea0c760$0101000a@sterenborg.info>
References: <BAY112-F3122170C3E7B2D3DBACE9099C20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY112-F3122170C3E7B2D3DBACE9099C20@phx.gbl>
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
To: netfilter@lists.netfilter.org

> I'm sorry if this is not the correct place to post.
> 
> http://www.collaborium.org/onsite/benin/docs/services/NETFILTE
> R_RELATED/netfilter-extensions/netfilter-extensions-HOWTO-2.html
> 
> the above HOWTO says to use cvs to get the latest patch-o-matic tree.
> Unfortunately it now requires a user password. Can anyone
> tell me where else I can get the p-o-m or the password please

ftp://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/

I had a quick look at the HOWTO and it's not really up-to-date I think.
POM has been followed up by POM-ng. Further, the HOWTO talks about "make
patch-o-matic" and AFAIK that's not in use anymore. You can now patch
the kernel and iptables source like this :
KERNEL_DIR="/path/to/kernel_src" \
IPTABLES_DIR="path/to/iptables_src" \
./runme <basic|extra>


Gr,
Rob


