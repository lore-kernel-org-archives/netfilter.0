From: Rakotomandimby Mihamina <mrakotom@free.fr>
Subject: compiling on kernel 2.4.22 ( /usr/src/linux/include/asm )
Date: Sun, 7 Sep 2003 18:01:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309071801.55405.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi all 
I just switched to kernel 2.4.22 and i got an error saying that "somthing is 
wrong" about /usr/src/linux/include/asm/errno.h .

What there is no /usr/src/linux/include/asm folder into the kernel sources , 
but there are "/usr/src/linux/include/asm-*" folders ( have a look yourselves 
)
so i just made a symlink : /usr/src/linux/include/asm that point on my 
archtecture and then it works .
Thanks .


