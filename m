From: Lihua Yuan <lihua.yuan@gmail.com>
Subject: what happens after ip_conntrack_max is reached?
Date: Tue, 29 Nov 2005 01:49:03 -0800
Message-ID: <cb426f710511290149v5b3aeef7qfea6b4d01fdf1ddd@mail.gmail.com>
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
    I'm wondering what happens after ip_conntrack_max is reached?
Reading the archive, I understand the UNREPLIED entries are removed in
favor of new connection. But other than that, it seems that new
connections will simply be dropped?  If this is the case, then new
clients might not be able to make a connection at all?


thanks for your help
Lihua

