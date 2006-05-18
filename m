From: "Randy Grimshaw" <rgrimsha@syr.edu>
Subject: Re: Reserving bandwidth with iptables
Date: Thu, 18 May 2006 13:47:46 -0400
Message-ID: <s46c7b13.084@gwia202.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: zottmann <zottmann@ig.com.br>, netfilter@lists.netfilter.org

Do you really want to reserve bandwidth, or guarantee QOS quality of =
service to the 'vip'?
<><Randy


<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu

>>> zottmann <zottmann@ig.com.br> 5/18/2006 9:11:18 AM >>>
Hi !!=20

Our management asked us to reserve some bandwidth to our vip users, and, =
as=20
we use Squid proxy, I was thinking that we could achieve it by setting =
an=20
outgoing ip address at the Squid proxy based on the user=B4s group, and=20
reserve bandwidth at the iptables firewall based on this ip address.=20

Is this feasible? Can we reserve bandwidth with iptables alone, or shoule =
we=20
use another product as well?=20

Thanks in advance,=20
Carlos.=20




