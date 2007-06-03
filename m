From: Gardner <gbickford@gmail.com>
Subject: Enforce Per User IP Traffic Quota
Date: Sun, 3 Jun 2007 18:55:04 +1200
Message-ID: <980676420706022355x3d0e9cfap2be074cef08396b8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=Z4dtUoSFl2vHd7k4CdnqL/yv4QOBTg2g6bX6ujV3zEGKCF9pdIDf44kFmaz5TuPTDSSeA+DHXOdUPeuyaDo/TvHX3W/SoLJNudlyE/WStWbYz8vHXnzPgv1F+Css3yw56pmlgbZGV5yAUzoWQEwwI1mHLp+DHaVvkoDwY6m853A=
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

Hello,
  I have been searching for a way to limit certain users to a certain
amount of IP traffic per month. So far I have found the quota
extension but it seems very simple in the way that it tracks traffic.
I would like to be able to save the quota data to disk every hour or
so in case the machine goes down and automatically add a filter. I am
also concerned that inbound traffic will not match the owner filter.

Am I attempting to use the incorrect tools? What is the best way to
enforce a per user ip traffic quota?

Thank you,
  Gardner

-- 
http://psychicblast.com/gardner-public-key.txt

