From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Thu, 8 Jan 2004 21:07:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401082107.37792.Antony@Soft-Solutions.co.uk>
References: <FE0E2967-4215-11D8-AFEE-000393677A36@porchlight.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FE0E2967-4215-11D8-AFEE-000393677A36@porchlight.ca>
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

On Thursday 08 January 2004 8:05 pm, Peter Schobel wrote:

> ok, I downloaded the source ball for iptables 1.2.9, and compiled using
>
> make KERNEL_DIR=/usr/src/linux-2.6.0-1.107
>
> i got an error from config.h telling me to use the glibc version so i
> symlinked /usr/src/linux-2.6.0-1.107 to /usr/include/linux/config.h

I'm not sure I like the implications of this - what version of the kernel 
headers do you have in /usr/include/linux?

> then i compiled successfully and installed using
>
> make install KERNEL_DIR=/usr/src/linux-2.6.0-1.107
>
> without incident

> testing it reveals that it is still not working - did i do anything
> wrong in the above steps? what further steps would you recommend to
> troubleshoot this problem?

Hm.   I'm not sure I can help further with this, but I know there are other 
people on this list (Alistair?) who have been through this process and may be 
able to offer more help than I can.

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


