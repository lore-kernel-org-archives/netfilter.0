From: Joris Huver <j.huver@networking4all.com>
Subject: [Fwd: iptables dry rules testing]
Date: Tue, 08 Mar 2011 16:40:17 +0100
Message-ID: <1299598817.6050.3.camel@n4aworkstation>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-WDkmZqYy8wcgjwjdCPYX"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-WDkmZqYy8wcgjwjdCPYX
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-WDkmZqYy8wcgjwjdCPYX
Content-Disposition: inline
Content-Description: Forwarded message =?UTF-8?Q?=E2=80=94?= iptables dry
 rules testing
Content-Type: message/rfc822

Subject: iptables dry rules testing
From: Joris Huver <j.huver@networking4all.com>
To: Majordomo@vger.kernel.org
In-Reply-To: <S1755403Ab1CHOHd/20110308140733Z+70@vger.kernel.org>
References: <S1755403Ab1CHOHd/20110308140733Z+70@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Organization: Networking4all
Date: Tue, 08 Mar 2011 15:14:46 +0100
Message-ID: <1299593686.1838.35.camel@n4aworkstation>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Content-Transfer-Encoding: 7bit

Hi,

i've been searching for a way to test a rule set.

Would be nice if it can be done by asking iptables to check how a
situation is handled. Without having to generate actual traffic.

for instance via a 'check' flag or so.
iptables --check "type tcp source 10.163.199.239 dport 22 flag syn/ack"
and it returning that rule nr.x,y&z apply to it. 
Or some other cleverer way..


Is there some way it can be done?


Cheers


--=-WDkmZqYy8wcgjwjdCPYX--

