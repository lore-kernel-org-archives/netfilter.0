From: "Saifuddin Sharif" <sm.sharif@gmail.com>
Subject: Static IP mapping
Date: Fri, 15 Jun 2007 10:56:12 -0600
Message-ID: <696bf0280706150956m36bf043fj7d960ee73aa0e029@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=E7JQ12ITSOxTN6eDAyt59H+Yq6Bc4k61H16dNkupiaPrAYhxJLZBKQsUi+ZVMoKRivT7XA6ZQhXH66auTRZI2e0nYqhInj1jVtuHIXhptTLREzPmn6uCja4Tuy1JSx52D4jiYSPPt39XTdVeQhemqKWRos0JrFV8Ym08SYB02/g=
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>
Cc: eldesoky.lists@gmail.com

Dear Mohamed,

Assalamu Alaikum,

I am a new sys admin taking over from previous administrator who had
to leave before I got to know everything abou th esystem in my new job
.

How to I do static IP mapping for a windows server that is inside
private NW and should be reached from a public IP ?
is it like

arp -s Public-IP (MAC address of destination m/c in the private NW)
10.10.1.99(private NW machine)

Is that all ?

How do I do it for Linux machine ?

My understanding is it also can be done by fire wall, but I do not
administer the firewall.

Please suggest ASAP.

Sharif

