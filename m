From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Geoip patch and its features
Date: Sun, 22 Apr 2007 11:12:41 +0200
Message-ID: <1814bfe70704220212w75466abeo663c7349586b6d99@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=BIKRIq+XWBRTw0Cy1YE68/h6KtCA5mDhPIO3wrINoQsrRS/myj+4CpIvySijgqcfNpZR9vgQ5FbN0iSHtc3f52hpqmmISYAF73XoyxBIPa2W3Gn1vEvqTdeptEvB4Neg3rBy/9oKjelm3W3yySFZiK0K/Qw5WvG98RXvBplLtnk=
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

last night I implemented geoip feature in my firewall. Using geoip I
can protect my firewall from any kind of traffic from particular
countries ( someone call id racism routing ). I am wondering now if
use this patch in combination with other iptables features will this
prevent for example different kind of attacks like dos, unauthorized
logging and so on. I know it is impossible to stop all attacks, but we
can maje their results smaller.  I think geoip is very good in cases
when you for example know that you are not going to log from  Bosnia
just simpli put Bosnian's IPs on black list.
What is your opinion about advantages and disadvantages of geoip patch.
I think it is very usefull.

Best wishes and regards

Elvir Kuric

PS : List of ip addresses which belong to particular countries is not
complete, and it will not be- I mean we can not know all addresses and
their mappings to countries.

