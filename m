From: "pheusion@snet.net" <pheusion@snet.net>
Subject: Re: Installing patch
Date: Fri, 19 Dec 2003 15:55:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071867328.30101.58.camel@GenMicroSys>
References: <Pine.SOL.4.51.0312181413325.3485@herald.cc.purdue.edu>
Reply-To: pheusion@snet.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.51.0312181413325.3485@herald.cc.purdue.edu>
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
To: Bingrui Foo <foob@purdue.edu>
Cc: netfilter@lists.netfilter.org

This file looks like it will install with the patch command
something like:

patch -p0 < the-patch-file
(or just patch <filename>)

Also there is POM, Patch-O-Matic.
I would recommend using this, although it takes some setting up.


On Thu, 2003-12-18 at 14:13, Bingrui Foo wrote:
> Hi,
> 
> Could somebody teach me how to install the patch-iptables-1.2.8-1.2.9.bz2?
> 
> Thanks.
> 
> 


