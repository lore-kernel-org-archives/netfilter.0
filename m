From: =?ISO-8859-1?Q?S=F6ren_Lorenz?= <soeren.lorenz@web.de>
Subject: How to start external script when ipfilter rule matches
Date: Thu, 05 Aug 2004 22:39:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41129B17.5060805@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

I'd like to start Squid when packets arrive on port 3128 on my router.=20
When the router disconnects from my ISP, Squid is shutdown again.=20
Ideally the packets would be kept on hold until Squid is running and=20
then delivered to the daemon. Another question is to shutdown squid=20
after a certain time of inactivity on port 3128. Is there a way to=20
achive this with ipfilter?

Thanks in advance.

Regards,

S=F6ren Lorenz

