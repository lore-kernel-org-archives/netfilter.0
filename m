From: Gabriel Paues <gabriel@sics.se>
Subject: Re: sk_buff
Date: Tue, 04 Jun 2002 10:35:49 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFC7BE5.FA258BE7@sics.se>
References: <001e01c20a47$2ebba380$8ad9abd4@luigicart>
Reply-To: gabriel@sics.se
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Luigi Cartuccia <luigicart@tin.it>
Cc: netfilter@lists.samba.org

Hi Luigi!

Nowadays the kernel comes with some documentation.

Type:

make htmldocs

in the linux source tree root and some nice docs will be generated. A
section about functions operating on sk_buff is included. Together with
the headerfile for sk_buff you should be able to sort things out. Check
out the Makefile (in the route of the linux source tree) for other
documentation variants. I think there is a pdfdocs as well.

Good luck!

/gabriel

Luigi Cartuccia wrote:

> Hi I'm Luigi.Where I can find material on sk_buff?Thank you


