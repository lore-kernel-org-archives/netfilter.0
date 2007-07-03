From: "=?ISO-8859-1?Q?Martin_Schi=F8tz?=" <malinux@gmail.com>
Subject: NAT
Date: Tue, 3 Jul 2007 08:52:46 +0200
Message-ID: <e208f5d10707022352j39395f6awc172a563a8b0d4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=Ykm/0BcGCJA50r0XSLA2NaPmTxQ43T8L//A6+ZauSWMN9GEXZoM7R9tZ4lR0I/GVysWUdjUO8bA8CwbacIvphEyAizaI0eXm00UlozFDUnNeEQYFzyx8MXAerkOuIS6HB+TqIbcHJ8em+KjFSqv/gTy3e9D2u5DgGoTH5RnMG0k=
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
To: netfilter@lists.netfilter.org

Hi

I'm going to setup a bridged NAT linux box for many users. I want one
outside IP address to serve for instance 10.0.0.0/22.

I want to be sure that each local IP address always has 1024 NAT
sessions available and that sessions is kept even if the timeout is
reached. If 1024 sessions is reached and a new session is being
established then it will take over the oldest (timed out) session.

Is this possible with iptables?

- Martin

