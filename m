From: "Bruno Nunes" <nunesb@gmail.com>
Subject: same ip to multiple hostnames block
Date: Mon, 17 Apr 2006 10:13:33 -0300
Message-ID: <52837e3e0604170613v2a6903fey50f0e983e5a04924@mail.gmail.com>
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

Hi,

I have:

intranet.xxxxxxxxxxx.com  -> ip A
zeus.xxxxxxxxxxx.com.  -> ip A

both are redirections made with iptables to make ip A (local) accessed
by world wide. When someone tries to access zeus or intranet by the
hostname the host machine running IIS knows which website the user is
trying to access.

my problem is:

how to block intranet.xxxxxxxx.com to be accessed by worldwide if it
has the same ip as zeus.xxxxxxx.com? can i block by hostnames instead
of an ip address??

thanks

