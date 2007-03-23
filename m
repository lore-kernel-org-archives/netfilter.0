From: "Patrick Ale" <patrick.ale@gmail.com>
Subject: Limit connections per IP
Date: Fri, 23 Mar 2007 18:31:04 +0100
Message-ID: <8d158e1f0703231031g261ca993s7c9e4f3ef62108c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=GuN7TlnwbMLCACqqzuQVuJv9kPag88Z3YYNrgEw0AhXsItPu2LjgOuSINNkPcrzx66Q6efxfpdSDT/+0B4ECMsFRCvMYP53mKORm+TmLgYZUw4DEO3dytDjH5y8ASe3MjBbaECu7NqJCZf2bq5Mi+WIdDxExAjAPWCckRV7IguQ=
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

Hi all,

I want to limit the connections per IP on port 80 to 4.

I googled a lot and found several options, iplimit, connlimit-above..
But none of these seem to be available for me :(

I run kernel 2.6.21-rc4-git7 and also tried 2.6.20.3 with iptables
1.3.7 and the path-o-matic patch set.

Any ideas?


Patrick

