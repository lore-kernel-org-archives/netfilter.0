From: "Steve Jones" <sjones@ftdata.com>
Subject: RE: General denial question (tarpitting)
Date: Fri, 26 Mar 2004 12:05:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <79C037414A4B604CA73F5222570C6DFC8049@e2k3.ftdata.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Anyone got TARPIT working on Kernel 2.6.x?  POM says it's only for 2.4.x
Kernels (and I can't seem to get it working on my stock RH9 machine)

I'd be grateful for any info on this!

Thanks!
-Steve

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Daniel Chemko
Sent: Thursday, March 25, 2004 11:41 PM
To: David Nicol
Cc: Charlie Brady; qpsmtpd ML; netfilter@lists.netfilter.org
Subject: Re: General denial question (tarpitting)

Check out the Patch-o-matic enhancements to netfilter.
TARPIT? Check.

David Nicol wrote:

>
>
> Charlie Braddy wrote, on the qpsmtpd list, which is about
> a perl drop-in replacement for qmail-smtpd:
>
>> If you are going to undertake the noble task of sucking up their=20
>> bandwidth, then I'd suggest that you do the job thoroughly, and make=20
>> sure that their TCP stack decides to retransmit as many packets as=20
>> possible. Use iptables (for instance) to selectively/randomly drop=20
>> packets.
>
>
> That's brilliant!  does iptables have a TARPIT target that causes
> the peer to retransmit as much as possible? Can we add one?
>
> CC to netfilter@lists.netfilter.org, the iptables discussion list.
>




