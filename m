From: Christian Hammers <ch@westend.com>
Subject: Re: /proc/net/ip_conntrack filling without ipt_conntrack.o loaded?
Date: Tue, 14 Jan 2003 17:01:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030114160134.GC6664@westend.com>
References: <20030114093711.GC9940@westend.com> <20030114121232.GA3362@westend.com> <1042551825.465.143.camel@xbox> <20030114150641.GB23431@westend.com> <1042559354.464.770.camel@xbox>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1042559354.464.770.camel@xbox>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Filip Sneppe <filip.sneppe@cronos.be>
Cc: netfilter@lists.netfilter.org

On Tue, Jan 14, 2003 at 04:49:14PM +0100, Filip Sneppe wrote:
> If *all* your traffic is essentially asymetric in
> nature, you'de be better off not using ip_conntrack at all...

Yes, thought so, too. - The question that I was trying to ask in this
thread was, why the /proc/net/ip_conntrack is filled by the kernel
although I *already did* remove the module!

I would have guessed that just after I removed the ipt_conntrack module
and all the sub modules (ipt_conntrack_ftp, nat etc) the
/proc/net/ip_conntrack would either vanish or at least return nothing
because the code at the other end of the virtual device has gone.

But apparently it did not go away so I suspected a kernel function that=20
was fogotten to free or similar...

bye,

-christian-


--=20
Christian Hammers             WESTEND GmbH  |  Internet-Business-Provider
Technik                       CISCO Systems Partner - Authorized Reseller
                              L=FCtticher Strasse 10     Tel 0241/701333-11
ch@westend.com                D-52064 Aachen              Fax 0241/911879


