From: "Jay Sprenkle" <jsprenkle@gmail.com>
Subject: iptables/mac address filtering question
Date: Sat, 11 Aug 2007 12:46:51 -0500
Message-ID: <1b5f39a10708111046w55a4b00axb39c018a0ab54fb9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=XrfEiynfGrrO4HJLPSh6pIgsamd9Pr1PfA8VsTTnMdKs/RgLxbE9IRmb88p4900bgemJHMdEye64uRJq0Zjs0iXrtE9/zhIr7ETwPQP0AFc0OcvZC+f+1VvIZ+8M7px7zpRZzTvHW7BzwTMrI5/w8q9MzzLSG2rCRR+5XowIkNk=
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Good morning all,

I'm already aware mac address is easily spoofed but I'd like to make
it just a little bit harder to break into my system anyway. I'm trying
to only allow a specific box to use scp to safely transfer data over
the internet.

I've put in a rule in my iptables chain but notice when I try to
connect it's rejected. The mac address I'm getting is not the same as
what iwconfig reports on my device. If a packet is passed through
routers on it's way to my box do they change the mac address of the
packet?

Any suggestions would be welcome.

Have a good weekend

