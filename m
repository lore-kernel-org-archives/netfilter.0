From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: RE: gnutella
Date: Thu, 21 Oct 2004 11:12:09 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410211507.i9LF7JMI024896@jkcpub.iserver.net>
References: <f9a42cb404102107232273e04@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f9a42cb404102107232273e04@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Michel Bellemare' <michel.bellemare@gmail.com>, 'Netfilter Group' <netfilter@lists.netfilter.org>

Hello Michel,

You need layer7 functionality in iptables. There is a good pattern available
for matching gnutella packets with layer7 module. Using the MARK option and
traffic control (tc) you will be able to restrict the bandwidth consumed by
the application.

Here is the documentation on this module:
http://l7-filter.sourceforge.net/


Hope this helps!
Regards,

Deepak Seshadri


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Michel Bellemare
> Sent: Thursday, October 21, 2004 10:24 AM
> To: Netfilter Group
> Subject: gnutella
> 
> is there any way to log all the traffic that uses the gnutella protocol?
> i searched in the mailing list and google and found nothing.
> 
> I looked to at a tcpdump capture and it never uses the same port...
> 
> basically i want to control the number of bytes that goes out using
> this protocol.
> 
> thank you very much!



