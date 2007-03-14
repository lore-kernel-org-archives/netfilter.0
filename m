From: "afshin lamei" <afshinlamei@gmail.com>
Subject: https on non-standard port
Date: Wed, 14 Mar 2007 10:23:30 +0330
Message-ID: <3115d56e0703132353l6773de8av8dcc7db10c618553@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=srUx2tOf3sblD5B8NDoJxkpadNm+6EMjvbt9xAhKW30HYqwWNZbm8A2ex/Tc9Ey0uET3OQZf6z/zeFG8nEuff6V+7ntDzBm8R0rBqVULObH1Ytiz18Cgfq3mJ9uZFW9wuF2aqdMJ5t10B7H6kcCPzxCTIcPR9fte1rBsJsjU9Fw=
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

Dear all,
I'm trying to detect the HTTPS traffic which is not on port 443. As
I've seen in Layer7 documents at http://l7-filter.sourceforge.net
there is no a predefined pattern for that.
How can I detect it using iptables matches such as "-m string" or
anything else?
regards
afshin

