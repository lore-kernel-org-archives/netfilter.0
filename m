From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables permission problem in perl scripts
Date: Mon, 15 Aug 2005 04:17:12 -0500
Message-ID: <200508150417.12978.rob0@gmx.co.uk>
References: <3115d56e05081400344964ebcd@mail.gmail.com>
	<43002C64.3040101@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43002C64.3040101@riverviewtech.net>
Content-Disposition: inline
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

On Monday 2005-August-15 00:47, Grant Taylor wrote:
> Can we get an ls -l of the files in question?  What is the user that
> the web server is running as?

The OP said it was "nobody". It's not a file permission issue; it is
the fact that only root can manipulate the kernel's netfilter rules. 
SUID (messy and risky) or sudo(1) (clean and possibly less risky if 
done right) are really the only solutions.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

