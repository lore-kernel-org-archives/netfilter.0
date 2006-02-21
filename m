From: "Yannick Deltroo" <deltroo@gmail.com>
Subject: multiple PPTP clients to same server
Date: Tue, 21 Feb 2006 22:48:15 +0100
Message-ID: <96b73a1a0602211348o3ac495a0u52b92d5597f03ebe@mail.gmail.com>
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

One quick question about the PPTP NAT helper:
Does it support multiple PPTP clients connecting to the same PPTP
server from behind a Netfilter NAT router  ?

I guess Call-Id could be used to track multiple calls in the same
control connection.

Cheers
Y. Deltroo

