From: "Arif Mahmood" <arif786@rogers.com>
Subject: RE: Upgrade Iptables...
Date: Mon, 16 Sep 2002 18:41:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003101c25dd2$31ec24b0$3a00a8c0@am>
References: <000e01c25dc3$6d7d0170$d201a8c0@hornet>
Reply-To: <arif786@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c25dc3$6d7d0170$d201a8c0@hornet>
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

Thanks, I'll give a try...

Thanks and Best Regards,
Arif
 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Raj
Wurttemberg
Sent: Monday, September 16, 2002 4:56 PM
To: netfilter@lists.netfilter.org; arif786@rogers.com
Subject: RE: Upgrade Iptables...



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




