From: dileep reddy <dileep.dileep@gmail.com>
Subject: Changing priority of "filter table" at pre route hook
Date: Tue, 16 Aug 2005 15:24:56 +0400
Message-ID: <bfc2f1ff05081604246f1388f5@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,
I 've registered a function at "local in" hook with a priority of
NF_IP_PRI_RAW. When a packet arrives at "local in" hook, would this
function be called before the filter table?  If so, I want to lower
the priority of "filter table", ie NF_IP_PRI_FILTER at "local in" hook
than that of NF_IP_PRI_RAW so that this table would be called before
that of the function registered with RAW. How can I do that?

