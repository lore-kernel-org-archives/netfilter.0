From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP Rule Problem
Date: Tue, 3 Feb 2004 13:49:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402031349.22961.Antony@Soft-Solutions.co.uk>
References: <20040203132411.96455.qmail@web14004.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040203132411.96455.qmail@web14004.mail.yahoo.com>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Tuesday 03 February 2004 1:24 pm, Kiran Kumar wrote:

> --- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> > Never mind that, you're not allowed to respond to
> > ICMP packets with ICMP
> > errors.
> >
> > See RFC792 page 1.
>
>   Wrong. You are not allowed to respond to ICMP
> _errors_ with ICMP errors, what else does ping mean by
> giving error messages like "Destination Host
> Unreachable" ?.

Hm.   I was only quoting from RFC792: "The ICMP messages typically report 
errors in the processing of datagrams.  To avoid the infinite regress of 
messages about messages etc., no ICMP messages are sent about ICMP messages."

Perhaps this isn't quite as clear or specific as it should be?

Antony.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid user's mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


