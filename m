From: =?koi8-r?Q?=22=ED=C9=C8=C1=C9=CC=22=20?=<michaelkl@mail.ru>
Subject: active connections
Date: Thu, 27 May 2004 12:30:19 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BTGHL-0003HX-00.michaelkl-mail-ru@f13.mail.ru>
Reply-To: =?koi8-r?Q?=22=ED=C9=C8=C1=C9=CC=22=20?=<michaelkl@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Mon, 3 May 2004 10:19:34 -0700 Daniel Chemko wrote:

>>> thanks
>>> but i m a student so i want to caputure the concept also. so please
>>> tell me the mystery or tell me about any tutorial about it.
>
>This is the wrong way to deal with dynamic table closures. What you want
>is a filter chain that explicitly drops unwanted sessions. Eventually
>the sessions will timeout on their own. I haven't used them, but there
>are also tools which can generate FIN/RST's on TCP connections which
>basically causes a graceful shutdown of the line.

Could you please name such a tools?
Or just point a direction, where I should look for it. :)


