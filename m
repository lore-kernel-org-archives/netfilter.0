From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: P-O-M and string matching
Date: 04 Apr 2003 23:30:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049491816.25168.100.camel@tux.rsn.bth.se>
References: <20030404210424.80582.qmail@web40203.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030404210424.80582.qmail@web40203.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: nml <netfilter@lists.netfilter.org>

On Fri, 2003-04-04 at 23:04, SBlaze wrote:

> OK what I was trying to say is that... I applied a few patches.. the quota,
> time and string patches with the patch o matic to the kernel source I got from
> kernel.org... Of thosee three that I applied... only two show up when I go back
> in to a make menuconfig for  the kernel to select as modules. The string
> matching  option just simply is NOT there...while the other TIME and QUOTA
> options are there and can be selected to compile as modules.
> 
> I have not tried to compile those options in to the kernel... since the main
> purpose for a compilation of a new kernel would be to add the STRING option. I
> do not understand why the option does not appear in the make menuconfig when
> the opther quota and time options appear fine...
> 
> Does this give you a better understanding of the problem?

Did you enable CONFIG_EXPERIMENTAL ?

-- 
/Martin

