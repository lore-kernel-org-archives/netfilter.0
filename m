From: =?iso-8859-1?Q?"Bj=F6rn=20Eberth"?= <Bjoern.Eberth@web.de>
Subject: Changing the ip_ct_tcp_timeout_established value
Date: Thu, 24 Mar 2005 10:23:56 +0100
Message-ID: <1132008238@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi there,

the default value for "ip_conntrack_tcp_timeout_established" is set to 5 days.
My problem is, that after about 2 days of using a filesharing client the ip_conntrack table runs full.
Im using a dial-up connection with 24 hours reconnect.
So my question is: Could i run into problems, if i set this value to 24 hours or something like this?

Regards
Bjoern
______________________________________________________________
Verschicken Sie romantische, coole und witzige Bilder per SMS!
Jetzt bei WEB.DE FreeMail: http://f.web.de/?mc=021193


