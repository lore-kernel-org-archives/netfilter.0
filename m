From: "Asfand Yar Qazi" <ayqazi@gmail.com>
Subject: Wierd output in netstat-nat
Date: Mon, 15 May 2006 11:59:54 +0100
Message-ID: <79328ea80605150359s5e208d12m62e3caab20cddc8d@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I ran netstat-nat on my home ADSL gateway thingy box (address
10.0.0.2), and I get some nice data detailing my brother's bittorrent
connections, and my father's web browsing.  But one line is quite
wierd:

Proto NATed Address                  Foreign Address                State
........................
tcp   62.77.122.254:80               10.0.0.1:12001                 ESTABLI=
SHED

Wha?!?!  I have port-forwarded 12001 onto my other box (which has
address 10.0.0.1), but this seems the other way round to what it
should be.

What's going on?  How can I find out more?

Thanks

