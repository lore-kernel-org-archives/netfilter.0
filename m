From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: pom error for contrack_nat_dependency
Date: 27 Mar 2003 00:22:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048720950.14736.129.camel@tux.rsn.bth.se>
References: <3E81FC2E.9080008@ucdavis.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E81FC2E.9080008@ucdavis.edu>
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
To: "Stephen Lawrence Jr." <slawrence@ucdavis.edu>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-03-26 at 20:14, Stephen Lawrence Jr. wrote:
> I ran the following command on a fresh tar of kernel-2.4.20:
> 
> runme --batch base
> 
> and got the following:
> 
> Testing patch pending/12_contrack_nat_dependency.patch...
> Failed to patch copy of /usr/src/linux
> TEST FAILED: patch NOT applied.

Known problem, it's a kernel 2.5 patch that somehow got in...
I'm waiting for confirmation that a backport of that patch will work for
2.4, then I'll add the one I made yesterday. It's not an important patch
at all so just ignore it for now.

-- 
/Martin

