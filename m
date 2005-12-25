From: Andy Lego <legoandy@gmail.com>
Subject: Forward specific port to another ip
Date: Sun, 25 Dec 2005 13:43:22 -0500
Message-ID: <a46d47540512251043i5cb5ed51k64c58f41f9afd9f5@mail.gmail.com>
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

I would like to forward all requests that come to system a.xx.com at
port 8080 to go to another system b.xx.com to port 80.

For example, I am running a web server on system b.xx.com, but I want
it to look like it is running on a.xx.com on different port.

Also, I want to do this on a.xx.com only, without touching the
firewall or b.xx.com.

Any ideas?

Thank you.

  Andy

