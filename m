From: afshin lamei <afshinlamei@gmail.com>
Subject: mport or multiport?
Date: Tue, 12 Jul 2005 14:56:07 +0430
Message-ID: <3115d56e05071203266e32e178@mail.gmail.com>
Reply-To: afshin lamei <afshinlamei@gmail.com>
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

Dear all,
"iptables -A INPUT -p tcp -m mport --ports 20:23,80 -j DROP " from
patch-o-matic is perfect, but what is that: Source port or Destination
port?
I know that with "multiport" i can detrmine source ans dest ports, but
it is not so good because it doesn't accept ranges (eg: 20:50).

