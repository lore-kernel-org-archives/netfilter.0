From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: failure when using --string
Date: Fri, 27 Aug 2004 10:14:46 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040827091446.GH22322@metastasis.org.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC906420B@asimail2.alphanumeric.com>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC906420B@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Aug 26, 2004 at 06:54:21PM -0400, Jason Opperisano wrote:

> yup--most distros do not compile the string match (i *think* suse
> does).  try:
> 
> ls /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ipt_string.o
> 
> and make sure you have the actual module.  if not, grab p-o-m and
> follow the instructions:
> 
>   http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html

Yes, I thought that was the case, not seeing "string" anywhere in
/lib/modules... sorry, I should have said that I'd looked.

I'm not sure about upgrading netfilter on a distribution like Debian,
apt-get trundles along nicely, I'm kind of loathe to play.  Is anyone
else here using a more recent version of netfilter on Debian?

-- 
mors omnia vincit

