From: "Danny Sung" <dsung@lantronix.com>
Subject: getting original destination after UDP REDIRECT
Date: Thu, 5 Oct 2006 12:23:12 -0700
Message-ID: <2F0FC2A92C0B154BB406D5E74CB3E6930336BD22@3putt.int.lantronix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Is there a way to get the original destination address/port of a UDP
packet that has been REDIRECTed?

I'm looking for the equivalent to the SO_ORIGINAL_DST flag for TCP.

I've seen some talk about this on the list about a year ago, but
couldn't find any resolution.  I've tried the faqs and general web
searches.  Miquel van Smoorenburg's recvfromto() function looked
promising, but didn't appear to work.

I'm running on a linux 2.6.12 kernel, btw.

Thanks,
Danny
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the =
person or entity to which it is addressed and may contain information =
that is privileged, confidential, or otherwise protected from =
disclosure. Distribution or copying of this e-mail, or the information =
contained herein, to anyone other than the intended recipient is =
prohibited.


