From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Thu, 8 Jan 2004 17:35:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401081735.04719.Antony@Soft-Solutions.co.uk>
References: <1F244D88-4200-11D8-AFEE-000393677A36@porchlight.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1F244D88-4200-11D8-AFEE-000393677A36@porchlight.ca>
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

On Thursday 08 January 2004 5:28 pm, Peter Schobel wrote:

> On Thursday, January 8, 2004, at 12:02  PM, Antony Stone wrote:
> > On Thursday 08 January 2004 4:56 pm, Peter Schobel wrote:
> >> I have a server that was running a transparent redirection proxy - i
> >> was using 2.4.20 kernel on this system and i recently upgraded to
> >> 2.6.0.107 kernel package for redhat 9
> >>
> >> Ever since i did the kernel upgrade the proxy does not work correctly.
> >
> > Have you recompiled the userspace iptables to match the new kernelspace
> > netfilter?
>
> No, I hadn't considered this. - I am using an rpm package
> iptables-1.2.7a-2 - do you think this could be the problem?

Yes, I do.   The kernelspace netfilter and the userspace iptables must match 
in order for the two to work together.

> > Does Squid seem to work correctly as a proxy if you configure your
> > client
> > browser to use it specifically, rather than doing it transparently?
>
> yes it works perfectly on port 80 as well as on port 3128 so the
> redirection seems to be working - but the transparency does not

That quite satisfactorily demonstrates that networking and Squid are not the 
problem then, so it's definitely netfilter/iptables.

Just recompile iptables with your new kernel (and its associated header files) 
installed, and you should be back to normal.

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


