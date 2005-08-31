From: "FERNANDO COELHO MONTEIRO" <fernando@unimep.br>
Subject: iptables string match
Date: Wed, 31 Aug 2005 10:19:41 -0300
Message-ID: <20050831131730.M53420@unimep.br>
References: <20050829132736.M79345@unimep.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050829132736.M79345@unimep.br>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I am trying to compile my firewall Debian kernel v2.4.31 with patch-o-matic 
v20050823. My problem is that the option STRING Match not work. Below I 
describe the procedure that I used.

  runme extra (I select only "string match")

Compile the iptables v1.2.11

  make BINDIR=/sbin LIBDIR=/lib MANDIR=/usr/man 
  make BINDIR=/sbin LIBDIR=/lib MANDIR=/usr/man install

Until it does not give error. Running the "make menuconfig" (Networking 
options / IP: Netfilter Configuration) the option "string match support" 
does not appear available for election.

Option as psd, quota, ipp2p and others working with this procedure.

Could you please to help me in this question? 

Thanks for your attention.

Fernando.

