From: "Raj Wurttemberg" <rajw@c64.us>
Subject: RE: Upgrade Iptables...
Date: Mon, 16 Sep 2002 16:55:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c25dc3$6d7d0170$d201a8c0@hornet>
References: <20020916201517.ONQE17905.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020916201517.ONQE17905.mta07-svc.ntlworld.com@there>
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
To: netfilter@lists.netfilter.org, arif786@rogers.com


> On Monday 16 September 2002 8:23 pm, Arif Mahmood wrote:
> > How do I do the  patch-o-matic, I mean if you send me the 
> steps to do 
> > patch-o-matic on RedHat 7.3.  I couldn't find the  patch-o-matic 
> > documentations.
http://www.netfilter.org/documentation/FAQ/netfilter-faq-1.html#ss1.5

Unfortunately that FAQ is out of date and now completely *incorrect* for
the new Patch-o-Matic (PoM). And on a RedHat type system even the
documentation included with the package does not work. :(

The proper procedure would be to set your environment variable for
KERNEL_DIR first. This is from a posting on 10-Sep-2002 by Fabrice
(Thank you Fabrice!)

# KERNEL_DIR=/usr/src/linux-2.4 ./runme pending
or
# export KERNEL_DIR=/usr/src/linux-2.4; ./runme pending

Of course be sure to set your KERNEL_DIR to the correct directory and
read the "INSTALL" file that comes with the PoM package to ser the
appropriate patch options. We should get the package maintainers to
correct the FAQ and the PoM dox.

/*Raj*/



